import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';
import { calculateLevelUp, getRank, getTitle } from '../utils/gameLogic.js';

const router = Router();
router.use(authenticateToken);

router.get('/profile', async (req: AuthRequest, res: Response) => {
  try {
    const userResult = await query(
      'SELECT id, email, username, level, xp, gold, mana, max_mana, created_at FROM users WHERE id = $1', [req.userId]
    );
    if (userResult.rows.length === 0) return res.status(404).json({ error: 'User not found' });

    const statsResult = await query('SELECT str, "int", agi, vit, "end", sen FROM hunter_stats WHERE user_id = $1', [req.userId]);
    const user = userResult.rows[0];
    const stats = statsResult.rows[0] || { str: 10, int: 10, agi: 10, vit: 10, end: 10, sen: 10 };
    const rank = getRank(user.level);

    res.json({ ...user, stats, rank, title: getTitle(rank) });
  } catch (err) {
    res.status(500).json({ error: 'Failed to get profile' });
  }
});

router.put('/profile', async (req: AuthRequest, res: Response) => {
  try {
    const { username, gold, mana, max_mana } = req.body;
    const result = await query(
      'UPDATE users SET username = COALESCE($1, username), gold = COALESCE($2, gold), mana = COALESCE($3, mana), max_mana = COALESCE($4, max_mana) WHERE id = $5 RETURNING id, username, level, xp, gold, mana, max_mana',
      [username, gold, mana, max_mana, req.userId]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to update profile' });
  }
});

router.put('/stats', async (req: AuthRequest, res: Response) => {
  try {
    const { str, int, agi, vit, end, sen } = req.body;
    const result = await query(
      'UPDATE hunter_stats SET str = COALESCE($1, str), "int" = COALESCE($2, "int"), agi = COALESCE($3, agi), vit = COALESCE($4, vit), "end" = COALESCE($5, "end"), sen = COALESCE($6, sen) WHERE user_id = $7 RETURNING *',
      [str, int, agi, vit, end, sen, req.userId]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Failed to update stats' });
  }
});

router.post('/add-xp', async (req: AuthRequest, res: Response) => {
  try {
    const { xp } = req.body;
    if (!xp || xp <= 0) return res.status(400).json({ error: 'XP must be positive' });

    const userResult = await query('SELECT level, xp FROM users WHERE id = $1', [req.userId]);
    const user = userResult.rows[0];
    const { newLevel, newXP, levelsGained } = calculateLevelUp(user.level, user.xp, xp);

    const result = await query(
      'UPDATE users SET level = $1, xp = $2 WHERE id = $3 RETURNING id, level, xp, gold',
      [newLevel, newXP, req.userId]
    );
    const rank = getRank(newLevel);
    res.json({ ...result.rows[0], levelsGained, rank, title: getTitle(rank) });
  } catch (err) {
    res.status(500).json({ error: 'Failed to add XP' });
  }
});

export default router;
