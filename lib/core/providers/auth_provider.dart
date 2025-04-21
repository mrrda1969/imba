import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/models/user.dart';
import 'package:imba/data/mock/mock_users.dart';
import 'package:imba/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class AuthNotifier extends StateNotifier<AuthState> {
  final StorageService _storage;

  AuthNotifier(this._storage) : super(const AuthState()) {
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final user = _storage.getUser();
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

      await _storage.saveUser(user);
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

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required UserRole role,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: Implement actual signup logic
      await Future.delayed(const Duration(seconds: 1));

      final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        fullName: '$firstName $lastName',
        phoneNumber: phone,
        role: role,
        isVerified: false,
        favoriteProperties: [],
      );

      await _storage.saveUser(user);
      state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Signup failed: $e',
        isAuthenticated: false,
      );
    }
  }

  Future<void> logout() async {
    await _storage.removeUser();
    state = const AuthState();
  }
}

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return StorageService(prefs);
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return AuthNotifier(storage);
});
