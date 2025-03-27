import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/services/user_services.dart';
import 'package:imba/data/models/user.dart';

// Auth State class to manage authentication state
class AuthState {
  final bool isLoading;
  final User? user;
  final AuthError? error;

  AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    AuthError? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class AuthError {
  final String message;
  AuthError(this.message);

  static AuthError fromError(dynamic error) {
    return AuthError(error.toString());
  }
}

// Auth Provider
class AuthNotifier extends StateNotifier<AuthState> {
  final UserServices _userServices;

  AuthNotifier(this._userServices) : super(AuthState());

  Future<void> signIn({
    required String identifier,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _userServices.signIn(
        identifier: identifier,
        password: password,
      );
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: AuthError(e.toString()),
      );
    }
  }

  Future<void> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required UserRole role,
    required String verificationCode,
    required String phoneNumber,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _userServices.createUser(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        role: role.toApiString(),
        verificationCode: verificationCode,
        phoneNumber: phoneNumber,
      );
      
      // After successful signup, automatically sign in
      await signIn(identifier: email, password: password);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: AuthError(e.toString()),
      );
    }
  }

  Future<void> verifyPhone(String phoneNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _userServices.getVerificationCode(phoneNumber: phoneNumber);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: AuthError(e.toString()),
      );
    }
  }

  void signOut() {
    state = AuthState();
  }
}

// Provider definition
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final userServices = UserServices(
    dio: ref.read(dioProvider),
    baseUrl: 'YOUR_BASE_URL', // Replace with your actual base URL
  );
  return AuthNotifier(userServices);
});

// You'll need to add this provider for Dio
final dioProvider = Provider((ref) => Dio());
