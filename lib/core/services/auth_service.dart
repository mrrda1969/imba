import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  Future<void> logout() async {
    // TODO: Implement actual logout logic (e.g., clear tokens, call API, etc.)
    // For now, we'll just simulate a logout
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
