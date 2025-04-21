import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/models/user.dart';
import 'package:imba/core/providers/auth_provider.dart';

final profileProvider = FutureProvider.autoDispose<User>((ref) async {
  final authState = ref.watch(authProvider);
  if (authState.user == null) {
    throw Exception('No authenticated user found');
  }
  return authState.user!;
});
