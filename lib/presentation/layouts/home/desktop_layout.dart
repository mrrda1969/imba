import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesktopHomeLayout extends StatelessWidget {
  final int currentIndex;
  final List<Widget> screens;
  final ValueChanged<int> onIndexChanged;

  const DesktopHomeLayout({
    super.key,
    required this.currentIndex,
    required this.screens,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 360,
            color: Colors.grey[200],
            child: NavigationRail(
              extended: true,
              selectedIndex: currentIndex,
              onDestinationSelected: onIndexChanged,
              destinations: const [
                NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.house),
                  // selectedIcon: FaIcon(FontAwesomeIcons.House),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.message),
                  selectedIcon: FaIcon(FontAwesomeIcons.solidMessage),
                  // selectedIcon: Icon(Icons.message),
                  label: Text('Messages'),
                ),
                NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.user),
                  selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
                  label: Text('Profile'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list_alt_rounded),
                  label: Text('My Listings'),
                ),
              ],
            ),
          ),
          // const VerticalDivider(thickness: 0, width: 1),

          // Main Content Area
          Expanded(flex: 2, child: screens[currentIndex]),

          // Right Sidebar
          Container(
            width: 300,
            color: Colors.grey[100],
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Suggestions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
