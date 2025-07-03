import 'dart:convert';
import 'package:imba/ui/auth/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userKey = 'user_data';
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> saveUser(User user) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  Future<void> removeUser() async {
    await _prefs.remove(_userKey);
  }

  User? getUser() {
    final userStr = _prefs.getString(_userKey);
    if (userStr == null) return null;

    try {
      return User.fromJson(jsonDecode(userStr));
    } catch (e) {
      return null;
    }
  }
}
