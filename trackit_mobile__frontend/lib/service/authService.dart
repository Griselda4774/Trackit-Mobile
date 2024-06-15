import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constant.dart';

class AuthService {
  Future<String> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$apiUrl/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        if (response.body == "Login successfully!") {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', username);
          return "Login successfully!";
        } else {
          return "Error: ${response.body}";
        }
      } else {
        return "Error: ${response.statusCode} ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Exception: $e";
    }
  }

  Future<String> register(String username, String password, String name) async {
    try {
      final response = await http.post(
        Uri.parse("$apiUrl/register"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'name': name,
        }),
      );

      if (response.statusCode == 200) {
        return "Register successfully!";
      } else {
        return "Error: ${response.body}";
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
