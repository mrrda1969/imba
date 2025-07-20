import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);

  void toggleTheme() {
    state = !state;
  }
}

final themeProviderNotifier = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});
