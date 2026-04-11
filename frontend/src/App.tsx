/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState, useEffect, useMemo, useCallback } from 'react';
import { 
  User as UserIcon, 
  Shield, 
  Sword, 
  Zap, 
  Target, 
  Package, 
  Trophy, 
  Plus, 
  Check, 
  X, 
  Lock, 
  Unlock, 
  ChevronRight, 
  AlertCircle,
  Flame,
  Dumbbell,
  BookOpen,
  Briefcase,
  Heart,
  Users,
  Palette,
  RotateCcw,
  Coins,
  ShoppingCart,
  TrendingDown,
  TrendingUp,
  History,
  LayoutGrid,
  List as ListIcon,
  FolderPlus,
  LogOut,
  LogIn,
  Star,
  Calendar,
  Sun,
  ChevronDown,
  ChevronUp,
  MoreVertical,
  Settings
} from 'lucide-react';
import { 
  Radar, 
  RadarChart, 
  PolarGrid, 
  PolarAngleAxis, 
  ResponsiveContainer 
} from 'recharts';
import { motion, AnimatePresence } from 'motion/react';
import { cn } from './lib/utils';
import { 
  HunterData, 
  Quest, 
  Boss, 
  Skill, 
  Item, 
  Stats, 
  QuestType, 
  Difficulty, 
  Category,
  ItemRarity,
  ListGroup,
  List,
  Reward,
  Habit,
  Achievement
} from './types';
import { 
  getRank, 
  getTitle, 
  getXPNeeded,
  INITIAL_DATA
} from './store';
import {
  authAPI,
  hunterAPI,
  questAPI,
  bossAPI,
  habitAPI,
  skillAPI,
  inventoryAPI,
  achievementAPI,
  rewardAPI,
  listAPI,
  listGroupAPI,
  setToken,
  getToken,
} from './api/client';

// --- Components ---

const ProgressBar = ({ current, max, color = 'bg-accent-blue', label }: { current: number, max: number, color?: string, label?: string }) => {
  const percentage = Math.min(Math.max((current / max) * 100, 0), 100);
  return (
    <div className="w-full">
      {label && (
        <div className="flex justify-between mb-1 text-[10px] uppercase tracking-tighter font-mono">
          <span>{label}</span>
          <span>{Math.floor(current)} / {max}</span>
        </div>
      )}
      <div className="h-1.5 w-full bg-white/5 rounded-full overflow-hidden border border-white/10">
        <motion.div 
          initial={{ width: 0 }}
          animate={{ width: `${percentage}%` }}
          className={cn("h-full", color)}
        />
      </div>
    </div>
  );
};

interface CardProps {
  children: React.ReactNode;
  className?: string;
  glow?: boolean;
  onClick?: () => void;
  key?: React.Key;
}

const Card = ({ children, className, glow = false, onClick }: CardProps) => (
  <div 
    onClick={onClick}
    className={cn(
      "bg-white/5 border border-white/10 rounded-xl p-4 backdrop-blur-sm transition-all duration-300",
      glow && "glow-blue border-accent-blue/30",
      onClick && "cursor-pointer hover:bg-white/10",
      className
    )}
  >
    {children}
  </div>
);

const Badge = ({ children, color = 'bg-accent-blue' }: { children: React.ReactNode, color?: string }) => (
  <span className={cn("px-2 py-0.5 rounded text-[10px] font-orbitron uppercase tracking-wider text-white", color)}>
    {children}
  </span>
);

const SidebarItem = ({ icon, label, active, onClick, count }: { icon: React.ReactNode, label: string, active: boolean, onClick: () => void, count?: number, key?: string }) => (
  <button 
    onClick={onClick}
    className={cn(
      "w-full flex items-center justify-between px-3 py-2 rounded-lg transition-all duration-200 group",
      active ? "bg-accent-blue/20 text-accent-blue border border-accent-blue/30 shadow-[0_0_10px_rgba(30,144,255,0.1)]" : "text-white/60 hover:bg-white/5 hover:text-white"
    )}
  >
    <div className="flex items-center gap-3">
      <span className={cn("transition-colors", active ? "text-accent-blue" : "text-white/40 group-hover:text-white")}>{icon}</span>
      <span className="text-sm font-medium">{label}</span>
    </div>
    {count !== undefined && count > 0 && (
      <span className={cn("text-[10px] font-bold px-1.5 py-0.5 rounded-full", active ? "bg-accent-blue text-white" : "bg-white/10 text-white/40")}>
        {count}
      </span>
    )}
  </button>
);

export default function App() {
  // Auth state
  const [isLoggedIn, setIsLoggedIn] = useState(!!getToken());
  const [authMode, setAuthMode] = useState<'login' | 'register'>('login');
  const [authError, setAuthError] = useState<string | null>(null);
  const [authLoading, setAuthLoading] = useState(false);
  const [userEmail, setUserEmail] = useState('');

  // App data
  const [data, setData] = useState<HunterData>(INITIAL_DATA);
  const [activeTab, setActiveTab] = useState<'profile' | 'quests' | 'bosses' | 'skills' | 'inventory' | 'achievements' | 'habits' | 'rewards'>('profile');
  const [selectedListId, setSelectedListId] = useState<string | 'my-day' | 'important' | 'planned' | 'all'>('all');
  const [expandedGroups, setExpandedGroups] = useState<string[]>([]);
  
  const [showQuestModal, setShowQuestModal] = useState(false);
  const [showBossModal, setShowBossModal] = useState(false);
  const [showHabitModal, setShowHabitModal] = useState(false);
  const [showRewardModal, setShowRewardModal] = useState(false);
  const [showListModal, setShowListModal] = useState(false);
  const [showGroupModal, setShowGroupModal] = useState(false);
  const [victoryMessage, setVictoryMessage] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  // --- Data Fetch ---
  const refreshData = useCallback(async () => {
    if (!getToken()) { setIsLoading(false); return; }
    try {
      const [profile, quests, bosses, habits, skills, inventory, achievements, rewards, groupsData] = await Promise.all([
        hunterAPI.getProfile(),
        questAPI.getAll(),
        bossAPI.getAll(),
        habitAPI.getAll(),
        skillAPI.getAll(),
        inventoryAPI.getAll(),
        achievementAPI.getAll(),
        rewardAPI.getAll(),
        listGroupAPI.getAllWithLists(),
      ]);

      // Also fetch individual lists for sidebar
      const allLists = await listAPI.getAll();

      // Map DB snake_case to frontend camelCase
      const mappedQuests: Quest[] = quests.map((q: any) => ({
        id: q.id,
        title: q.title,
        type: q.type,
        difficulty: q.difficulty,
        category: q.category,
        xpReward: q.xp_reward,
        goldReward: q.gold_reward,
        statBoost: { stat: q.stat_boost_stat, amount: q.stat_boost_amount },
        hasDeadline: q.has_deadline,
        deadline: q.deadline,
        completed: q.completed,
        failed: q.failed,
        createdAt: new Date(q.created_at).getTime(),
        listId: q.list_id,
        isImportant: q.is_important,
        isMyDay: q.is_my_day,
      }));

      const mappedBosses: Boss[] = bosses.map((b: any) => ({
        id: b.id, name: b.name, category: b.category,
        totalHP: b.total_hp, currentHP: b.current_hp,
        xpReward: b.xp_reward, difficulty: b.difficulty, defeated: b.defeated,
      }));

      const mappedSkills: Skill[] = skills.map((s: any) => ({
        id: s.id, name: s.name, type: s.type, mpCost: s.mp_cost,
        requiredLevel: s.required_level, category: s.category,
        description: s.description, unlocked: s.unlocked,
      }));

      const mappedInventory: Item[] = inventory.map((i: any) => ({
        id: i.id, name: i.name, type: i.type, rarity: i.rarity,
        equipped: i.equipped, description: i.description,
        stats: {
          ...(i.stat_str ? { STR: i.stat_str } : {}),
          ...(i.stat_int ? { INT: i.stat_int } : {}),
          ...(i.stat_agi ? { AGI: i.stat_agi } : {}),
          ...(i.stat_vit ? { VIT: i.stat_vit } : {}),
          ...(i.stat_end ? { END: i.stat_end } : {}),
          ...(i.stat_sen ? { SEN: i.stat_sen } : {}),
        },
      }));

      const mappedAchievements: Achievement[] = achievements.map((a: any) => ({
        id: a.id, name: a.name, description: a.description,
        unlocked: a.unlocked, unlockedAt: a.unlocked_at ? new Date(a.unlocked_at).getTime() : undefined,
      }));

      const mappedHabits: Habit[] = habits.map((h: any) => ({
        id: h.id, name: h.name, category: h.category,
        penaltyXP: h.penalty_xp, streak: h.streak,
        lastCompleted: h.last_completed,
        penaltyStat: h.penalty_stat ? { stat: h.penalty_stat, amount: h.penalty_stat_amount || 0 } : undefined,
      }));

      const mappedRewards: Reward[] = rewards.map((r: any) => ({
        id: r.id, name: r.name, cost: r.cost,
        description: r.description, purchased: r.purchased,
      }));

      const mappedGroups: ListGroup[] = (groupsData.groups || []).map((g: any) => ({
        id: g.id, name: g.name, order: g.sort_order,
      }));

      const mappedLists: List[] = allLists.map((l: any) => ({
        id: l.id, name: l.name, groupId: l.group_id,
        order: l.sort_order, category: l.category,
      }));

      setData({
        uid: profile.id,
        username: profile.username,
        level: profile.level,
        xp: profile.xp,
        gold: profile.gold,
        mana: profile.mana,
        maxMana: profile.max_mana,
        stats: {
          STR: profile.stats?.str ?? 10,
          INT: profile.stats?.int ?? 10,
          AGI: profile.stats?.agi ?? 10,
          VIT: profile.stats?.vit ?? 10,
          END: profile.stats?.end ?? 10,
          SEN: profile.stats?.sen ?? 10,
        },
        listGroups: mappedGroups,
        lists: mappedLists,
        quests: mappedQuests,
        bosses: mappedBosses,
        skills: mappedSkills,
        inventory: mappedInventory,
        achievements: mappedAchievements,
        habits: mappedHabits,
        customRewards: mappedRewards,
        dailyLog: [],
      });

      setExpandedGroups(mappedGroups.map(g => g.id));
    } catch (err: any) {
      console.error('Failed to load data:', err);
      if (err.message?.includes('401') || err.message?.includes('403') || err.message?.includes('Invalid') || err.message?.includes('expired')) {
        handleLogout();
      }
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => { refreshData(); }, [refreshData]);

  // --- Auth Handlers ---
  const handleAuth = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setAuthError(null);
    setAuthLoading(true);
    const fd = new FormData(e.currentTarget);
    const email = fd.get('email') as string;
    const password = fd.get('password') as string;
    try {
      const result = authMode === 'register'
        ? await authAPI.register(email, password, fd.get('username') as string || undefined)
        : await authAPI.login(email, password);
      setToken(result.token);
      setUserEmail(email);
      setIsLoggedIn(true);
      refreshData();
    } catch (err: any) {
      setAuthError(err.message || 'Authentication failed');
    } finally {
      setAuthLoading(false);
    }
  };

  const handleLogout = () => {
    setToken(null);
    setIsLoggedIn(false);
    setUserEmail('');
    setData(INITIAL_DATA);
  };

  // --- Action Handlers ---
  const completeQuest = async (questId: string) => {
    try {
      const result = await questAPI.complete(questId);
      if (result.levelsGained > 0) {
        setVictoryMessage(`LEVEL UP! Now Level ${result.newLevel}`);
        setTimeout(() => setVictoryMessage(null), 3000);
      }
      await refreshData();
    } catch (err: any) { console.error('Complete quest error:', err); }
  };

  const failQuest = async (questId: string) => {
    try {
      await questAPI.update(questId, { failed: true } as any);
      await refreshData();
    } catch (err: any) { console.error('Fail quest error:', err); }
  };

  const dealDamage = async (bossId: string, amount: number) => {
    try {
      const result = await bossAPI.damage(bossId, amount);
      if (result.defeated) {
        const boss = data.bosses.find(b => b.id === bossId);
        setVictoryMessage(`BOSS DEFEATED: ${boss?.name || 'Unknown'}`);
        setTimeout(() => setVictoryMessage(null), 5000);
      }
      await refreshData();
    } catch (err: any) { console.error('Boss damage error:', err); }
  };

  const unlockSkill = async (skillId: string) => {
    try {
      await skillAPI.unlock(skillId);
      await refreshData();
    } catch (err: any) { console.error('Unlock skill error:', err); }
  };

  const toggleEquip = async (itemId: string) => {
    try {
      const item = data.inventory.find(i => i.id === itemId);
      if (item?.equipped) {
        await inventoryAPI.unequip(itemId);
      } else {
        await inventoryAPI.equip(itemId);
      }
      await refreshData();
    } catch (err: any) { console.error('Equip error:', err); }
  };

  const handleHabitCheckIn = async (habitId: string) => {
    try {
      await habitAPI.checkin(habitId);
      await refreshData();
    } catch (err: any) { console.error('Habit checkin error:', err); }
  };

  const handleHabitPenalty = async (habitId: string) => {
    try {
      await habitAPI.penalty(habitId);
      setVictoryMessage("PENALTY APPLIED");
      setTimeout(() => setVictoryMessage(null), 2000);
      await refreshData();
    } catch (err: any) { console.error('Habit penalty error:', err); }
  };

  const purchaseReward = async (rewardId: string) => {
    try {
      const result = await rewardAPI.purchase(rewardId);
      const reward = data.customRewards.find(r => r.id === rewardId);
      setVictoryMessage(`REWARD REDEEMED: ${reward?.name || ''}`);
      setTimeout(() => setVictoryMessage(null), 3000);
      await refreshData();
    } catch (err: any) { console.error('Purchase reward error:', err); }
  };

  const addList = async (name: string, groupId?: string) => {
    try {
      await listAPI.create({ name, group_id: groupId, sort_order: data.lists.length + 1 } as any);
      await refreshData();
    } catch (err: any) { console.error('Add list error:', err); }
  };

  const addGroup = async (name: string) => {
    try {
      await listGroupAPI.create({ name, sort_order: data.listGroups.length + 1 } as any);
      await refreshData();
    } catch (err: any) { console.error('Add group error:', err); }
  };

  // --- Derived State ---
  const currentRank = useMemo(() => getRank(data.level), [data.level]);
  const currentTitle = useMemo(() => getTitle(currentRank), [currentRank]);
  const xpNeeded = useMemo(() => getXPNeeded(data.level), [data.level]);

  const radarData = useMemo(() => [
    { subject: 'STR', A: data.stats.STR, fullMark: 100 },
    { subject: 'INT', A: data.stats.INT, fullMark: 100 },
    { subject: 'AGI', A: data.stats.AGI, fullMark: 100 },
    { subject: 'VIT', A: data.stats.VIT, fullMark: 100 },
    { subject: 'END', A: data.stats.END, fullMark: 100 },
    { subject: 'SEN', A: data.stats.SEN, fullMark: 100 },
  ], [data.stats]);

  // --- Render Helpers ---

  const getDifficultyColor = (diff: Difficulty) => {
    switch (diff) {
      case 'E': return 'border-rank-e text-rank-e';
      case 'D': return 'border-rank-d text-rank-d';
      case 'C': return 'border-rank-c text-rank-c';
      case 'B': return 'border-rank-b text-rank-b';
      case 'A': return 'border-rank-a text-rank-a';
      case 'S': return 'border-rank-s text-rank-s';
      default: return 'border-white/10';
    }
  };

  const getCategoryIcon = (cat: Category) => {
    switch (cat) {
      case 'FITNESS': return <Dumbbell className="w-4 h-4" />;
      case 'STUDY': return <BookOpen className="w-4 h-4" />;
      case 'WORK': return <Briefcase className="w-4 h-4" />;
      case 'HEALTH': return <Heart className="w-4 h-4" />;
      case 'SOCIAL': return <Users className="w-4 h-4" />;
      case 'CREATIVITY': return <Palette className="w-4 h-4" />;
    }
  };

  // --- Auth Screen ---
  if (!isLoggedIn) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background text-white p-6">
        <Card className="w-full max-w-md" glow>
          <div className="flex items-center gap-3 mb-8 justify-center">
            <div className="w-10 h-10 rounded-lg bg-accent-blue/20 border border-accent-blue/40 flex items-center justify-center glow-blue">
              <Flame className="text-accent-blue w-6 h-6" />
            </div>
            <h1 className="text-2xl font-black italic">Hunter System</h1>
          </div>

          <div className="flex mb-6 bg-white/5 rounded-lg p-1">
            <button onClick={() => { setAuthMode('login'); setAuthError(null); }} className={cn("flex-1 py-2 rounded-md text-sm font-bold transition-all", authMode === 'login' ? "bg-accent-blue text-white" : "text-white/50")}>
              Sign In
            </button>
            <button onClick={() => { setAuthMode('register'); setAuthError(null); }} className={cn("flex-1 py-2 rounded-md text-sm font-bold transition-all", authMode === 'register' ? "bg-accent-blue text-white" : "text-white/50")}>
              Register
            </button>
          </div>

          {authError && (
            <div className="bg-red-500/10 border border-red-500/30 text-red-400 px-4 py-2 rounded-lg mb-4 text-sm">
              {authError}
            </div>
          )}

          <form onSubmit={handleAuth} className="space-y-4">
            {authMode === 'register' && (
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Hunter Name</label>
                <input name="username" className="w-full bg-white/5 border border-white/10 rounded-lg p-3 text-sm focus:border-accent-blue outline-none" placeholder="Sung Jin-Woo" />
              </div>
            )}
            <div>
              <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Email</label>
              <input name="email" type="email" required className="w-full bg-white/5 border border-white/10 rounded-lg p-3 text-sm focus:border-accent-blue outline-none" placeholder="hunter@system.io" />
            </div>
            <div>
              <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Password</label>
              <input name="password" type="password" required minLength={6} className="w-full bg-white/5 border border-white/10 rounded-lg p-3 text-sm focus:border-accent-blue outline-none" placeholder="••••••••" />
            </div>
            <button type="submit" disabled={authLoading} className="w-full bg-accent-blue text-white py-3 rounded-lg font-orbitron text-sm font-bold glow-blue disabled:opacity-50">
              {authLoading ? 'PROCESSING...' : authMode === 'register' ? 'AWAKEN' : 'ENTER GATE'}
            </button>
          </form>
        </Card>
      </div>
    );
  }

  // --- Loading Screen ---
  if (isLoading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background text-white">
        <div className="flex flex-col items-center gap-4">
          <Flame className="w-12 h-12 text-accent-blue animate-pulse" />
          <p className="font-orbitron text-sm text-white/50">LOADING HUNTER DATA...</p>
        </div>
      </div>
    );
  }

  // Helper for updating quest flags (important/my-day)
  const updateQuestFlag = async (questId: string, field: 'is_important' | 'is_my_day', currentValue: boolean) => {
    try {
      await questAPI.update(questId, { [field]: !currentValue } as any);
      await refreshData();
    } catch (err: any) { console.error('Update quest flag error:', err); }
  };

  return (
    <div className="min-h-screen flex bg-background text-white font-sans selection:bg-accent-blue/30">
      {/* Sidebar */}
      <aside className="w-64 border-r border-white/10 flex-col hidden md:flex sticky top-0 h-screen overflow-y-auto custom-scrollbar">
        <div className="p-6 flex items-center gap-3">
          <div className="w-8 h-8 rounded-lg bg-accent-blue/20 border border-accent-blue/40 flex items-center justify-center glow-blue">
            <Flame className="text-accent-blue w-5 h-5" />
          </div>
          <h1 className="text-lg font-black italic">Hunter System</h1>
        </div>

        <nav className="flex-1 px-3 space-y-1">
          <SidebarItem 
            icon={<Sun className="w-4 h-4" />} 
            label="My Day" 
            active={selectedListId === 'my-day'} 
            onClick={() => { setSelectedListId('my-day'); setActiveTab('quests'); }} 
          />
          <SidebarItem 
            icon={<Star className="w-4 h-4" />} 
            label="Important" 
            active={selectedListId === 'important'} 
            onClick={() => { setSelectedListId('important'); setActiveTab('quests'); }} 
          />
          <SidebarItem 
            icon={<Calendar className="w-4 h-4" />} 
            label="Planned" 
            active={selectedListId === 'planned'} 
            onClick={() => { setSelectedListId('planned'); setActiveTab('quests'); }} 
          />
          <SidebarItem 
            icon={<ListIcon className="w-4 h-4" />} 
            label="All Quests" 
            active={selectedListId === 'all'} 
            onClick={() => { setSelectedListId('all'); setActiveTab('quests'); }} 
          />
          
          <div className="pt-4 pb-2 px-3 text-[10px] uppercase font-orbitron text-white/30 tracking-widest">RPG Systems</div>
          <SidebarItem icon={<UserIcon className="w-4 h-4" />} label="Profile" active={activeTab === 'profile'} onClick={() => setActiveTab('profile')} />
          <SidebarItem icon={<Shield className="w-4 h-4" />} label="Boss Raids" active={activeTab === 'bosses'} onClick={() => setActiveTab('bosses')} />
          <SidebarItem icon={<Zap className="w-4 h-4" />} label="Skill Tree" active={activeTab === 'skills'} onClick={() => setActiveTab('skills')} />
          <SidebarItem icon={<Package className="w-4 h-4" />} label="Inventory" active={activeTab === 'inventory'} onClick={() => setActiveTab('inventory')} />
          <SidebarItem icon={<Trophy className="w-4 h-4" />} label="Achievements" active={activeTab === 'achievements'} onClick={() => setActiveTab('achievements')} />
          <SidebarItem icon={<RotateCcw className="w-4 h-4" />} label="Habits" active={activeTab === 'habits'} onClick={() => setActiveTab('habits')} />
          <SidebarItem icon={<ShoppingCart className="w-4 h-4" />} label="Reward Shop" active={activeTab === 'rewards'} onClick={() => setActiveTab('rewards')} />

          <div className="pt-4 pb-2 px-3 text-[10px] uppercase font-orbitron text-white/30 tracking-widest flex justify-between items-center">
            <span>My Lists</span>
            <div className="flex gap-1">
              <button onClick={() => setShowListModal(true)} className="hover:text-white transition-colors"><Plus className="w-3 h-3" /></button>
              <button onClick={() => setShowGroupModal(true)} className="hover:text-white transition-colors"><FolderPlus className="w-3 h-3" /></button>
            </div>
          </div>

          {/* Groups and Lists */}
          {data.listGroups.sort((a, b) => a.order - b.order).map(group => (
            <div key={group.id} className="space-y-1">
              <button 
                onClick={() => setExpandedGroups(prev => prev.includes(group.id) ? prev.filter(id => id !== group.id) : [...prev, group.id])}
                className="w-full flex items-center justify-between px-3 py-2 text-sm font-medium text-white/60 hover:bg-white/5 rounded-lg transition-colors"
              >
                <div className="flex items-center gap-2">
                  <LayoutGrid className="w-4 h-4" />
                  <span>{group.name}</span>
                </div>
                {expandedGroups.includes(group.id) ? <ChevronUp className="w-3 h-3" /> : <ChevronDown className="w-3 h-3" />}
              </button>
              
              {expandedGroups.includes(group.id) && (
                <div className="pl-4 space-y-1">
                  {data.lists.filter(l => l.groupId === group.id).sort((a, b) => a.order - b.order).map(list => (
                    <SidebarItem 
                      key={list.id}
                      icon={<ListIcon className="w-3 h-3" />} 
                      label={list.name} 
                      active={selectedListId === list.id} 
                      onClick={() => { setSelectedListId(list.id); setActiveTab('quests'); }} 
                      count={data.quests.filter(q => q.listId === list.id && !q.completed).length}
                    />
                  ))}
                </div>
              )}
            </div>
          ))}

          {/* Ungrouped Lists */}
          {data.lists.filter(l => !l.groupId).sort((a, b) => a.order - b.order).map(list => (
            <SidebarItem 
              key={list.id}
              icon={<ListIcon className="w-4 h-4" />} 
              label={list.name} 
              active={selectedListId === list.id} 
              onClick={() => { setSelectedListId(list.id); setActiveTab('quests'); }} 
              count={data.quests.filter(q => q.listId === list.id && !q.completed).length}
            />
          ))}
        </nav>

        <div className="p-4 border-t border-white/10">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3 overflow-hidden">
              <div className="w-8 h-8 rounded-full border border-accent-blue/30 bg-accent-blue/20 flex items-center justify-center">
                <UserIcon className="w-4 h-4 text-accent-blue" />
              </div>
              <div className="overflow-hidden">
                <div className="text-xs font-bold truncate">{data.username}</div>
                <div className="text-[10px] text-white/40 truncate">Level {data.level}</div>
              </div>
            </div>
            <button onClick={handleLogout} className="p-2 hover:bg-white/5 rounded-lg text-white/40 hover:text-red-400 transition-colors">
              <LogOut className="w-4 h-4" />
            </button>
          </div>
        </div>
      </aside>

      <div className="flex-1 flex flex-col min-w-0">
        {/* Header */}
        <header className="sticky top-0 z-40 bg-background/80 backdrop-blur-md border-b border-white/10 px-6 py-4 flex justify-between items-center">
          <div className="flex items-center gap-3">
            <div className="md:hidden w-10 h-10 rounded-lg bg-accent-blue/20 border border-accent-blue/40 flex items-center justify-center glow-blue">
              <Flame className="text-accent-blue w-6 h-6" />
            </div>
            <div>
              <h1 className="text-xl font-black italic text-white md:hidden">Hunter System</h1>
              <div className="hidden md:block">
                <h2 className="text-xl font-black">{
                  selectedListId === 'my-day' ? 'My Day' :
                  selectedListId === 'important' ? 'Important' :
                  selectedListId === 'planned' ? 'Planned' :
                  selectedListId === 'all' ? 'All Quests' :
                  data.lists.find(l => l.id === selectedListId)?.name || 'Hunter System'
                }</h2>
                <p className="text-[10px] font-mono text-white/40">{new Date().toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' })}</p>
              </div>
            </div>
          </div>
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-2 bg-accent-gold/10 border border-accent-gold/20 px-3 py-1 rounded-full">
              <Coins className="w-4 h-4 text-accent-gold" />
              <span className="font-mono font-bold text-accent-gold">{data.gold}</span>
            </div>
            <div className="text-right hidden sm:block">
              <div className="text-[10px] uppercase font-orbitron text-white/50">Current Rank</div>
              <div className={cn("text-lg font-black font-orbitron", `text-rank-${currentRank.toLowerCase()}`)}>
                {currentRank}-RANK
              </div>
            </div>
            <div className="w-12 h-12 rounded-full border-2 border-accent-blue/50 p-0.5">
              <div className="w-full h-full rounded-full bg-accent-blue/20 flex items-center justify-center overflow-hidden">
                <UserIcon className="text-accent-blue w-6 h-6" />
              </div>
            </div>
          </div>
        </header>

        {/* Main Content */}
        <main className="max-w-4xl mx-auto w-full px-6 pt-8 pb-24">
        <AnimatePresence mode="wait">
          {activeTab === 'profile' && (
            <motion.div 
              key="profile"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className="space-y-6"
            >
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <Card className="md:col-span-2 relative overflow-hidden" glow>
                  <div className="absolute top-0 right-0 p-4">
                    <Badge color={`bg-rank-${currentRank.toLowerCase()}`}>{currentRank} RANK</Badge>
                  </div>
                  <div className="flex flex-col sm:flex-row gap-6 items-center sm:items-start">
                    <div className="w-32 h-32 rounded-xl border-2 border-accent-blue/30 bg-accent-blue/5 flex items-center justify-center relative">
                      <UserIcon className="w-16 h-16 text-accent-blue/40" />
                      <div className="absolute -bottom-3 left-1/2 -translate-x-1/2 bg-accent-blue text-white font-orbitron px-3 py-0.5 rounded-full text-xs font-bold">
                        LVL {data.level}
                      </div>
                    </div>
                    <div className="flex-1 space-y-4 text-center sm:text-left w-full">
                      <div>
                        <h2 className="text-2xl font-black">{data.username}</h2>
                        <p className="text-accent-gold font-orbitron text-xs tracking-widest">{currentTitle}</p>
                      </div>
                      <div className="space-y-3">
                        <ProgressBar current={data.xp} max={xpNeeded} label="Experience (XP)" color="bg-accent-blue" />
                        <ProgressBar current={data.mana} max={data.maxMana} label="Mana (MP)" color="bg-accent-purple" />
                      </div>
                    </div>
                  </div>
                </Card>
                <Card className="flex flex-col items-center justify-center">
                  <h3 className="text-xs font-orbitron text-white/50 mb-4">Stat Distribution</h3>
                  <div className="w-full h-48">
                    <ResponsiveContainer width="100%" height="100%">
                      <RadarChart cx="50%" cy="50%" outerRadius="80%" data={radarData}>
                        <PolarGrid stroke="#ffffff10" />
                        <PolarAngleAxis dataKey="subject" tick={{ fill: '#ffffff50', fontSize: 10, fontFamily: 'Orbitron' }} />
                        <Radar name="Stats" dataKey="A" stroke="#1e90ff" fill="#1e90ff" fillOpacity={0.3} />
                      </RadarChart>
                    </ResponsiveContainer>
                  </div>
                </Card>
              </div>
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-4">
                {Object.entries(data.stats).map(([stat, value]) => (
                  <Card key={stat} className="flex flex-col items-center py-6 hover:bg-white/10 transition-colors cursor-default group">
                    <span className="text-[10px] font-orbitron text-white/40 mb-1 group-hover:text-accent-blue transition-colors">{stat}</span>
                    <span className="text-2xl font-black font-mono text-accent-blue">{value}</span>
                  </Card>
                ))}
              </div>
            </motion.div>
          )}

          {activeTab === 'quests' && (
            <motion.div key="quests" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <div className="flex justify-between items-center">
                <h2 className="text-xl font-black">
                  {selectedListId === 'my-day' ? 'My Day' : 
                   selectedListId === 'important' ? 'Important Quests' :
                   selectedListId === 'planned' ? 'Planned Quests' :
                   selectedListId === 'all' ? 'All Quests' :
                   data.lists.find(l => l.id === selectedListId)?.name || 'Quests'}
                </h2>
                <button onClick={() => setShowQuestModal(true)} className="bg-accent-blue hover:bg-accent-blue/80 text-white px-4 py-2 rounded-lg font-orbitron text-xs flex items-center gap-2 transition-all glow-blue">
                  <Plus className="w-4 h-4" /> New Quest
                </button>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {data.quests.filter(q => {
                  if (q.completed || q.failed) return false;
                  if (selectedListId === 'all') return true;
                  if (selectedListId === 'important') return q.isImportant;
                  if (selectedListId === 'my-day') return q.isMyDay;
                  if (selectedListId === 'planned') return q.hasDeadline;
                  return q.listId === selectedListId;
                }).length === 0 ? (
                  <div className="col-span-full py-20 text-center text-white/30 font-orbitron italic">No active quests in this category.</div>
                ) : (
                  data.quests.filter(q => {
                    if (q.completed || q.failed) return false;
                    if (selectedListId === 'all') return true;
                    if (selectedListId === 'important') return q.isImportant;
                    if (selectedListId === 'my-day') return q.isMyDay;
                    if (selectedListId === 'planned') return q.hasDeadline;
                    return q.listId === selectedListId;
                  }).map(quest => (
                    <Card key={quest.id} className={cn("border-l-4", getDifficultyColor(quest.difficulty))}>
                      <div className="flex justify-between items-start mb-3">
                        <div className="flex items-center gap-2">
                          <span className="text-white/40">{getCategoryIcon(quest.category)}</span>
                          <Badge color="bg-white/10 text-white/60">{quest.type}</Badge>
                          {quest.isImportant && <Star className="w-3 h-3 text-accent-gold fill-accent-gold" />}
                          {quest.isMyDay && <Sun className="w-3 h-3 text-accent-blue" />}
                        </div>
                        <div className="flex items-center gap-2">
                          <button 
                            onClick={() => updateQuestFlag(quest.id, 'is_important', !!quest.isImportant)}
                            className={cn("p-1 rounded hover:bg-white/5 transition-colors", quest.isImportant ? "text-accent-gold" : "text-white/20")}
                            title="Toggle Important"
                          >
                            <Star className={cn("w-4 h-4", quest.isImportant && "fill-accent-gold")} />
                          </button>
                          <button 
                            onClick={() => updateQuestFlag(quest.id, 'is_my_day', !!quest.isMyDay)}
                            className={cn("p-1 rounded hover:bg-white/5 transition-colors", quest.isMyDay ? "text-accent-blue" : "text-white/20")}
                            title="Toggle My Day"
                          >
                            <Sun className="w-4 h-4" />
                          </button>
                          <span className={cn("font-orbitron text-xs font-bold", getDifficultyColor(quest.difficulty).split(' ')[1])}>
                            {quest.difficulty}-RANK
                          </span>
                        </div>
                      </div>
                      <h3 className="text-lg font-bold mb-2">{quest.title}</h3>
                      <div className="flex flex-wrap gap-3 text-[10px] font-mono text-white/50 mb-4">
                        <span className="flex items-center gap-1"><Zap className="w-3 h-3 text-accent-blue" /> +{quest.xpReward} XP</span>
                        <span className="flex items-center gap-1"><Target className="w-3 h-3 text-accent-gold" /> +{quest.statBoost.amount} {quest.statBoost.stat}</span>
                        {quest.hasDeadline && <span className="flex items-center gap-1 text-red-400"><AlertCircle className="w-3 h-3" /> {quest.deadline}</span>}
                      </div>
                      <div className="flex gap-2">
                        <button onClick={() => completeQuest(quest.id)} className="flex-1 bg-accent-blue/20 hover:bg-accent-blue text-accent-blue hover:text-white border border-accent-blue/30 py-2 rounded font-orbitron text-[10px] transition-all flex items-center justify-center gap-2">
                          <Check className="w-3 h-3" /> Complete
                        </button>
                        <button onClick={() => failQuest(quest.id)} className="px-3 bg-red-500/10 hover:bg-red-500 text-red-500 hover:text-white border border-red-500/30 py-2 rounded transition-all flex items-center justify-center">
                          <X className="w-3 h-3" />
                        </button>
                      </div>
                    </Card>
                  ))
                )}
              </div>
            </motion.div>
          )}

          {activeTab === 'bosses' && (
            <motion.div key="bosses" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <div className="flex justify-between items-center">
                <h2 className="text-xl font-black">Boss Raids</h2>
                <button onClick={() => setShowBossModal(true)} className="bg-accent-gold hover:bg-accent-gold/80 text-black px-4 py-2 rounded-lg font-orbitron text-xs flex items-center gap-2 transition-all glow-gold">
                  <Plus className="w-4 h-4" /> Summon Boss
                </button>
              </div>
              <div className="space-y-4">
                {data.bosses.filter(b => !b.defeated).length === 0 ? (
                  <div className="py-20 text-center text-white/30 font-orbitron italic">The dungeon is clear. No bosses detected.</div>
                ) : (
                  data.bosses.filter(b => !b.defeated).map(boss => (
                    <Card key={boss.id} className="relative overflow-hidden border-accent-gold/20" glow>
                      <div className="absolute top-0 right-0 p-4"><Badge color="bg-accent-gold text-black">{boss.difficulty} RANK</Badge></div>
                      <div className="flex flex-col md:flex-row gap-6 items-center">
                        <div className="w-24 h-24 rounded-full border-4 border-accent-gold/30 bg-accent-gold/5 flex items-center justify-center shrink-0">
                          <AlertCircle className="w-12 h-12 text-accent-gold" />
                        </div>
                        <div className="flex-1 w-full space-y-4">
                          <div>
                            <h3 className="text-xl font-black text-accent-gold">{boss.name}</h3>
                            <p className="text-[10px] font-orbitron text-white/40 uppercase tracking-widest">{boss.category} RAID</p>
                          </div>
                          <div className="space-y-2">
                            <div className="flex justify-between text-[10px] font-mono"><span>BOSS HP</span><span>{boss.currentHP} / {boss.totalHP}</span></div>
                            <div className="h-3 w-full bg-white/5 rounded-full overflow-hidden border border-white/10">
                              <motion.div initial={{ width: '100%' }} animate={{ width: `${(boss.currentHP / boss.totalHP) * 100}%` }}
                                className={cn("h-full transition-colors duration-500", boss.currentHP / boss.totalHP > 0.6 ? "bg-red-500" : boss.currentHP / boss.totalHP > 0.3 ? "bg-orange-500" : "bg-yellow-500")} />
                            </div>
                          </div>
                          <div className="flex gap-4 items-center">
                            <button onClick={() => { const damage = prompt("Enter damage amount (points of progress):"); if (damage && !isNaN(Number(damage))) dealDamage(boss.id, Number(damage)); }}
                              className="bg-accent-gold text-black px-6 py-2 rounded font-orbitron text-xs font-bold hover:bg-white transition-all shadow-[0_0_20px_rgba(240,192,64,0.4)]">
                              DEAL DAMAGE
                            </button>
                            <span className="text-[10px] font-mono text-white/40">REWARD: +{boss.xpReward} XP</span>
                          </div>
                        </div>
                      </div>
                    </Card>
                  ))
                )}
              </div>
              {data.bosses.filter(b => b.defeated).length > 0 && (
                <div className="pt-8">
                  <h3 className="text-sm font-orbitron text-white/30 mb-4">Defeated Bosses</h3>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 opacity-50">
                    {data.bosses.filter(b => b.defeated).map(boss => (
                      <Card key={boss.id} className="grayscale">
                        <div className="flex justify-between items-center"><h4 className="font-bold">{boss.name}</h4><Check className="text-green-500 w-4 h-4" /></div>
                      </Card>
                    ))}
                  </div>
                </div>
              )}
            </motion.div>
          )}

          {activeTab === 'skills' && (
            <motion.div key="skills" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <h2 className="text-xl font-black">Skill Tree</h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {data.skills.map(skill => (
                  <Card key={skill.id} className={cn("relative overflow-hidden transition-all", skill.unlocked ? "glow-purple border-accent-purple/30" : "opacity-60")}>
                    <div className="flex justify-between items-start mb-3">
                      <div className="p-2 rounded bg-white/5 border border-white/10">{skill.unlocked ? <Zap className="w-5 h-5 text-accent-purple" /> : <Lock className="w-5 h-5 text-white/20" />}</div>
                      <Badge color={skill.type === 'ACTIVE' ? 'bg-accent-blue' : 'bg-accent-gold'}>{skill.type}</Badge>
                    </div>
                    <h3 className={cn("text-lg font-bold mb-1", skill.unlocked ? "text-accent-purple" : "text-white/40")}>{skill.name}</h3>
                    <p className="text-xs text-white/60 mb-4 h-12 overflow-hidden">{skill.description}</p>
                    <div className="flex justify-between items-center">
                      <div className="text-[10px] font-mono text-white/40">{skill.unlocked ? <span className="text-accent-purple">ACQUIRED</span> : <span>REQ: LVL {skill.requiredLevel} | {skill.mpCost} MP</span>}</div>
                      {!skill.unlocked && (
                        <button disabled={data.level < skill.requiredLevel || data.mana < skill.mpCost} onClick={() => unlockSkill(skill.id)}
                          className={cn("px-4 py-1 rounded font-orbitron text-[10px] transition-all", data.level >= skill.requiredLevel && data.mana >= skill.mpCost ? "bg-accent-purple text-white hover:bg-accent-purple/80 glow-purple" : "bg-white/5 text-white/20 cursor-not-allowed")}>
                          UNLOCK
                        </button>
                      )}
                    </div>
                  </Card>
                ))}
              </div>
            </motion.div>
          )}

          {activeTab === 'inventory' && (
            <motion.div key="inventory" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <h2 className="text-xl font-black">Inventory</h2>
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                {data.inventory.length === 0 ? (
                  <div className="col-span-full py-20 text-center text-white/30 font-orbitron italic">Inventory empty. Complete quests to find loot.</div>
                ) : (
                  data.inventory.map(item => (
                    <Card key={item.id} className={cn("flex flex-col items-center text-center p-4 cursor-pointer hover:scale-105 transition-transform",
                        item.rarity === 'Legendary' ? 'border-accent-gold/50 shadow-[0_0_15px_rgba(240,192,64,0.2)]' :
                        item.rarity === 'Epic' ? 'border-accent-purple/50 shadow-[0_0_15px_rgba(123,97,255,0.2)]' :
                        item.rarity === 'Rare' ? 'border-accent-blue/50 shadow-[0_0_15px_rgba(30,144,255,0.2)]' : 'border-white/10'
                      )} onClick={() => toggleEquip(item.id)}>
                      <div className="w-16 h-16 rounded-lg bg-white/5 border border-white/10 flex items-center justify-center mb-3 relative">
                        {item.type === 'Weapon' ? <Sword className="w-8 h-8 text-white/40" /> : item.type === 'Armor' ? <Shield className="w-8 h-8 text-white/40" /> : <Package className="w-8 h-8 text-white/40" />}
                        {item.equipped && <div className="absolute -top-2 -right-2 bg-accent-blue text-white p-1 rounded-full"><Check className="w-3 h-3" /></div>}
                      </div>
                      <h4 className={cn("text-xs font-bold mb-1", item.rarity === 'Legendary' ? 'text-accent-gold' : item.rarity === 'Epic' ? 'text-accent-purple' : item.rarity === 'Rare' ? 'text-accent-blue' : 'text-white')}>{item.name}</h4>
                      <p className="text-[8px] font-mono text-white/40 uppercase mb-2">{item.rarity} {item.type}</p>
                      {item.stats && <div className="text-[8px] font-mono text-accent-blue">{Object.entries(item.stats).map(([s, v]) => `+${v} ${s}`).join(', ')}</div>}
                    </Card>
                  ))
                )}
              </div>
            </motion.div>
          )}

          {activeTab === 'achievements' && (
            <motion.div key="achievements" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <h2 className="text-xl font-black">Achievements</h2>
              <div className="space-y-3">
                {data.achievements.map(achievement => (
                  <Card key={achievement.id} className={cn("flex items-center gap-4 transition-all", achievement.unlocked ? "border-accent-gold/30 bg-accent-gold/5" : "opacity-40 grayscale")}>
                    <div className={cn("w-12 h-12 rounded-lg flex items-center justify-center shrink-0", achievement.unlocked ? "bg-accent-gold/20 text-accent-gold" : "bg-white/5 text-white/20")}>
                      <Trophy className="w-6 h-6" />
                    </div>
                    <div className="flex-1">
                      <h3 className={cn("text-sm font-bold", achievement.unlocked ? "text-accent-gold" : "text-white/60")}>{achievement.name}</h3>
                      <p className="text-xs text-white/40">{achievement.description}</p>
                    </div>
                    {achievement.unlocked && achievement.unlockedAt && <div className="text-[10px] font-mono text-accent-gold/60">{new Date(achievement.unlockedAt).toLocaleDateString()}</div>}
                  </Card>
                ))}
              </div>
            </motion.div>
          )}

          {activeTab === 'habits' && (
            <motion.div key="habits" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <div className="flex justify-between items-center">
                <h2 className="text-xl font-black">Habit Tracker</h2>
                <button onClick={() => setShowHabitModal(true)} className="bg-accent-purple hover:bg-accent-purple/80 text-white px-4 py-2 rounded-lg font-orbitron text-xs flex items-center gap-2 transition-all glow-purple">
                  <Plus className="w-4 h-4" /> New Habit
                </button>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {data.habits.map(habit => (
                  <Card key={habit.id} className="border-l-4 border-l-accent-purple">
                    <div className="flex justify-between items-start mb-4">
                      <div><div className="text-[10px] uppercase font-bold text-accent-purple mb-1">{habit.category}</div><h3 className="text-lg font-black text-white">{habit.name}</h3></div>
                      <div className="text-right"><div className="text-[10px] uppercase font-bold text-white/30">Streak</div><div className="text-xl font-black text-accent-blue font-mono">{habit.streak}d</div></div>
                    </div>
                    <div className="bg-white/5 p-3 rounded border border-white/10 mb-4">
                      <div className="text-[10px] uppercase font-bold text-white/50 mb-2">Penalty on Failure</div>
                      <div className="flex gap-4">
                        <div className="flex items-center gap-1 text-red-400 font-mono text-[10px]"><TrendingDown className="w-3 h-3" /> {habit.penaltyXP} XP</div>
                        {habit.penaltyStat && <div className="flex items-center gap-1 text-red-400 font-mono text-[10px]"><TrendingDown className="w-3 h-3" /> {habit.penaltyStat.amount} {habit.penaltyStat.stat}</div>}
                      </div>
                    </div>
                    <div className="flex gap-2">
                      <button onClick={() => handleHabitCheckIn(habit.id)} className="flex-1 bg-accent-blue/20 hover:bg-accent-blue text-accent-blue hover:text-white border border-accent-blue/30 py-2 rounded font-orbitron text-[10px] transition-all flex items-center justify-center gap-2">
                        <TrendingUp className="w-3 h-3" /> Check-in (+10G)
                      </button>
                      <button onClick={() => handleHabitPenalty(habit.id)} className="px-3 bg-red-500/10 hover:bg-red-500 text-red-500 hover:text-white border border-red-500/30 py-2 rounded transition-all flex items-center justify-center" title="Apply Penalty">
                        <History className="w-3 h-3" />
                      </button>
                    </div>
                  </Card>
                ))}
              </div>
            </motion.div>
          )}

          {activeTab === 'rewards' && (
            <motion.div key="rewards" initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -20 }} className="space-y-6">
              <div className="flex justify-between items-center">
                <h2 className="text-xl font-black">Reward Shop</h2>
                <button onClick={() => setShowRewardModal(true)} className="bg-accent-gold hover:bg-accent-gold/80 text-black px-4 py-2 rounded-lg font-orbitron text-xs flex items-center gap-2 transition-all glow-gold">
                  <Plus className="w-4 h-4" /> Add Reward
                </button>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
                {data.customRewards.map(reward => (
                  <Card key={reward.id} className={cn("relative overflow-hidden", reward.purchased ? "opacity-50 grayscale" : "")}>
                    <div className="flex justify-between items-start mb-2">
                      <h3 className="text-sm font-bold text-white">{reward.name}</h3>
                      <div className="flex items-center gap-1 text-accent-gold font-mono font-bold text-xs"><Coins className="w-3 h-3" /> {reward.cost}</div>
                    </div>
                    <p className="text-[10px] text-white/60 mb-4 h-8 line-clamp-2">{reward.description}</p>
                    <button disabled={reward.purchased || data.gold < reward.cost} onClick={() => purchaseReward(reward.id)}
                      className={cn("w-full py-2 rounded font-orbitron text-[10px] transition-all",
                        reward.purchased ? "bg-white/10 text-white/30 cursor-not-allowed" : data.gold >= reward.cost ? "bg-accent-gold hover:bg-accent-gold/80 text-black" : "bg-white/5 text-white/20 cursor-not-allowed")}>
                      {reward.purchased ? "CLAIMED" : "PURCHASE"}
                    </button>
                  </Card>
                ))}
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </main>

      {/* Navigation */}
      <nav className="fixed bottom-0 left-0 right-0 z-50 bg-background/90 backdrop-blur-lg border-t border-white/10 px-4 py-3">
        <div className="max-w-4xl mx-auto flex justify-between items-center">
          <NavButton active={activeTab === 'profile'} onClick={() => setActiveTab('profile')} icon={<UserIcon />} label="Profile" />
          <NavButton active={activeTab === 'quests'} onClick={() => setActiveTab('quests')} icon={<Target />} label="Quests" />
          <NavButton active={activeTab === 'habits'} onClick={() => setActiveTab('habits')} icon={<RotateCcw />} label="Habits" />
          <NavButton active={activeTab === 'rewards'} onClick={() => setActiveTab('rewards')} icon={<ShoppingCart />} label="Shop" />
          <NavButton active={activeTab === 'bosses'} onClick={() => setActiveTab('bosses')} icon={<AlertCircle />} label="Raids" />
          <NavButton active={activeTab === 'skills'} onClick={() => setActiveTab('skills')} icon={<Zap />} label="Skills" />
          <NavButton active={activeTab === 'inventory'} onClick={() => setActiveTab('inventory')} icon={<Package />} label="Items" />
          <NavButton active={activeTab === 'achievements'} onClick={() => setActiveTab('achievements')} icon={<Trophy />} label="Awards" />
        </div>
      </nav>

      {/* Victory Overlay */}
      <AnimatePresence>
        {victoryMessage && (
          <motion.div initial={{ opacity: 0, scale: 0.8 }} animate={{ opacity: 1, scale: 1 }} exit={{ opacity: 0, scale: 1.2 }}
            className="fixed inset-0 z-[100] flex items-center justify-center pointer-events-none">
            <div className="bg-accent-gold text-black px-12 py-6 rounded-xl font-black text-3xl font-orbitron italic shadow-[0_0_100px_rgba(240,192,64,0.6)] border-4 border-white animate-pulse">
              {victoryMessage}
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Quest Modal */}
      {showQuestModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-6 bg-background/90 backdrop-blur-sm">
          <Card className="w-full max-w-md bg-background border-accent-blue/30" glow>
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-black">Create Quest</h2>
              <button onClick={() => setShowQuestModal(false)} className="text-white/40 hover:text-white"><X /></button>
            </div>
            <form className="space-y-4" onSubmit={async (e) => {
              e.preventDefault();
              const fd = new FormData(e.currentTarget);
              try {
                await questAPI.create({
                  title: fd.get('title') as string,
                  type: fd.get('type') as string,
                  difficulty: fd.get('difficulty') as string,
                  category: fd.get('category') as string,
                  xp_reward: Number(fd.get('xp')),
                  gold_reward: Number(fd.get('goldReward')),
                  stat_boost_stat: fd.get('stat') as string,
                  stat_boost_amount: Number(fd.get('amount')),
                  has_deadline: !!fd.get('deadline'),
                  deadline: fd.get('deadline') as string || null,
                  list_id: (fd.get('listId') as string) || null,
                  is_important: !!fd.get('isImportant'),
                  is_my_day: false,
                } as any);
                await refreshData();
                setShowQuestModal(false);
              } catch (err) { console.error('Create quest error:', err); }
            }}>
              <div className="space-y-1">
                <label className="text-[10px] font-orbitron text-white/40 uppercase">Title</label>
                <input name="title" required className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm focus:border-accent-blue outline-none" placeholder="e.g. Morning Run" />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Type</label>
                  <select name="type" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-blue transition-colors">
                    <option value="DAILY" className="bg-background text-white">DAILY</option>
                    <option value="MAIN" className="bg-background text-white">MAIN</option>
                    <option value="SIDE" className="bg-background text-white">SIDE</option>
                    <option value="EMERGENCY" className="bg-background text-white">EMERGENCY</option>
                  </select>
                </div>
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Difficulty</label>
                  <select name="difficulty" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-blue transition-colors">
                    <option value="E" className="bg-background text-white">E-RANK</option>
                    <option value="D" className="bg-background text-white">D-RANK</option>
                    <option value="C" className="bg-background text-white">C-RANK</option>
                    <option value="B" className="bg-background text-white">B-RANK</option>
                    <option value="A" className="bg-background text-white">A-RANK</option>
                    <option value="S" className="bg-background text-white">S-RANK</option>
                  </select>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Category</label>
                  <select name="category" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-blue transition-colors">
                    <option value="FITNESS" className="bg-background text-white">FITNESS</option>
                    <option value="STUDY" className="bg-background text-white">STUDY</option>
                    <option value="WORK" className="bg-background text-white">WORK</option>
                    <option value="HEALTH" className="bg-background text-white">HEALTH</option>
                    <option value="SOCIAL" className="bg-background text-white">SOCIAL</option>
                    <option value="CREATIVITY" className="bg-background text-white">CREATIVITY</option>
                  </select>
                </div>
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Target List</label>
                  <select name="listId" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-blue transition-colors">
                    <option value="" className="bg-background text-white">No List</option>
                    {data.lists.map(l => (<option key={l.id} value={l.id} className="bg-background text-white">{l.name}</option>))}
                  </select>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Stat Boost</label>
                  <select name="stat" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-blue transition-colors">
                    <option value="STR" className="bg-background text-white">STR</option>
                    <option value="INT" className="bg-background text-white">INT</option>
                    <option value="AGI" className="bg-background text-white">AGI</option>
                    <option value="VIT" className="bg-background text-white">VIT</option>
                    <option value="END" className="bg-background text-white">END</option>
                    <option value="SEN" className="bg-background text-white">SEN</option>
                  </select>
                </div>
                <div className="flex items-center gap-4 pt-4">
                  <label className="flex items-center gap-2 cursor-pointer group">
                    <input type="checkbox" name="isImportant" className="hidden peer" />
                    <div className="w-4 h-4 border border-white/20 rounded flex items-center justify-center group-hover:border-accent-gold transition-colors peer-checked:bg-accent-gold peer-checked:border-accent-gold">
                      <Star className="w-3 h-3 text-black opacity-0 peer-checked:opacity-100" />
                    </div>
                    <span className="text-xs text-white/60">Important</span>
                  </label>
                </div>
              </div>
              <div className="grid grid-cols-3 gap-4">
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">XP Reward</label>
                  <input name="xp" type="number" defaultValue="100" className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm outline-none" />
                </div>
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Gold Reward</label>
                  <input name="goldReward" type="number" defaultValue="50" className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm outline-none" />
                </div>
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Stat Amount</label>
                  <input name="amount" type="number" defaultValue="1" className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm outline-none" />
                </div>
              </div>
              <button type="submit" className="w-full bg-accent-blue text-white py-3 rounded-lg font-orbitron text-sm font-bold glow-blue mt-4">ACCEPT QUEST</button>
            </form>
          </Card>
        </div>
      )}

      {/* List Modal */}
      {showListModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-6 bg-background/90 backdrop-blur-sm">
          <Card className="w-full max-w-md bg-background border-accent-blue/30" glow>
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-black">Create New List</h2>
              <button onClick={() => setShowListModal(false)} className="text-white/40 hover:text-white"><X /></button>
            </div>
            <form className="space-y-4" onSubmit={async (e) => {
              e.preventDefault();
              const fd = new FormData(e.currentTarget);
              const name = fd.get('name') as string;
              const groupId = fd.get('groupId') as string;
              if (!name) return;
              await addList(name, groupId || undefined);
              setShowListModal(false);
            }}>
              <div className="space-y-1">
                <label className="text-[10px] font-orbitron text-white/40 uppercase">List Name</label>
                <input name="name" required className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm focus:border-accent-blue outline-none" placeholder="e.g. Daily Exercises" />
              </div>
              <div className="space-y-1">
                <label className="text-[10px] font-orbitron text-white/40 uppercase">Add to Group (Optional)</label>
                <select name="groupId" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-blue transition-colors">
                  <option value="" className="bg-background text-white">No Group</option>
                  {data.listGroups.map(g => (<option key={g.id} value={g.id} className="bg-background text-white">{g.name}</option>))}
                </select>
              </div>
              <button type="submit" className="w-full bg-accent-blue text-white py-3 rounded-lg font-orbitron text-sm font-bold glow-blue mt-4">CREATE LIST</button>
            </form>
          </Card>
        </div>
      )}

      {/* Group Modal */}
      {showGroupModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-6 bg-background/90 backdrop-blur-sm">
          <Card className="w-full max-w-md bg-background border-accent-blue/30" glow>
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-black">Create New Group</h2>
              <button onClick={() => setShowGroupModal(false)} className="text-white/40 hover:text-white"><X /></button>
            </div>
            <form className="space-y-4" onSubmit={async (e) => {
              e.preventDefault();
              const fd = new FormData(e.currentTarget);
              const name = fd.get('name') as string;
              if (!name) return;
              await addGroup(name);
              setShowGroupModal(false);
            }}>
              <div className="space-y-1">
                <label className="text-[10px] font-orbitron text-white/40 uppercase">Group Name</label>
                <input name="name" required className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm focus:border-accent-blue outline-none" placeholder="e.g. Work Projects" />
              </div>
              <button type="submit" className="w-full bg-accent-blue text-white py-3 rounded-lg font-orbitron text-sm font-bold glow-blue mt-4">CREATE GROUP</button>
            </form>
          </Card>
        </div>
      )}

      {/* Boss Modal */}
      {showBossModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-6 bg-background/90 backdrop-blur-sm">
          <Card className="w-full max-w-md bg-background border-accent-gold/30" glow>
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-black text-accent-gold">Summon Boss</h2>
              <button onClick={() => setShowBossModal(false)} className="text-white/40 hover:text-white"><X /></button>
            </div>
            <form className="space-y-4" onSubmit={async (e) => {
              e.preventDefault();
              const fd = new FormData(e.currentTarget);
              try {
                await bossAPI.create({
                  name: fd.get('name') as string,
                  category: fd.get('category') as string,
                  total_hp: Number(fd.get('hp')),
                  xp_reward: Number(fd.get('xp')),
                  difficulty: fd.get('difficulty') as string,
                } as any);
                await refreshData();
                setShowBossModal(false);
              } catch (err) { console.error('Create boss error:', err); }
            }}>
              <div className="space-y-1">
                <label className="text-[10px] font-orbitron text-white/40 uppercase">Boss Name</label>
                <input name="name" required className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm focus:border-accent-gold outline-none" placeholder="e.g. The Final Exam" />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Total HP (Difficulty)</label>
                  <input name="hp" type="number" defaultValue="500" className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm outline-none" />
                </div>
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">XP Reward</label>
                  <input name="xp" type="number" defaultValue="1000" className="w-full bg-white/5 border border-white/10 rounded p-2 text-sm outline-none" />
                </div>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Category</label>
                  <select name="category" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-gold transition-colors">
                    <option value="FITNESS" className="bg-background text-white">FITNESS</option>
                    <option value="STUDY" className="bg-background text-white">STUDY</option>
                    <option value="WORK" className="bg-background text-white">WORK</option>
                    <option value="HEALTH" className="bg-background text-white">HEALTH</option>
                    <option value="SOCIAL" className="bg-background text-white">SOCIAL</option>
                    <option value="CREATIVITY" className="bg-background text-white">CREATIVITY</option>
                  </select>
                </div>
                <div className="space-y-1">
                  <label className="text-[10px] font-orbitron text-white/40 uppercase">Rank</label>
                  <select name="difficulty" className="w-full bg-white/10 border border-white/20 rounded p-2 text-sm outline-none focus:border-accent-gold transition-colors">
                    <option value="E" className="bg-background text-white">E-RANK</option>
                    <option value="D" className="bg-background text-white">D-RANK</option>
                    <option value="C" className="bg-background text-white">C-RANK</option>
                    <option value="B" className="bg-background text-white">B-RANK</option>
                    <option value="A" className="bg-background text-white">A-RANK</option>
                    <option value="S" className="bg-background text-white">S-RANK</option>
                  </select>
                </div>
              </div>
              <button type="submit" className="w-full bg-accent-gold text-black py-3 rounded-lg font-orbitron text-sm font-bold glow-gold mt-4">BEGIN RAID</button>
            </form>
          </Card>
        </div>
      )}

      {/* Habit Modal */}
      {showHabitModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-6 bg-background/90 backdrop-blur-sm">
          <Card className="w-full max-w-md bg-background border-accent-purple/30" glow>
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-black">New Habit Protocol</h2>
              <button onClick={() => setShowHabitModal(false)} className="text-white/40 hover:text-white"><X /></button>
            </div>
            <form className="space-y-4" onSubmit={async (e) => {
              e.preventDefault();
              const fd = new FormData(e.currentTarget);
              try {
                await habitAPI.create({
                  name: fd.get('name') as string,
                  category: fd.get('category') as string,
                  penalty_xp: Number(fd.get('penaltyXP')),
                  penalty_stat: (fd.get('penaltyStat') as string) || null,
                  penalty_stat_amount: Number(fd.get('penaltyAmount')) || 0,
                } as any);
                await refreshData();
                setShowHabitModal(false);
              } catch (err) { console.error('Create habit error:', err); }
            }}>
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Habit Name</label>
                <input name="name" required className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-purple outline-none" placeholder="e.g. No Sugar" />
              </div>
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Category</label>
                <select name="category" className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-purple outline-none">
                  <option value="HEALTH" className="bg-[#0a0f1e] text-white">Health</option>
                  <option value="FITNESS" className="bg-[#0a0f1e] text-white">Fitness</option>
                  <option value="STUDY" className="bg-[#0a0f1e] text-white">Study</option>
                  <option value="WORK" className="bg-[#0a0f1e] text-white">Work</option>
                  <option value="SOCIAL" className="bg-[#0a0f1e] text-white">Social</option>
                </select>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">XP Penalty</label>
                  <input name="penaltyXP" type="number" required className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-purple outline-none" placeholder="50" />
                </div>
                <div>
                  <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Stat Penalty</label>
                  <select name="penaltyStat" className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-purple outline-none">
                    <option value="" className="bg-[#0a0f1e] text-white">None</option>
                    <option value="STR" className="bg-[#0a0f1e] text-white">STR</option>
                    <option value="INT" className="bg-[#0a0f1e] text-white">INT</option>
                    <option value="AGI" className="bg-[#0a0f1e] text-white">AGI</option>
                    <option value="VIT" className="bg-[#0a0f1e] text-white">VIT</option>
                    <option value="END" className="bg-[#0a0f1e] text-white">END</option>
                    <option value="SEN" className="bg-[#0a0f1e] text-white">SEN</option>
                  </select>
                </div>
              </div>
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Stat Deduction Amount</label>
                <input name="penaltyAmount" type="number" className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-purple outline-none" placeholder="1" />
              </div>
              <button type="submit" className="w-full bg-accent-purple text-white font-black py-4 mt-4 hover:bg-accent-purple/80 transition-all">INITIALIZE HABIT</button>
            </form>
          </Card>
        </div>
      )}

      {/* Reward Modal */}
      {showRewardModal && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center p-6 bg-background/90 backdrop-blur-sm">
          <Card className="w-full max-w-md bg-background border-accent-gold/30" glow>
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-xl font-black">New Reward Protocol</h2>
              <button onClick={() => setShowRewardModal(false)} className="text-white/40 hover:text-white"><X /></button>
            </div>
            <form className="space-y-4" onSubmit={async (e) => {
              e.preventDefault();
              const fd = new FormData(e.currentTarget);
              try {
                await rewardAPI.create({
                  name: fd.get('name') as string,
                  cost: Number(fd.get('cost')),
                  description: fd.get('description') as string,
                } as any);
                await refreshData();
                setShowRewardModal(false);
              } catch (err) { console.error('Create reward error:', err); }
            }}>
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Reward Name</label>
                <input name="name" required className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-gold outline-none" placeholder="e.g. 1 Hour Gaming" />
              </div>
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Gold Cost</label>
                <input name="cost" type="number" required className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-gold outline-none" placeholder="100" />
              </div>
              <div>
                <label className="block text-[10px] uppercase font-orbitron text-white/40 mb-1">Description</label>
                <textarea name="description" className="w-full bg-white/5 border border-white/10 p-3 text-white focus:border-accent-gold outline-none h-24" placeholder="Describe the reward..." />
              </div>
              <button type="submit" className="w-full bg-accent-gold text-black font-black py-4 mt-4 hover:bg-accent-gold/80 transition-all">INITIALIZE REWARD</button>
            </form>
          </Card>
        </div>
      )}
    </div>
  </div>
);
}

const NavButton = ({ active, onClick, icon, label }: { active: boolean, onClick: () => void, icon: React.ReactNode, label: string }) => (
  <button 
    onClick={onClick}
    className={cn(
      "flex flex-col items-center gap-1 transition-all duration-300",
      active ? "text-accent-blue scale-110" : "text-white/40 hover:text-white/60"
    )}
  >
    <div className={cn(
      "p-1.5 rounded-lg transition-all",
      active && "bg-accent-blue/10 glow-blue"
    )}>
      {React.cloneElement(icon as React.ReactElement, { className: ((icon as any).props.className || "") + " w-5 h-5" } as any)}
    </div>
    <span className="text-[8px] font-orbitron uppercase tracking-tighter">{label}</span>
  </button>
);
