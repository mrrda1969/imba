import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationItem {
  home,
  search,
  favorites,
  profile,
}

class NavigationNotifier extends StateNotifier<NavigationItem> {
  NavigationNotifier() : super(NavigationItem.home);

  void setNavigationItem(NavigationItem item) {
    state = item;
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, NavigationItem>((ref) {
  return NavigationNotifier();
});
