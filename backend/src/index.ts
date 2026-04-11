import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { query } from './config/database.js';
import authRoutes from './routes/auth.routes.js';
import hunterRoutes from './routes/hunter.routes.js';
import questRoutes from './routes/quest.routes.js';
import bossRoutes from './routes/boss.routes.js';
import habitRoutes from './routes/habit.routes.js';
import skillRoutes from './routes/skill.routes.js';
import inventoryRoutes from './routes/inventory.routes.js';
import achievementRoutes from './routes/achievement.routes.js';
import rewardRoutes from './routes/reward.routes.js';
import listRoutes from './routes/list.routes.js';
import listGroupRoutes from './routes/listGroup.routes.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors({ origin: process.env.FRONTEND_URL || 'http://localhost:5173', credentials: true }));
app.use(express.json());

app.get('/health', async (_req, res) => {
  try {
    const result = await query('SELECT NOW()');
    res.json({ status: 'ok', db_time: result.rows[0].now });
  } catch (err) {
    res.status(500).json({ status: 'error', message: 'Database connection failed' });
  }
});

app.use('/api/auth', authRoutes);
app.use('/api/hunter', hunterRoutes);
app.use('/api/quests', questRoutes);
app.use('/api/bosses', bossRoutes);
app.use('/api/habits', habitRoutes);
app.use('/api/skills', skillRoutes);
app.use('/api/inventory', inventoryRoutes);
app.use('/api/achievements', achievementRoutes);
app.use('/api/rewards', rewardRoutes);
app.use('/api/lists', listRoutes);
app.use('/api/list-groups', listGroupRoutes);

app.listen(PORT, () => {
  console.log(`Hunter System API running on port ${PORT}`);
});
