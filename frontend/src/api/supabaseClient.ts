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
    const [uRes, statRes] = await Promise.all([
      supabase.from('users').select('*').eq('id', user.id).single(),
      supabase.from('hunter_stats').select('*').eq('user_id', user.id).single()
    ]);
    if (uRes.error) throw uRes.error;
    return { ...uRes.data, stats: statRes.data || {} };
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
      const { data, error } = await supabase.from(table).insert([{ ...payload, user_id: user.id }]).select().single();
      if (error) throw error;
      return data as T;
    },
    update: async (id: string, payload: Partial<T>) => {
      const { data, error } = await supabase.from(table).update(payload).eq('id', id).select().single();
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

export const logout = async () => {
  await supabase.auth.signOut();
}
