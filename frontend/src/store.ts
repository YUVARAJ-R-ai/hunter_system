import { HunterData, Rank, Skill, Item } from './types';

const INITIAL_SKILLS: Skill[] = [
  { id: 's1', name: 'Iron Body', type: 'PASSIVE', mpCost: 0, requiredLevel: 5, category: 'FITNESS', description: 'Increases VIT by 5% permanently.', unlocked: false },
  { id: 's2', name: "Ruler's Authority", type: 'ACTIVE', mpCost: 50, requiredLevel: 20, category: 'STUDY', description: 'Intense focus boost for 30 minutes.', unlocked: false },
  { id: 's3', name: 'Daily Dash', type: 'ACTIVE', mpCost: 20, requiredLevel: 3, category: 'HEALTH', description: 'A burst of energy for physical activities.', unlocked: false },
  { id: 's4', name: 'Shadow Extraction', type: 'ACTIVE', mpCost: 100, requiredLevel: 50, category: 'WORK', description: 'Automate a complex task using your "shadows".', unlocked: false },
];

const INITIAL_ITEMS: Item[] = [
  { id: 'i1', name: 'Training Sword', type: 'Weapon', rarity: 'Common', stats: { STR: 2 }, equipped: false, description: 'A basic wooden sword for beginners.' },
  { id: 'i2', name: 'Hunter Cloak', type: 'Armor', rarity: 'Rare', stats: { VIT: 5, END: 3 }, equipped: false, description: 'Provides decent protection and agility.' },
];

export const INITIAL_DATA: HunterData = {
  uid: '',
  username: 'Sung Jin-Woo',
  level: 1,
  xp: 0,
  gold: 0,
  mana: 100,
  maxMana: 100,
  stats: {
    STR: 10,
    INT: 10,
    AGI: 10,
    VIT: 10,
    END: 10,
    SEN: 10,
  },
  statPoints: 0,
  hp: 100,
  shadows: [],
  listGroups: [
    { id: 'g1', name: 'My task', order: 1 },
    { id: 'g2', name: 'Entertainment', order: 2 },
    { id: 'g3', name: 'My bucket', order: 3 },
    { id: 'g4', name: 'Studies', order: 4 },
    { id: 'g5', name: 'Personal', order: 5 },
  ],
  lists: [
    { id: 'l1', name: 'Task to be done', groupId: 'g1', order: 1, category: 'WORK' },
    { id: 'l2', name: 'Weekly', groupId: 'g1', order: 2, category: 'WORK' },
    { id: 'l3', name: 'Movie list', groupId: 'g2', order: 1, category: 'SOCIAL' },
    { id: 'l4', name: 'Book list', groupId: 'g2', order: 2, category: 'STUDY' },
    { id: 'l5', name: 'anime', groupId: 'g2', order: 3, category: 'SOCIAL' },
    { id: 'l6', name: 'series', groupId: 'g2', order: 4, category: 'SOCIAL' },
    { id: 'l7', name: 'Things to buy', groupId: 'g3', order: 1, category: 'HEALTH' },
    { id: 'l8', name: 'Things to do', groupId: 'g3', order: 2, category: 'WORK' },
    { id: 'l9', name: 'Course and codding', groupId: 'g4', order: 1, category: 'STUDY' },
    { id: 'l10', name: 'Customize os', groupId: 'g4', order: 2, category: 'STUDY' },
    { id: 'l11', name: 'Toc', groupId: 'g4', order: 3, category: 'STUDY' },
    { id: 'l12', name: 'STS', groupId: 'g4', order: 4, category: 'STUDY' },
    { id: 'l13', name: 'Web programming', groupId: 'g4', order: 5, category: 'STUDY' },
    { id: 'l14', name: 'Dbms', groupId: 'g4', order: 6, category: 'STUDY' },
    { id: 'l15', name: 'Maths-probabilities', groupId: 'g4', order: 7, category: 'STUDY' },
    { id: 'l16', name: 'CN', groupId: 'g4', order: 8, category: 'STUDY' },
    { id: 'l17', name: 'Dosc', groupId: 'g4', order: 9, category: 'STUDY' },
  ],
  quests: [],
  bosses: [],
  skills: INITIAL_SKILLS,
  inventory: INITIAL_ITEMS,
  achievements: [
    { id: 'a1', name: 'First Blood', description: 'Complete your first quest.', unlocked: false },
    { id: 'a2', name: 'Level Up', description: 'Reach level 2.', unlocked: false },
    { id: 'a3', name: 'Boss Slayer', description: 'Defeat your first boss.', unlocked: false },
  ],
  habits: [
    { id: 'h1', name: 'No Junk Food', category: 'HEALTH', penaltyXP: 50, streak: 0 },
    { id: 'h2', name: 'Early Wake Up', category: 'HEALTH', penaltyXP: 30, streak: 0 },
  ],
  customRewards: [
    { id: 'r1', name: '1 Hour Gaming', cost: 200, description: 'Redeem for 1 hour of gaming time.', purchased: false },
    { id: 'r2', name: 'Cheat Meal', cost: 500, description: 'Enjoy a meal of your choice.', purchased: false },
  ],
  dailyLog: [],
};

export const getRank = (level: number): Rank => {
  if (level >= 50) return 'S';
  if (level >= 35) return 'A';
  if (level >= 25) return 'B';
  if (level >= 15) return 'C';
  if (level >= 8) return 'D';
  return 'E';
};

export const getTitle = (rank: Rank): string => {
  switch (rank) {
    case 'S': return 'Shadow Monarch';
    case 'A': return 'High Ranker';
    case 'B': return 'Veteran Hunter';
    case 'C': return 'Intermediate Hunter';
    case 'D': return 'Novice Hunter';
    case 'E': return 'E-Rank Hunter';
    default: return 'Ordinary Human';
  }
};

export const getXPNeeded = (level: number): number => level * 200;
