import 'package:flutter/material.dart';
import 'package:imba/core/errors/auth_error.dart';

void showErrorSnackBar(BuildContext context, dynamic error) {
  final authError = error is AuthError ? error : AuthError.fromError(error);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(authError.userMessage),
      backgroundColor: authError.color,
    ),
  );
}

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
} 