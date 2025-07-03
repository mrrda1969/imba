import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileNavbar extends ConsumerWidget {
  final int navIndex;
  final ValueChanged<int> onIconPressed;

  const MobileNavbar({
    required this.navIndex,
    required this.onIconPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: navIndex,
      onTap: onIconPressed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
      ],
    );
  }
}
