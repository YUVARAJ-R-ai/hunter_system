import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all achievements
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM achievements WHERE user_id=$1 ORDER BY created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get achievements' }); }
});

// GET single achievement
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM achievements WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Achievement not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to get achievement' }); }
});

// POST create achievement
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, description } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      'INSERT INTO achievements (user_id, name, description) VALUES ($1,$2,$3) RETURNING *',
      [req.userId, name, description || '']
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create achievement' }); }
});

// PUT update achievement
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, description } = req.body;
    const result = await query(
      'UPDATE achievements SET name=COALESCE($1,name), description=COALESCE($2,description) WHERE id=$3 AND user_id=$4 RETURNING *',
      [name, description, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Achievement not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update achievement' }); }
});

// POST unlock achievement
router.post('/:id/unlock', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query(
      'UPDATE achievements SET unlocked=true, unlocked_at=NOW() WHERE id=$1 AND user_id=$2 AND unlocked=false RETURNING *',
      [req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Achievement not found or already unlocked' });
    res.json({ message: 'Achievement unlocked!', achievement: result.rows[0] });
  } catch (err) { res.status(500).json({ error: 'Failed to unlock achievement' }); }
});

// DELETE achievement
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM achievements WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Achievement not found' });
    res.json({ message: 'Achievement deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete achievement' }); }
});

export default router;
