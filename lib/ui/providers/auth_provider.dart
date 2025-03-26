import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/services/auth/auth_service.dart';
import 'package:imba/core/services/auth/session_service.dart';
import 'package:imba/core/services/service_locator.dart';
import 'package:imba/data/models/user_model.dart';

/// Auth state class
import 'package:imba/core/errors/auth_error.dart';

class AuthState {
  final bool isLoading;
  final AuthError? error;
  final User? user;

  AuthState({
    this.isLoading = false,
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    AuthError? error,
    User? user,
    bool clearError = false,
    bool clearUser = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error,
      user: clearUser ? null : user ?? this.user,
    );
  }
}

/// Auth state provider
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final sessionService = ref.watch(sessionServiceProvider);
  return AuthStateNotifier(authService, sessionService);
});

/// Auth state notifier
class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final SessionService _sessionService;

  AuthStateNotifier(this._authService, this._sessionService) : super(AuthState()) {
    // Try to restore session on initialization
    _restoreSession();
  }

  void _restoreSession() {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final user = _sessionService.getSession();
      
      // Check if session is expired
      if (user != null && !_sessionService.isSessionExpired) {
        state = state.copyWith(isLoading: false, user: user);
      } else if (user != null) {
        // Clear expired session
        _sessionService.clearSession();
        state = state.copyWith(
          isLoading: false,
          error: AuthError.sessionExpired,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: AuthError.sessionRestoreFailed,
      );
    }
  }

  /// Sign in with email and password
  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _authService.signIn(
        identifier: email,
        password: password,
      );
      
      // Save session from response
      await _sessionService.saveSessionFromResponse(response);
      
      // Get user from session
      final user = _sessionService.getSession();
      if (user == null) throw AuthError.sessionRestoreFailed;
      
      state = state.copyWith(
        isLoading: false,
        user: user,
      );
    } catch (e) {
      final error = AuthError.fromError(e);
      state = state.copyWith(
        isLoading: false,
        error: error,
      );
      throw error;
    }
  }

  /// Check if the current session is expired
  bool get isSessionExpired => _sessionService.isSessionExpired;

  /// Sign out
  Future<void> signOut() async {
    await _sessionService.clearSession();
    state = state.copyWith(
      clearUser: true,
      clearError: true,
    );
  }

  /// Sign up new user
  Future<void> signUp(User user) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final response = await _authService.createUser(
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        password: user.password ?? '',
        role: user.role.toApiString(),
        phoneNumber: user.phoneNumber,
        verificationCode: user.verificationCode ?? '',
      );

      // Save session from response
      await _sessionService.saveSessionFromResponse(response);
      
      // Get user from session
      final newUser = _sessionService.getSession();
      if (newUser == null) throw AuthError.sessionRestoreFailed;
      
      state = state.copyWith(
        isLoading: false,
        user: newUser,
      );
    } catch (e) {
      final error = AuthError.fromError(e);
      state = state.copyWith(
        isLoading: false,
        error: error,
      );
      throw error;
    }
  }

  Future<void> verifyPhone(String phoneNumber) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _authService.verifyUser(phoneNumber);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      final error = AuthError.fromError(e);
      state = state.copyWith(isLoading: false, error: error);
      throw error;
    }
  }
} 