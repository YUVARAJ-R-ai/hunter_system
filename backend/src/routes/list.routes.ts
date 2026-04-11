import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all lists
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM lists WHERE user_id=$1 ORDER BY sort_order ASC, created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get lists' }); }
});

// GET single list
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM lists WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'List not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to get list' }); }
});

// POST create list
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, group_id, category, sort_order } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      'INSERT INTO lists (user_id, name, group_id, category, sort_order) VALUES ($1,$2,$3,$4,$5) RETURNING *',
      [req.userId, name, group_id || null, category || 'WORK', sort_order ?? 0]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create list' }); }
});

// PUT update list
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, group_id, category, sort_order } = req.body;
    const result = await query(
      `UPDATE lists SET
        name=COALESCE($1,name), group_id=COALESCE($2,group_id),
        category=COALESCE($3,category), sort_order=COALESCE($4,sort_order)
       WHERE id=$5 AND user_id=$6 RETURNING *`,
      [name, group_id, category, sort_order, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'List not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update list' }); }
});

// DELETE list
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM lists WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'List not found' });
    res.json({ message: 'List deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete list' }); }
});

export default router;
