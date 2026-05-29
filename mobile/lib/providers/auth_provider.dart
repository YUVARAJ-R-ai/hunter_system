import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hunter_system_mobile/models/user_model.dart';
import 'package:hunter_system_mobile/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiServiceProvider = Provider((ref) => ApiService());

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({User? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _apiService.login(email, password);
      // Assuming response.data has 'token' and 'user'
      final token = response.data['token'];
      final userData = User.fromJson(response.data['user']);
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      
      state = state.copyWith(user: userData, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(apiServiceProvider));
});
