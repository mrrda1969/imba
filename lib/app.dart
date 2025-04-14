import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/theme_provider.dart';
import 'config/routes.dart';
import 'config/themes.dart';

class ImbaApp extends ConsumerWidget {
  const ImbaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProviderNotifier);
    return MaterialApp(
      title: 'Imba',
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/splash',
    );
  }
}
