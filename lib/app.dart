import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/config/routes/routes.dart';
import 'package:imba/config/themes/theme.dart';
import 'package:imba/config/themes/theme_provider.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeProviderNotifier);
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Imba',
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      initialRoute: authState.isAuthenticated ? '/' : '/login',
    );
  }
}
