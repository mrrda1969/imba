import 'package:flutter/material.dart';
import 'package:imba/data/models/user.dart';
import 'package:provider/provider.dart';

class MobileHomeLayout extends StatelessWidget {
  final int currentIndex;
  final List<Widget> screens;
  final ValueChanged<int> onIndexChanged;

  const MobileHomeLayout({
    super.key,
    required this.currentIndex,
    required this.screens,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imba'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context, user, theme),
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onIndexChanged,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, User? user, ThemeData theme) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            
            accountName: Text(user?.firstName ?? 'Guest User'),
            accountEmail: Text(user?.email ?? ''),
            decoration: BoxDecoration(color: theme.colorScheme.primary),
          ),
          _buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget _buildDrawerItems(BuildContext context) {
    return Column(
      children: [
        _buildDrawerItem(Icons.home_outlined, 'Home', 0, context),
        _buildDrawerItem(Icons.favorite_outline, 'Favorites', 1, context),
        _buildDrawerItem(Icons.message_outlined, 'Messages', 2, context),
        _buildDrawerItem(Icons.person_outline, 'Profile', 3, context),
        const Divider(),
        _buildDrawerItem(Icons.settings_outlined, 'Settings', null, context),
        _buildDrawerItem(Icons.help_outline, 'Help & Support', null, context),
        _buildDrawerItem(Icons.logout, 'Logout', null, context),
      ],
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    int? index,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (index != null) {
          onIndexChanged(index);
        }
        Navigator.pop(context);
      },
    );
  }
}
