import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';
import { calculateLevelUp, getRank, getTitle } from '../utils/gameLogic.js';

const router = Router();
router.use(authenticateToken);

router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM bosses WHERE user_id = $1 ORDER BY created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get bosses' }); }
});

router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, category, total_hp, xp_reward, difficulty } = req.body;
    const hp = total_hp || 500;
    const result = await query(
      'INSERT INTO bosses (user_id, name, category, total_hp, current_hp, xp_reward, difficulty) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *',
      [req.userId, name, category || 'WORK', hp, hp, xp_reward || 1000, difficulty || 'E']
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error('Create boss error:', err); res.status(500).json({ error: 'Failed to create boss' }); }
});

router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, category, total_hp, current_hp, xp_reward, difficulty } = req.body;
    const result = await query(
      'UPDATE bosses SET name=COALESCE($1,name), category=COALESCE($2,category), total_hp=COALESCE($3,total_hp), current_hp=COALESCE($4,current_hp), xp_reward=COALESCE($5,xp_reward), difficulty=COALESCE($6,difficulty) WHERE id=$7 AND user_id=$8 RETURNING *',
      [name, category, total_hp, current_hp, xp_reward, difficulty, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Boss not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update boss' }); }
});

router.post('/:id/damage', async (req: AuthRequest, res: Response) => {
  try {
    const { damage } = req.body;
    if (!damage || damage <= 0) return res.status(400).json({ error: 'Damage must be positive' });
    const bossResult = await query('SELECT * FROM bosses WHERE id = $1 AND user_id = $2', [req.params.id, req.userId]);
    if (bossResult.rows.length === 0) return res.status(404).json({ error: 'Boss not found' });
    const boss = bossResult.rows[0];
    if (boss.defeated) return res.status(400).json({ error: 'Boss already defeated' });
    const newHP = Math.max(0, boss.current_hp - damage);
    const defeated = newHP <= 0;
    await query('UPDATE bosses SET current_hp = $1, defeated = $2 WHERE id = $3', [newHP, defeated, boss.id]);
    let levelUpInfo = null;
    if (defeated) {
      const userResult = await query('SELECT level, xp FROM users WHERE id = $1', [req.userId]);
      const user = userResult.rows[0];
      const { newLevel, newXP, levelsGained } = calculateLevelUp(user.level, user.xp, boss.xp_reward);
      await query('UPDATE users SET level = $1, xp = $2 WHERE id = $3', [newLevel, newXP, req.userId]);
      const rank = getRank(newLevel);
      levelUpInfo = { xpAwarded: boss.xp_reward, levelsGained, newLevel, newXP, rank, title: getTitle(rank) };
    }
    res.json({ message: defeated ? 'Boss defeated!' : 'Damage dealt!', currentHP: newHP, totalHP: boss.total_hp, defeated, ...(levelUpInfo || {}) });
  } catch (err) { console.error('Boss damage error:', err); res.status(500).json({ error: 'Failed to deal damage' }); }
});

router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM bosses WHERE id = $1 AND user_id = $2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Boss not found' });
    res.json({ message: 'Boss deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete boss' }); }
});

export default router;
