import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  final String message;
  final String? code;

  const AppError({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

class NetworkError extends AppError {
  const NetworkError({required String message, String? code})
    : super(message: message, code: code);
}

class AuthError extends AppError {
  const AuthError({required String message, String? code})
    : super(message: message, code: code);
}

class ValidationError extends AppError {
  const ValidationError({required String message, String? code})
    : super(message: message, code: code);
}

class ServerError extends AppError {
  const ServerError({required String message, String? code})
    : super(message: message, code: code);
}

class CacheError extends AppError {
  const CacheError({required String message, String? code})
    : super(message: message, code: code);
}

class UnknownError extends AppError {
  const UnknownError({required String message, String? code})
    : super(message: message, code: code);
}
