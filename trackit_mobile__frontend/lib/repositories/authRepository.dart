import 'package:trackit_mobile__frontend/service/authService.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<String> login(String username, String password) async {
    try {
      return await _authService.login(username, password);
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<String> register(String username, String name, String password) async {
    try {
      return await _authService.register(username, password, name);
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
