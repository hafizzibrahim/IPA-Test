import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getToken() async {
    final prefs = await _getPrefs();
    return prefs.getString('token');
  }

  Future<String?> getUserId() async {
    final prefs = await _getPrefs();
    return prefs.getString('userId');
  }

  Future<bool?> getLoggedIn() async {
    final prefs = await _getPrefs();
    return prefs.getBool('loggedIn');
  }

  Future<void> logout() async {
    final prefs = await _getPrefs();
    await prefs.clear();
  }
}
