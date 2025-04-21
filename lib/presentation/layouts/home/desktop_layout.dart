import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/data/models/user.dart';
import 'package:imba/presentation/widgets/custom_app_bar.dart';

class DesktopHomeLayout extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      appBar: const CustomAppBar(isDesktop: true),
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
              destinations: [
                const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: Text('Home'),
                ),
                const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
                  label: Text('Favorites'),
                ),
                const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.message),
                  selectedIcon: FaIcon(FontAwesomeIcons.solidMessage),
                  label: Text('Messages'),
                ),
                const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.user),
                  selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
                  label: Text('Profile'),
                ),
                if (user?.role == UserRole.landlord)
                  const NavigationRailDestination(
                    icon: FaIcon(FontAwesomeIcons.building),
                    label: Text('My Properties'),
                  )
                else if (user?.role == UserRole.agent)
                  const NavigationRailDestination(
                    icon: FaIcon(FontAwesomeIcons.building),
                    label: Text('Assigned Properties'),
                  ),
                // const NavigationRailDestination(
                //   icon: Icon(Icons.list_alt_rounded),
                //   label: Text('My Listings'),
                // ),
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
