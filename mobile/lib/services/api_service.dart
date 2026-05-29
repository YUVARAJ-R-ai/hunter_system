import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();
  // TODO: Replace with your backend URL (e.g., http://192.168.1.XX:3001)
  static const String baseUrl = 'http://localhost:3001';

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer \$token';
        }
        return handler.next(options);
      },
    ));
  }

  // Auth
  Future<Response> login(String email, String password) async {
    return _dio.post('/api/auth/login', data: {'email': email, 'password': password});
  }

  Future<Response> register(String email, String password, String username) async {
    return _dio.post('/api/auth/register', data: {
      'email': email,
      'password': password,
      'username': username,
    });
  }

  // Quests
  Future<Response> getQuests() async {
    return _dio.get('/api/quests');
  }

  Future<Response> completeQuest(String id) async {
    return _dio.post('/api/quests/\$id/complete');
  }

  // Hunter
  Future<Response> getProfile() async {
    return _dio.get('/api/hunter/profile');
  }

  Future<Response> getStats() async {
    return _dio.get('/api/hunter/stats');
  }
}
