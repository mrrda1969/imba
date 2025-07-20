import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/src/models/user/user_model.dart';
import 'package:imba/src/services/storage_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, UserModel?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<UserModel?> {
  AuthNotifier() : super(null);

  Future<void> loadUser() async {
    final user = await StorageService.getUser();
    state = user;
  }

  Future<void> login(String token, UserModel user) async {
    await StorageService.saveLoginSession(token, user);
    state = user;
  }

  Future<void> logout() async {
    await StorageService.clearSession();
    state = null;
  }

  bool get isLoggedIn => state != null;
}
