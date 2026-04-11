import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all habits
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM habits WHERE user_id = $1 ORDER BY created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get habits' }); }
});

// GET single habit
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM habits WHERE id = $1 AND user_id = $2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Habit not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to get habit' }); }
});

// POST create habit
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, category, penalty_xp, penalty_stat, penalty_stat_amount } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      `INSERT INTO habits (user_id, name, category, penalty_xp, penalty_stat, penalty_stat_amount)
       VALUES ($1,$2,$3,$4,$5,$6) RETURNING *`,
      [req.userId, name, category || 'HEALTH', penalty_xp ?? 50, penalty_stat || 'STR', penalty_stat_amount ?? 1]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create habit' }); }
});

// PUT update habit
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, category, penalty_xp, penalty_stat, penalty_stat_amount } = req.body;
    const result = await query(
      `UPDATE habits SET
        name=COALESCE($1,name), category=COALESCE($2,category),
        penalty_xp=COALESCE($3,penalty_xp), penalty_stat=COALESCE($4,penalty_stat),
        penalty_stat_amount=COALESCE($5,penalty_stat_amount)
       WHERE id=$6 AND user_id=$7 RETURNING *`,
      [name, category, penalty_xp, penalty_stat, penalty_stat_amount, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Habit not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update habit' }); }
});

// POST check-in — increments streak
router.post('/:id/checkin', async (req: AuthRequest, res: Response) => {
  try {
    const habitResult = await query('SELECT * FROM habits WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (habitResult.rows.length === 0) return res.status(404).json({ error: 'Habit not found' });
    const habit = habitResult.rows[0];
    const newStreak = (habit.streak || 0) + 1;
    await query('UPDATE habits SET streak=$1, last_completed=NOW() WHERE id=$2', [newStreak, habit.id]);
    res.json({ message: 'Habit checked in!', streak: newStreak });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to check in habit' }); }
});

// POST penalty — deducts XP and stat when habit is missed
router.post('/:id/penalty', async (req: AuthRequest, res: Response) => {
  try {
    const habitResult = await query('SELECT * FROM habits WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (habitResult.rows.length === 0) return res.status(404).json({ error: 'Habit not found' });
    const habit = habitResult.rows[0];

    const userResult = await query('SELECT xp FROM users WHERE id=$1', [req.userId]);
    const newXP = Math.max(0, userResult.rows[0].xp - habit.penalty_xp);
    await query('UPDATE users SET xp=$1 WHERE id=$2', [newXP, req.userId]);

    if (habit.penalty_stat && habit.penalty_stat_amount > 0) {
      const col = habit.penalty_stat.toLowerCase();
      const safeCol = col === 'int' || col === 'end' ? `"${col}"` : col;
      await query(`UPDATE hunter_stats SET ${safeCol}=GREATEST(1,${safeCol}-$1) WHERE user_id=$2`,
        [habit.penalty_stat_amount, req.userId]);
    }

    await query('UPDATE habits SET streak=0 WHERE id=$1', [habit.id]);
    res.json({ message: 'Penalty applied', xpDeducted: habit.penalty_xp, newXP });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to apply penalty' }); }
});

// DELETE habit
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM habits WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Habit not found' });
    res.json({ message: 'Habit deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete habit' }); }
});

export default router;
