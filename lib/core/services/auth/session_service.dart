import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:imba/data/models/user_model.dart';

class SessionService {
  static const String _userKey = 'user_session';
  static const String _sessionKey = 'session_active';
  static const String _loginTimeKey = 'login_time';

  final SharedPreferences _prefs;

  SessionService(this._prefs);

  /// Save user session from login/signup response
  /// Example response format:
  /// {
  ///   "message": {
  ///     "status_code": 200,
  ///     "message": "Sign-in successful.",
  ///     "data": {
  ///       "email": "user@example.com",
  ///       "phone_number": "1234567890"
  ///     }
  ///   }
  /// }
  Future<void> saveSessionFromResponse(Map<String, dynamic> response) async {
    if (!response.containsKey('message')) {
      throw FormatException('Invalid response format: missing message field');
    }

    final message = response['message'] as Map<String, dynamic>;
    final user = User.fromLoginResponse(message);
    await saveSession(user);
  }

  /// Save user session directly from User object
  Future<void> saveSession(User user) async {
    final userData = user.toJson();
    await _prefs.setString(_userKey, jsonEncode(userData));
    await _prefs.setBool(_sessionKey, true);
    await _prefs.setInt(_loginTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> clearSession() async {
    await _prefs.remove(_userKey);
    await _prefs.remove(_sessionKey);
    await _prefs.remove(_loginTimeKey);
  }

  User? getSession() {
    final userJson = _prefs.getString(_userKey);
    if (userJson == null) return null;

    try {
      final userData = jsonDecode(userJson) as Map<String, dynamic>;
      return User.fromLoginResponse({
        'message': {
          'data': userData
        }
      });
    } catch (e) {
      // If there's an error reading the session, clear it
      clearSession();
      return null;
    }
  }

  bool get isSessionActive => _prefs.getBool(_sessionKey) ?? false;

  DateTime? get loginTime {
    final timestamp = _prefs.getInt(_loginTimeKey);
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  bool get isSessionExpired {
    final time = loginTime;
    if (time == null) return true;
    return DateTime.now().difference(time).inDays > 30;
  }
}