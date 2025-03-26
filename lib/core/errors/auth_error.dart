import 'package:flutter/material.dart';

/// Authentication related errors
enum AuthError {
  invalidCredentials('Invalid email or password'),
  sessionExpired('Your session has expired. Please log in again'),
  networkError('Network error. Please check your connection'),
  serverError('Server error. Please try again later'),
  invalidResponse('Invalid response from server'),
  sessionRestoreFailed('Failed to restore session'),
  unknown('An unknown error occurred');

  final String message;
  const AuthError(this.message);

  /// Get a user-friendly error message
  String get userMessage => message;

  /// Get the appropriate color for this error type
  Color get color {
    switch (this) {
      case AuthError.networkError:
        return Colors.orange;
      case AuthError.sessionExpired:
        return Colors.blue;
      default:
        return Colors.red;
    }
  }

  /// Convert an error to AuthError
  static AuthError fromError(dynamic error) {
    if (error is AuthError) return error;
    
    final message = error.toString().toLowerCase();
    
    if (message.contains('network') || message.contains('connection')) {
      return AuthError.networkError;
    }
    if (message.contains('invalid credentials') || message.contains('password')) {
      return AuthError.invalidCredentials;
    }
    if (message.contains('session')) {
      return AuthError.sessionExpired;
    }
    if (message.contains('server')) {
      return AuthError.serverError;
    }
    if (message.contains('response')) {
      return AuthError.invalidResponse;
    }
    
    return AuthError.unknown;
  }
}
