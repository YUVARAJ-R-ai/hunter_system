export type Rank = 'E' | 'D' | 'C' | 'B' | 'A' | 'S';

export const getXPNeeded = (level: number): number => level * 200;

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

export interface LevelUpResult {
  newLevel: number;
  newXP: number;
  levelsGained: number;
}

export function calculateLevelUp(currentLevel: number, currentXP: number, xpToAdd: number): LevelUpResult {
  let newXP = currentXP + xpToAdd;
  let newLevel = currentLevel;
  let levelsGained = 0;

  while (newXP >= getXPNeeded(newLevel)) {
    newXP -= getXPNeeded(newLevel);
    newLevel++;
    levelsGained++;
  }

  return { newLevel, newXP, levelsGained };
}
