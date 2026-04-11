import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all rewards
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM rewards WHERE user_id=$1 ORDER BY created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get rewards' }); }
});

// GET single reward
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM rewards WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Reward not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to get reward' }); }
});

// POST create reward
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, cost, description } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      'INSERT INTO rewards (user_id, name, cost, description) VALUES ($1,$2,$3,$4) RETURNING *',
      [req.userId, name, cost ?? 100, description || '']
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create reward' }); }
});

// PUT update reward
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, cost, description } = req.body;
    const result = await query(
      'UPDATE rewards SET name=COALESCE($1,name), cost=COALESCE($2,cost), description=COALESCE($3,description) WHERE id=$4 AND user_id=$5 RETURNING *',
      [name, cost, description, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Reward not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update reward' }); }
});

// POST purchase reward — deducts gold
router.post('/:id/purchase', async (req: AuthRequest, res: Response) => {
  try {
    const rewardResult = await query('SELECT * FROM rewards WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (rewardResult.rows.length === 0) return res.status(404).json({ error: 'Reward not found' });
    const reward = rewardResult.rows[0];
    if (reward.purchased) return res.status(400).json({ error: 'Reward already purchased' });

    const userResult = await query('SELECT gold FROM users WHERE id=$1', [req.userId]);
    const user = userResult.rows[0];
    if (user.gold < reward.cost) return res.status(400).json({ error: `Not enough gold (need ${reward.cost}, have ${user.gold})` });

    await query('UPDATE users SET gold=gold-$1 WHERE id=$2', [reward.cost, req.userId]);
    await query('UPDATE rewards SET purchased=true WHERE id=$1', [reward.id]);

    res.json({ message: `Reward purchased: ${reward.name}`, goldSpent: reward.cost, remainingGold: user.gold - reward.cost });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to purchase reward' }); }
});

// DELETE reward
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM rewards WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Reward not found' });
    res.json({ message: 'Reward deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete reward' }); }
});

export default router;
