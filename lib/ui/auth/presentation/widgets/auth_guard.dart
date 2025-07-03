import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';

class AuthGuard extends ConsumerWidget {
  final Widget child;
  final String redirectRoute;

  const AuthGuard({
    super.key,
    required this.child,
    this.redirectRoute = '/login',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, redirectRoute);
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return child;
  }
}
