import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all list groups (with nested lists)
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const groupsResult = await query('SELECT * FROM list_groups WHERE user_id=$1 ORDER BY sort_order ASC', [req.userId]);
    const listsResult = await query('SELECT * FROM lists WHERE user_id=$1 ORDER BY sort_order ASC', [req.userId]);

    const groups = groupsResult.rows.map(group => ({
      ...group,
      lists: listsResult.rows.filter(list => list.group_id === group.id),
    }));

    const ungroupedLists = listsResult.rows.filter(list => !list.group_id);
    res.json({ groups, ungroupedLists });
  } catch (err) { res.status(500).json({ error: 'Failed to get list groups' }); }
});

// GET single group
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM list_groups WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Group not found' });

    const listsResult = await query('SELECT * FROM lists WHERE group_id=$1 AND user_id=$2 ORDER BY sort_order ASC', [req.params.id, req.userId]);
    res.json({ ...result.rows[0], lists: listsResult.rows });
  } catch (err) { res.status(500).json({ error: 'Failed to get group' }); }
});

// POST create group
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, sort_order } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      'INSERT INTO list_groups (user_id, name, sort_order) VALUES ($1,$2,$3) RETURNING *',
      [req.userId, name, sort_order ?? 0]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create group' }); }
});

// PUT update group
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, sort_order } = req.body;
    const result = await query(
      'UPDATE list_groups SET name=COALESCE($1,name), sort_order=COALESCE($2,sort_order) WHERE id=$3 AND user_id=$4 RETURNING *',
      [name, sort_order, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Group not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update group' }); }
});

// DELETE group
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM list_groups WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Group not found' });
    res.json({ message: 'Group deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete group' }); }
});

export default router;
