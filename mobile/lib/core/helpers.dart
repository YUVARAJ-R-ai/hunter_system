/// Game logic helpers — mirrors the web frontend store.ts

String getRank(int level) {
  if (level >= 50) return 'S';
  if (level >= 35) return 'A';
  if (level >= 25) return 'B';
  if (level >= 15) return 'C';
  if (level >= 8) return 'D';
  return 'E';
}

String getTitle(String rank) {
  switch (rank) {
    case 'S': return 'Shadow Monarch';
    case 'A': return 'High Ranker';
    case 'B': return 'Veteran Hunter';
    case 'C': return 'Intermediate Hunter';
    case 'D': return 'Novice Hunter';
    case 'E': return 'E-Rank Hunter';
    default: return 'Ordinary Human';
  }
}

int getXPNeeded(int level) => level * 200;
