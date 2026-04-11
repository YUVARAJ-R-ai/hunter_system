import { Router, Response } from 'express';
import { query } from '../config/database.js';
import { authenticateToken, AuthRequest } from '../middleware/auth.js';

const router = Router();
router.use(authenticateToken);

// GET all skills
router.get('/', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM skills WHERE user_id=$1 ORDER BY created_at DESC', [req.userId]);
    res.json(result.rows);
  } catch (err) { res.status(500).json({ error: 'Failed to get skills' }); }
});

// GET single skill
router.get('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('SELECT * FROM skills WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Skill not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to get skill' }); }
});

// POST create skill
router.post('/', async (req: AuthRequest, res: Response) => {
  try {
    const { name, type, mp_cost, required_level, category, description } = req.body;
    if (!name) return res.status(400).json({ error: 'Name is required' });
    const result = await query(
      `INSERT INTO skills (user_id, name, type, mp_cost, required_level, category, description)
       VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING *`,
      [req.userId, name, type || 'ACTIVE', mp_cost ?? 0, required_level ?? 1, category || 'FITNESS', description || '']
    );
    res.status(201).json(result.rows[0]);
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to create skill' }); }
});

// PUT update skill
router.put('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const { name, type, mp_cost, required_level, category, description } = req.body;
    const result = await query(
      `UPDATE skills SET
        name=COALESCE($1,name), type=COALESCE($2,type), mp_cost=COALESCE($3,mp_cost),
        required_level=COALESCE($4,required_level), category=COALESCE($5,category),
        description=COALESCE($6,description)
       WHERE id=$7 AND user_id=$8 RETURNING *`,
      [name, type, mp_cost, required_level, category, description, req.params.id, req.userId]
    );
    if (result.rows.length === 0) return res.status(404).json({ error: 'Skill not found' });
    res.json(result.rows[0]);
  } catch (err) { res.status(500).json({ error: 'Failed to update skill' }); }
});

// POST unlock skill — checks user level and mana, marks unlocked
router.post('/:id/unlock', async (req: AuthRequest, res: Response) => {
  try {
    const skillResult = await query('SELECT * FROM skills WHERE id=$1 AND user_id=$2', [req.params.id, req.userId]);
    if (skillResult.rows.length === 0) return res.status(404).json({ error: 'Skill not found' });
    const skill = skillResult.rows[0];
    if (skill.unlocked) return res.status(400).json({ error: 'Skill already unlocked' });

    const userResult = await query('SELECT level, mana FROM users WHERE id=$1', [req.userId]);
    const user = userResult.rows[0];
    if (user.level < skill.required_level)
      return res.status(400).json({ error: `Requires level ${skill.required_level}` });
    if (user.mana < skill.mp_cost)
      return res.status(400).json({ error: `Insufficient mana (need ${skill.mp_cost})` });

    await query('UPDATE skills SET unlocked=true WHERE id=$1', [skill.id]);
    await query('UPDATE users SET mana=mana-$1 WHERE id=$2', [skill.mp_cost, req.userId]);

    res.json({ message: `${skill.name} unlocked!`, mpSpent: skill.mp_cost });
  } catch (err) { console.error(err); res.status(500).json({ error: 'Failed to unlock skill' }); }
});

// DELETE skill
router.delete('/:id', async (req: AuthRequest, res: Response) => {
  try {
    const result = await query('DELETE FROM skills WHERE id=$1 AND user_id=$2 RETURNING id', [req.params.id, req.userId]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Skill not found' });
    res.json({ message: 'Skill deleted' });
  } catch (err) { res.status(500).json({ error: 'Failed to delete skill' }); }
});

export default router;
