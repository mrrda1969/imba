import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/models/user.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({User? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: Implement actual login logic
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      // For demo purposes, create a dummy user
      final user = User(
        id: '1',
        email: email,
        fullName: 'John Doe',
        role: UserRole.tenant,
        createdAt: DateTime.now(),
        isVerified: false,
        favoriteProperties: [],
      );

      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Login failed: $e');
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
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      // For demo purposes, create a dummy user
      final user = User(
        id: '1',
        email: email,
        fullName: '$firstName $lastName',
        phoneNumber: phone,
        role: role,
        createdAt: DateTime.now(),
        isVerified: false,
        favoriteProperties: [],
      );

      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Signup failed: $e');
    }
  }

  void logout() {
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
