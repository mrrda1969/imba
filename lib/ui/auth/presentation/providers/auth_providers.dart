import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/data/models/user.dart';
import 'package:imba/ui/auth/data/repos/mock_users.dart';
import 'package:imba/ui/auth/presentation/providers/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_providers.g.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

@riverpod
StorageService storageService(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return StorageService(prefs);
}

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    /// Initialize auth state when the notifier is created
    _initializeAuthState();
    return const AuthState();
  }

  Future<void> _initializeAuthState() async {
    final storage = ref.read(storageServiceProvider);
    final user = storage.getUser();
    if (user != null) {
      state = state.copyWith(user: user, isAuthenticated: true);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = mockUsers.firstWhere(
        (user) => user.email == email && user.password == password,
        orElse: () => throw Exception('Invalid credentials'),
      );

      final storage = ref.read(storageServiceProvider);
      await storage.saveUser(user);
      state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        isAuthenticated: false,
      );
    }
  }

  Future<void> logout() async {
    final storage = ref.read(storageServiceProvider);
    await storage.removeUser();
    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
