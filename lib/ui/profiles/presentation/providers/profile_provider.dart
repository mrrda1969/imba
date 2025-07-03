import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/data/models/user.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Future<User> profile(Ref ref) async {
  final authState = ref.watch(authProvider);
  if (authState.user == null) {
    throw Exception('No authenticated user found');
  }
  return authState.user!;
}
