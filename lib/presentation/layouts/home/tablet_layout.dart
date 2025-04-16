import 'package:flutter/material.dart';

class TabletHomeLayout extends StatelessWidget {
  final int currentIndex;
  final List<Widget> screens;
  final ValueChanged<int> onIndexChanged;

  const TabletHomeLayout({
    super.key,
    required this.currentIndex,
    required this.screens,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imba'),
        automaticallyImplyLeading: false,
        actions: [],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: onIndexChanged,
            destinations: const [
              NavigationRailDestination(
                icon: ImageIcon(AssetImage('assets/icon/home.png')),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(AssetImage('assets/icon/heart.png')),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(AssetImage('assets/icon/envelope.png')),
                selectedIcon: Icon(Icons.message),
                label: Text('Messages'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(AssetImage('assets/icon/user.png')),
                selectedIcon: Icon(Icons.person),
                label: Text('Profile'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: screens[currentIndex]),
        ],
      ),
    );
  }
}
