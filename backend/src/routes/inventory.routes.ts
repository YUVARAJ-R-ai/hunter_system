import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all inventory items
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM inventory_items WHERE user_id=$1 ORDER BY created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get inventory' }); }
});

// GET single item
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM inventory_items WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Item not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to get item' }); }
});

// POST create item
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, type, rarity, description, stat_str, stat_int, stat_agi, stat_vit, stat_end, stat_sen } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      `INSERT INTO inventory_items
        (user_id, name, type, rarity, description, stat_str, stat_int, stat_agi, stat_vit, stat_end, stat_sen)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING *`,
      [
        req.userId, name, type || 'Artifact', rarity || 'Common', description || '',
        stat_str ?? 0, stat_int ?? 0, stat_agi ?? 0, stat_vit ?? 0, stat_end ?? 0, stat_sen ?? 0
      ]
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create item' }); }
});

// PUT update item
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, type, rarity, description, stat_str, stat_int, stat_agi, stat_vit, stat_end, stat_sen } = req.body;
    const result = await query(
      `UPDATE inventory_items SET
        name=COALESCE($1,name), type=COALESCE($2,type), rarity=COALESCE($3,rarity),
        description=COALESCE($4,description), stat_str=COALESCE($5,stat_str),
        stat_int=COALESCE($6,stat_int), stat_agi=COALESCE($7,stat_agi),
        stat_vit=COALESCE($8,stat_vit), stat_end=COALESCE($9,stat_end), stat_sen=COALESCE($10,stat_sen)
       WHERE id=$11 AND user_id=$12 RETURNING *`,
      [name, type, rarity, description, stat_str, stat_int, stat_agi, stat_vit, stat_end, stat_sen, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Item not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update item' }); }
});

// POST equip item
router.post('/:id/equip', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query(
      'UPDATE inventory_items SET equipped=true WHERE id=$1 AND user_id=$2 RETURNING *',
      [req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Item not found' });
    res.json({ message: 'Item equipped', item: result.rows[0] });
  } catch (err) { res.status(500).json({ error: 'Failed to equip item' }); }
});

// POST unequip item
router.post('/:id/unequip', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query(
      'UPDATE inventory_items SET equipped=false WHERE id=$1 AND user_id=$2 RETURNING *',
      [req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Item not found' });
    res.json({ message: 'Item unequipped', item: result.rows[0] });
  } catch (err) { res.status(500).json({ error: 'Failed to unequip item' }); }
});

// DELETE item
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM inventory_items WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Item not found' });
    res.json({ message: 'Item deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete item' }); }
});

export default router;
