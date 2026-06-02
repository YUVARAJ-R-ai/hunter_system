import { supabase } from '../lib/supabase';

let currentSession: any = null;

// Fake standard sync token API to prevent refactoring App.tsx state management
export function setToken(token: string | null) { /* Supabase handles it naturally */ }
export function getToken(): string | null { 
  return localStorage.getItem('sb-frlmjkzyppswcxzdwxgr-auth-token') ? 'yes' : null;
}

// Ensure session state
supabase.auth.onAuthStateChange((event, session) => {
  currentSession = session;
  if (event === 'SIGNED_IN') setToken(session?.access_token || null);
  if (event === 'SIGNED_OUT') setToken(null);
});

async function getUser() {
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) throw new Error('Not authenticated');
  return user;
}

// --- Auth ---
export const authAPI = {
  register: async (email: string, password: string, username?: string) => {
    const { data, error } = await supabase.auth.signUp({
      email, password, options: { data: { username: username || email.split('@')[0] } }
    });
    if (error) throw error;
    return { token: data.session?.access_token || 'pending', user: data.user };
  },

  login: async (email: string, password: string) => {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) throw error;
    return { token: data.session!.access_token, user: data.user };
  },

  me: async () => {
    const user = await getUser();
    return user;
  },
};

// --- Hunter Profile ---
export const hunterAPI = {
  getProfile: async () => {
    const user = await getUser();
    const [uRes, statRes, shadowRes] = await Promise.all([
      supabase.from('users').select('*').eq('id', user.id).single(),
      supabase.from('hunter_stats').select('*').eq('user_id', user.id).single(),
      supabase.from('shadows').select('*').eq('user_id', user.id).order('extracted_at', { ascending: false })
    ]);
    if (uRes.error) throw uRes.error;
    return { ...uRes.data, stats: statRes.data || {}, shadows: shadowRes.data || [] };
  },
  updateProfile: async (data: any) => {
    const user = await getUser();
    const { error } = await supabase.from('users').update(data).eq('id', user.id);
    if (error) throw error;
    return data;
  },
  updateStats: async (data: any) => {
    const user = await getUser();
    const { error } = await supabase.from('hunter_stats').update(data).eq('user_id', user.id);
    if (error) throw error;
    return data;
  },
  addXP: async (xp: number) => {
    throw new Error("Add XP manually via RPC only");
  },
  allocateStatPoint: async (statToBoost: string, amount: number = 1) => {
    const { data, error } = await supabase.rpc('allocate_stat_point', { stat_to_boost: statToBoost, amount });
    if (error) throw error;
    return data;
  },
  extractShadow: async (bossId: string, shadowName: string) => {
    const { data, error } = await supabase.rpc('extract_shadow', { boss_id: bossId, shadow_name: shadowName });
    if (error) throw error;
    return data;
  },
  getShadows: async () => {
    const { data, error } = await supabase.from('shadows').select('*').order('extracted_at', { ascending: false });
    if (error) throw error;
    return data;
  },
  dailyCheckIn: async () => {
    const { data, error } = await supabase.rpc('daily_check_in');
    if (error) throw error;
    return data;
  },
  buyStreakShield: async () => {
    const { data, error } = await supabase.rpc('buy_streak_shield');
    if (error) throw error;
    return data;
  },
  recoverStreak: async (previousStreak: number) => {
    const { data, error } = await supabase.rpc('recover_streak', { previous_streak: previousStreak });
    if (error) throw error;
    return data;
  },
  toggleRestDay: async () => {
    const { data, error } = await supabase.rpc('toggle_rest_day');
    if (error) throw error;
    return data;
  },
};

// --- Generic CRUD factory ---
function createCRUD<T>(table: string) {
  return {
    getAll: async () => {
      const { data, error } = await supabase.from(table).select('*').order('created_at', { ascending: false });
      if (error) throw error;
      return data as T[];
    },
    getOne: async (id: string) => {
      const { data, error } = await supabase.from(table).select('*').eq('id', id).single();
      if (error) throw error;
      return data as T;
    },
    create: async (payload: Partial<T>) => {
      const user = await getUser();
      const { data, error } = await supabase.from(table).insert([{ ...payload, user_id: user.id } as any]).select().single();
      if (error) throw error;
      return data as T;
    },
    update: async (id: string, payload: Partial<T>) => {
      const { data, error } = await supabase.from(table).update(payload as any).eq('id', id).select().single();
      if (error) throw error;
      return data as T;
    },
    delete: async (id: string) => {
      const { error } = await supabase.from(table).delete().eq('id', id);
      if (error) throw error;
      return { message: 'Deleted successfully' };
    },
  };
}

// --- Quests ---
export const questAPI = {
  ...createCRUD<any>('quests'),
  complete: async (id: string) => {
    const { data, error } = await supabase.rpc('complete_quest', { quest_id: id });
    if (error) throw error;
    return data;
  },
  fail: async (id: string, applyPenalty: boolean = false) => {
    const user = await getUser();
    if (applyPenalty) {
      const { data: quest } = await supabase.from('quests').select('xp_reward').eq('id', id).single();
      if (quest) {
        const penaltyXP = Math.floor((quest.xp_reward || 0) / 2);
        const { data: profile } = await supabase.from('users').select('xp').eq('id', user.id).single();
        if (profile) {
          const newXP = Math.max(0, (profile.xp || 0) - penaltyXP);
          await supabase.from('users').update({ xp: newXP } as any).eq('id', user.id);
        }
      }
    }
    const { data, error } = await supabase.from('quests').update({ failed: true } as any).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
};

// --- Bosses ---
export const bossAPI = {
  ...createCRUD<any>('bosses'),
  damage: async (id: string, damage: number) => {
    const { data, error } = await supabase.rpc('deal_damage', { boss_id: id, damage: damage });
    if (error) throw error;
    return data;
  },
};

// --- Habits ---
export const habitAPI = {
  ...createCRUD<any>('habits'),
  checkin: async (id: string) => {
    const { data, error } = await supabase.from('habits').update({ last_completed: new Date().toISOString() }).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
  penalty: async (id: string) => {
    console.warn("Penalty not fully implemented");
    return { success: true };
  },
};

// --- Skills ---
export const skillAPI = {
  ...createCRUD<any>('skills'),
  unlock: async (id: string) => {
    const { data, error } = await supabase.from('skills').update({ unlocked: true }).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
};

// --- Inventory ---
export const inventoryAPI = {
  // Use inventory_items table
  ...createCRUD<any>('inventory_items'),
  equip: async (id: string) => {
    const { data, error } = await supabase.from('inventory_items').update({ equipped: true }).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
  unequip: async (id: string) => {
    const { data, error } = await supabase.from('inventory_items').update({ equipped: false }).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
};

// --- Achievements ---
export const achievementAPI = {
  ...createCRUD<any>('achievements'),
  unlock: async (id: string) => {
    const { data, error } = await supabase.from('achievements').update({ unlocked: true, unlocked_at: new Date().toISOString() }).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
};

// --- Rewards ---
export const rewardAPI = {
  ...createCRUD<any>('rewards'),
  purchase: async (id: string) => {
    const { data, error } = await supabase.from('rewards').update({ purchased: true }).eq('id', id).select().single();
    if (error) throw error;
    return data;
  },
};

// --- Lists ---
export const listAPI = createCRUD<any>('lists');

// --- List Groups ---
export const listGroupAPI = {
  ...createCRUD<any>('list_groups'),
  getAllWithLists: async () => {
    const { data: groups, error: gErr } = await supabase.from('list_groups').select('*');
    const { data: lists, error: lErr } = await supabase.from('lists').select('*').is('group_id', null);
    if (gErr) throw gErr;
    if (lErr) throw lErr;
    return { groups: groups || [], ungroupedLists: lists || [] };
  },
};

// --- Workout Tracker ---
export const workoutAPI = {
  getExercises: async () => {
    const { data, error } = await supabase.from('exercises').select('*').order('name');
    if (error) throw error;
    return data;
  },
  getTemplates: async () => {
    const user = await getUser();
    const { data: templates, error: tErr } = await supabase
      .from('workout_templates')
      .select('*')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false });
    if (tErr) throw tErr;

    const enriched = [];
    for (const t of (templates || [])) {
      const { data: exData, error: exErr } = await supabase
        .from('workout_template_exercises')
        .select('*, exercises(*)')
        .eq('template_id', t.id)
        .order('sort_order');
      if (exErr) throw exErr;
      enriched.push({ ...t, exercises: exData || [] });
    }
    return enriched;
  },
  createTemplate: async (name: string, description: string, exercises: any[]) => {
    const user = await getUser();
    const { data: tData, error: tErr } = await supabase
      .from('workout_templates')
      .insert({ user_id: user.id, name, description })
      .select()
      .single();
    if (tErr) throw tErr;

    for (let i = 0; i < exercises.length; i++) {
      const ex = exercises[i];
      const { error: eErr } = await supabase
        .from('workout_template_exercises')
        .insert({
          template_id: tData.id,
          exercise_id: ex.exercise_id || ex.id,
          sets_count: ex.sets_count || 3,
          reps_target: ex.reps_target || 10,
          sort_order: i,
        });
      if (eErr) throw eErr;
    }
    return tData;
  },
  deleteTemplate: async (id: string) => {
    const { error } = await supabase.from('workout_templates').delete().eq('id', id);
    if (error) throw error;
    return { success: true };
  },
  getLogs: async () => {
    const user = await getUser();
    const { data: logs, error: lErr } = await supabase
      .from('workout_logs')
      .select('*')
      .eq('user_id', user.id)
      .order('completed_at', { ascending: false });
    if (lErr) throw lErr;

    const enriched = [];
    for (const l of (logs || [])) {
      const { data: setData, error: sErr } = await supabase
        .from('workout_sets')
        .select('*, exercises(*)')
        .eq('log_id', l.id)
        .order('id');
      if (sErr) throw sErr;
      enriched.push({ ...l, sets: setData || [] });
    }
    return enriched;
  },
  createLog: async (name: string, templateId: string | null, startedAt: string, completedAt: string, durationSeconds: number, totalVolume: number, sets: any[]) => {
    const user = await getUser();
    const { data: lData, error: lErr } = await supabase
      .from('workout_logs')
      .insert({
        user_id: user.id,
        template_id: templateId,
        name,
        started_at: startedAt,
        completed_at: completedAt,
        duration_seconds: durationSeconds,
        total_volume_kg: totalVolume,
      })
      .select()
      .single();
    if (lErr) throw lErr;

    for (let i = 0; i < sets.length; i++) {
      const s = sets[i];
      const { error: sErr } = await supabase
        .from('workout_sets')
        .insert({
          log_id: lData.id,
          exercise_id: s.exercise_id || s.exercise?.id,
          set_number: s.set_number || (i + 1),
          weight: s.weight,
          reps: s.reps,
          rpe: s.rpe || null,
          is_warmup: s.is_warmup || false,
          is_completed: s.is_completed ?? true,
        });
      if (sErr) throw sErr;
    }

    // Award XP/Gold for completing workout
    const xpBase = 100;
    const goldBase = 50;
    const volumeBonusXp = Math.min(50, Math.floor(totalVolume / 100));
    const finalXp = xpBase + volumeBonusXp;

    const { data: profile } = await supabase.from('users').select('xp, gold, level').eq('id', user.id).single();
    if (profile) {
      let newXp = (profile.xp || 0) + finalXp;
      const newGold = (profile.gold || 0) + goldBase;
      let level = profile.level || 1;
      let xpNeeded = level * 200;

      while (newXp >= xpNeeded) {
        newXp -= xpNeeded;
        level++;
        xpNeeded = level * 200;
      }

      await supabase.from('users').update({ xp: newXp, gold: newGold, level }).eq('id', user.id);
    }

    return lData;
  },
  createCustomExercise: async (name: string, targetMuscle: string, description: string) => {
    const user = await getUser();
    const { data, error } = await supabase
      .from('exercises')
      .insert({
        user_id: user.id,
        name,
        target_muscle: targetMuscle,
        description: description || null,
      })
      .select()
      .single();
    if (error) throw error;
    return data;
  },
};

export const logout = async () => {
  await supabase.auth.signOut();
};
