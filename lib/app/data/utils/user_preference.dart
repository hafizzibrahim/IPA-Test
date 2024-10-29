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

  Future<String?> getUid() async {
    final prefs = await _getPrefs();
    return prefs.getString('uid');
  }

  Future<String?> getUuid() async {
    final prefs = await _getPrefs();
    return prefs.getString('uuid');
  }

  Future<String?> getName() async {
    final prefs = await _getPrefs();
    return prefs.getString('name');
  }

    Future<int?> getSerialNumber() async {
    final prefs = await _getPrefs();
    return prefs.getInt('serial_number');
  }

  Future<void> logout() async {
    final prefs = await _getPrefs();
    await prefs.clear();
  }
}
