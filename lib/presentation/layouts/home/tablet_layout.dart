import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/data/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imba/presentation/widgets/custom_app_bar.dart';

class TabletHomeLayout extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      appBar: const CustomAppBar(isTablet: true),
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: currentIndex,
            onDestinationSelected: onIndexChanged,

            destinations: [
              const NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.house),
                label: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Home'),
                ),
              ),
              const NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.heart),
                selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
                label: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Favorites'),
                ),
              ),
              const NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.message),
                selectedIcon: FaIcon(FontAwesomeIcons.solidMessage),
                label: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Messages'),
                ),
              ),
              const NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.user),
                selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
                label: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Profile'),
                ),
              ),
              if (user?.role == UserRole.landlord)
                const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.building),
                  label: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('My Properties'),
                  ),
                )
              else if (user?.role == UserRole.agent)
                const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.building),
                  label: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Assigned Properties'),
                  ),
                ),
            ],
          ),
          Expanded(child: screens[currentIndex]),
        ],
      ),
    );
  }
}
