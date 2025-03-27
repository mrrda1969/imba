import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';

void showErrorSnackBar(BuildContext context, dynamic error) {
  final authError = error is AuthError ? error : AuthError.fromError(error);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(authError.message),
      backgroundColor: Colors.red,
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