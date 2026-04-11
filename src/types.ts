export type Rank = 'E' | 'D' | 'C' | 'B' | 'A' | 'S';
export type QuestType = 'DAILY' | 'MAIN' | 'SIDE' | 'PENALTY' | 'EMERGENCY';
export type Difficulty = 'E' | 'D' | 'C' | 'B' | 'A' | 'S';
export type Category = 'FITNESS' | 'STUDY' | 'WORK' | 'HEALTH' | 'SOCIAL' | 'CREATIVITY';
export type ItemRarity = 'Common' | 'Rare' | 'Epic' | 'Legendary';
export type ItemType = 'Weapon' | 'Armor' | 'Consumable' | 'Rune' | 'Artifact';

export interface Stats {
  STR: number;
  INT: number;
  AGI: number;
  VIT: number;
  END: number;
  SEN: number;
}

export interface Quest {
  id: string;
  title: string;
  type: QuestType;
  difficulty: Difficulty;
  category: Category;
  xpReward: number;
  goldReward: number;
  statBoost: { stat: keyof Stats; amount: number };
  hasDeadline: boolean;
  deadline?: string;
  completed: boolean;
  failed: boolean;
  createdAt: number;
  listId?: string; // Reference to a List
  isImportant?: boolean; // Like MS To Do "Important"
  isMyDay?: boolean; // Like MS To Do "My Day"
}

export interface Boss {
  id: string;
  name: string;
  category: Category;
  totalHP: number;
  currentHP: number;
  xpReward: number;
  deadline?: string;
  difficulty: Difficulty;
  defeated: boolean;
}

export interface Skill {
  id: string;
  name: string;
  type: 'ACTIVE' | 'PASSIVE';
  mpCost: number;
  requiredLevel: number;
  category: Category;
  description: string;
  unlocked: boolean;
}

export interface Item {
  id: string;
  name: string;
  type: ItemType;
  rarity: ItemRarity;
  stats?: Partial<Stats>;
  equipped: boolean;
  description: string;
}

export interface Achievement {
  id: string;
  name: string;
  description: string;
  unlocked: boolean;
  unlockedAt?: number;
}

export interface Habit {
  id: string;
  name: string;
  category: Category;
  penaltyXP: number;
  penaltyStat?: { stat: keyof Stats; amount: number };
  streak: number;
  lastCompleted?: string;
}

export interface ListGroup {
  id: string;
  name: string;
  order: number;
}

export interface List {
  id: string;
  name: string;
  groupId?: string;
  order: number;
  category: Category;
}

export interface Reward {
  id: string;
  name: string;
  cost: number;
  description: string;
  purchased: boolean;
}

export interface HunterData {
  uid: string;
  username: string;
  level: number;
  xp: number;
  gold: number;
  mana: number;
  maxMana: number;
  stats: Stats;
  listGroups: ListGroup[];
  lists: List[];
  quests: Quest[];
  bosses: Boss[];
  skills: Skill[];
  inventory: Item[];
  achievements: Achievement[];
  habits: Habit[];
  customRewards: Reward[];
  dailyLog: { date: string; questId: string }[];
}
