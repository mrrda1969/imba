import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/src/providers/auth_provider.dart';
import 'package:imba/src/providers/theme_provider.dart';
import 'package:imba/src/screens/auth/login_screen.dart';
import 'package:imba/src/screens/home/home_screen.dart';
import 'package:imba/src/screens/shell_screen.dart';
import 'package:imba/src/themes/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(themeProviderNotifier);
    final user = ref.watch(authProvider);

    return MaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: user != null ? const ShellScreen() : const LoginScreen(),
    );
  }
}
