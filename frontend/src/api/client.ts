import * as restClient from './restClient';
import * as supabaseClient from './supabaseClient';

const useSupabase = false; // Forced to local backend to avoid Supabase rate limits

const activeClient = useSupabase ? supabaseClient : restClient;

export const setToken = activeClient.setToken;
export const getToken = activeClient.getToken;
export const authAPI = activeClient.authAPI;
export const hunterAPI = activeClient.hunterAPI;
export const questAPI = activeClient.questAPI;
export const bossAPI = activeClient.bossAPI;
export const habitAPI = activeClient.habitAPI;
export const skillAPI = activeClient.skillAPI;
export const inventoryAPI = activeClient.inventoryAPI;
export const achievementAPI = activeClient.achievementAPI;
export const rewardAPI = activeClient.rewardAPI;
export const listAPI = activeClient.listAPI;
export const listGroupAPI = activeClient.listGroupAPI;

export const logout = async () => {
    if (useSupabase && 'logout' in supabaseClient) {
        await supabaseClient.logout();
    } else {
        setToken(null);
    }
};
