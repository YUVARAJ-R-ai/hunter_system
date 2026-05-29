import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';
import { calculateLevelUp, getRank, getTitle } from '../utils/gameLogic.js';

const router = Router();
router.use(authenticateToken);

// GET all quests
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    // Auto-reset My Day for quests not updated today
    await query(
      'UPDATE quests SET is_my_day = false WHERE user_id = $1 AND is_my_day = true AND updated_at < CURRENT_DATE',
      [req.userId]
    );

    const result = await query(
      'SELECT * FROM quests WHERE user_id = $1 ORDER BY created_at DESC',
      [req.userId]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: 'Failed to get quests' });
  }
});

// GET single quest
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query(
      'SELECT * FROM quests WHERE id = $1 AND user_id = $2',
      [req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Quest not found' });
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to get quest' });
  }
});

// POST create quest
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const {
      title, type, difficulty, category, xp_reward, gold_reward,
      stat_boost_stat, stat_boost_amount, has_deadline, deadline,
      list_id, is_important, is_my_day
    } = req.body;

    const result = await query(
      `INSERT INTO quests (user_id, title, type, difficulty, category, xp_reward, gold_reward,
        stat_boost_stat, stat_boost_amount, has_deadline, deadline, list_id, is_important, is_my_day)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14) RETURNING *`,
      [
        req.userId, title, type || 'DAILY', difficulty || 'E', category || 'WORK',
        xp_reward || 100, gold_reward || 50, stat_boost_stat || 'STR',
        stat_boost_amount || 1, has_deadline || false, deadline || null,
        list_id || null, is_important || false, is_my_day || false
      ]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Create quest error:', err);
    res.status(500).json({ error: 'Failed to create quest' });
  }
});

// PUT update quest
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const {
      title, type, difficulty, category, xp_reward, gold_reward,
      stat_boost_stat, stat_boost_amount, has_deadline, deadline,
      list_id, is_important, is_my_day, completed, failed
    } = req.body;

    const result = await query(
      `UPDATE quests SET
        title = COALESCE($1, title), type = COALESCE($2, type),
        difficulty = COALESCE($3, difficulty), category = COALESCE($4, category),
        xp_reward = COALESCE($5, xp_reward), gold_reward = COALESCE($6, gold_reward),
        stat_boost_stat = COALESCE($7, stat_boost_stat), stat_boost_amount = COALESCE($8, stat_boost_amount),
        has_deadline = COALESCE($9, has_deadline), deadline = COALESCE($10, deadline),
        list_id = COALESCE($11, list_id), is_important = COALESCE($12, is_important),
        is_my_day = COALESCE($13, is_my_day), completed = COALESCE($14, completed),
        failed = COALESCE($15, failed)
       WHERE id = $16 AND user_id = $17 RETURNING *`,
      [
        title, type, difficulty, category, xp_reward, gold_reward,
        stat_boost_stat, stat_boost_amount, has_deadline, deadline,
        list_id, is_important, is_my_day, completed, failed,
        req.params.id, req.userId
      ]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Quest not found' });
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to update quest' });
  }
});

// POST complete quest — awards XP, gold, stat boosts
router.post('/:id/complete', async (req: AuthRequest, res: Response) => {
  try {
    const questResult = await query(
      'SELECT * FROM quests WHERE id = $1 AND user_id = $2',
      [req.params.id, req.userId]
    );
    if (questResult.rows.length === 0) return res.status(404).json({ error: 'Quest not found' });

    const quest = questResult.rows[0];
    if (quest.completed) return res.status(400).json({ error: 'Quest already completed' });

    // Mark quest completed
    await query('UPDATE quests SET completed = true WHERE id = $1', [quest.id]);

    // Award gold
    await query('UPDATE users SET gold = gold + $1 WHERE id = $2', [quest.gold_reward, req.userId]);

    // Award XP with auto-leveling
    const userResult = await query('SELECT level, xp FROM users WHERE id = $1', [req.userId]);
    const user = userResult.rows[0];
    const { newLevel, newXP, levelsGained } = calculateLevelUp(user.level, user.xp, quest.xp_reward);
    await query('UPDATE users SET level = $1, xp = $2 WHERE id = $3', [newLevel, newXP, req.userId]);

    // Award stat boost
    const statCol = quest.stat_boost_stat.toLowerCase();
    const safeStatCol = statCol === 'int' || statCol === 'end' ? `"${statCol}"` : statCol;
    await query(
      `UPDATE hunter_stats SET ${safeStatCol} = ${safeStatCol} + $1 WHERE user_id = $2`,
      [quest.stat_boost_amount, req.userId]
    );

    // Log to daily_log
    await query('INSERT INTO daily_log (user_id, quest_id) VALUES ($1, $2)', [req.userId, quest.id]);

    const rank = getRank(newLevel);
    res.json({
      message: 'Quest completed!',
      xpAwarded: quest.xp_reward,
      goldAwarded: quest.gold_reward,
      statBoosted: { stat: quest.stat_boost_stat, amount: quest.stat_boost_amount },
      levelsGained,
      newLevel,
      newXP,
      rank,
      title: getTitle(rank),
    });
  } catch (err) {
    console.error('Complete quest error:', err);
    res.status(500).json({ error: 'Failed to complete quest' });
  }
});

// POST fail quest
router.post('/:id/fail', async (req: AuthRequest, res: Response) => {
  try {
    const { applyPenalty } = req.body;
    const questResult = await query('SELECT * FROM quests WHERE id = $1 AND user_id = $2', [req.params.id, req.userId]);
    if (questResult.rows.length === 0) return res.status(404).json({ error: 'Quest not found' });
    const quest = questResult.rows[0];

    if (quest.completed || quest.failed) return res.status(400).json({ error: 'Quest already completed or failed' });

    if (applyPenalty) {
      // Deduct half the reward XP as penalty, floor at 0
      const penaltyXP = Math.floor(quest.xp_reward / 2);
      await query(
        `UPDATE users SET xp = GREATEST(0, xp - $1) WHERE id = $2`,
        [penaltyXP, req.userId]
      );
    }

    const updatedQuest = await query(
      'UPDATE quests SET failed = true WHERE id = $1 RETURNING *',
      [req.params.id]
    );

    res.json({
      quest: updatedQuest.rows[0],
      message: 'Quest failed'
    });
  } catch (err) {
    console.error('Fail quest error:', err);
    res.status(500).json({ error: 'Failed to fail quest' });
  }
});

// DELETE quest
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query(
      'DELETE FROM quests WHERE id = $1 AND user_id = $2 RETURNING id',
      [req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Quest not found' });
    res.json({ message: 'Quest deleted' });
  } catch (err) {
    res.status(500).json({ error: 'Failed to delete quest' });
  }
});

export default router;
