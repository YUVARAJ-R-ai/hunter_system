const API_BASE = (import.meta as any).env.VITE_API_URL || '/api';

let authToken: string | null = localStorage.getItem('hunter_token');

export function setToken(token: string | null) {
  authToken = token;
  if (token) {
    localStorage.setItem('hunter_token', token);
  } else {
    localStorage.removeItem('hunter_token');
  }
}

export function getToken(): string | null {
  return authToken;
}

async function request<T>(endpoint: string, options: RequestInit = {}): Promise<T> {
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
    ...(options.headers as Record<string, string> || {}),
  };

  if (authToken) {
    headers['Authorization'] = `Bearer ${authToken}`;
  }

  const res = await fetch(`${API_BASE}${endpoint}`, {
    ...options,
    headers,
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: res.statusText }));
    throw new Error(err.error || `Request failed: ${res.status}`);
  }

  return res.json();
}

// --- Auth ---
export const authAPI = {
  register: (email: string, password: string, username?: string) =>
    request<{ token: string; user: any }>('/auth/register', {
      method: 'POST',
      body: JSON.stringify({ email, password, username }),
    }),

  login: (email: string, password: string) =>
    request<{ token: string; user: any }>('/auth/login', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    }),

  me: () => request<any>('/auth/me'),
};

// --- Hunter Profile ---
export const hunterAPI = {
  getProfile: () => request<any>('/hunter/profile'),
  updateProfile: (data: any) =>
    request<any>('/hunter/profile', { method: 'PUT', body: JSON.stringify(data) }),
  updateStats: (data: any) =>
    request<any>('/hunter/stats', { method: 'PUT', body: JSON.stringify(data) }),
  addXP: (xp: number) =>
    request<any>('/hunter/add-xp', { method: 'POST', body: JSON.stringify({ xp }) }),
};

// --- Generic CRUD factory ---
function createCRUD<T>(basePath: string) {
  return {
    getAll: () => request<T[]>(basePath),
    getOne: (id: string) => request<T>(`${basePath}/${id}`),
    create: (data: Partial<T>) =>
      request<T>(basePath, { method: 'POST', body: JSON.stringify(data) }),
    update: (id: string, data: Partial<T>) =>
      request<T>(`${basePath}/${id}`, { method: 'PUT', body: JSON.stringify(data) }),
    delete: (id: string) =>
      request<{ message: string }>(`${basePath}/${id}`, { method: 'DELETE' }),
  };
}

// --- Quests ---
export const questAPI = {
  ...createCRUD<any>('/quests'),
  complete: (id: string) =>
    request<any>(`/quests/${id}/complete`, { method: 'POST' }),
};

// --- Bosses ---
export const bossAPI = {
  ...createCRUD<any>('/bosses'),
  damage: (id: string, damage: number) =>
    request<any>(`/bosses/${id}/damage`, { method: 'POST', body: JSON.stringify({ damage }) }),
};

// --- Habits ---
export const habitAPI = {
  ...createCRUD<any>('/habits'),
  checkin: (id: string) =>
    request<any>(`/habits/${id}/checkin`, { method: 'POST' }),
  penalty: (id: string) =>
    request<any>(`/habits/${id}/penalty`, { method: 'POST' }),
};

// --- Skills ---
export const skillAPI = {
  ...createCRUD<any>('/skills'),
  unlock: (id: string) =>
    request<any>(`/skills/${id}/unlock`, { method: 'POST' }),
};

// --- Inventory ---
export const inventoryAPI = {
  ...createCRUD<any>('/inventory'),
  equip: (id: string) =>
    request<any>(`/inventory/${id}/equip`, { method: 'POST' }),
  unequip: (id: string) =>
    request<any>(`/inventory/${id}/unequip`, { method: 'POST' }),
};

// --- Achievements ---
export const achievementAPI = {
  ...createCRUD<any>('/achievements'),
  unlock: (id: string) =>
    request<any>(`/achievements/${id}/unlock`, { method: 'POST' }),
};

// --- Rewards ---
export const rewardAPI = {
  ...createCRUD<any>('/rewards'),
  purchase: (id: string) =>
    request<any>(`/rewards/${id}/purchase`, { method: 'POST' }),
};

// --- Lists ---
export const listAPI = createCRUD<any>('/lists');

// --- List Groups ---
export const listGroupAPI = {
  ...createCRUD<any>('/list-groups'),
  getAllWithLists: () => request<{ groups: any[]; ungroupedLists: any[] }>('/list-groups'),
};
