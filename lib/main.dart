import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/app.dart';
import 'package:imba/src/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  await container.read(authProvider.notifier).loadUser();

  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}
