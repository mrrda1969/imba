import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/models/user.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/presentation/widgets/custom_app_bar.dart';

class MobileHomeLayout extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(isMobile: true),
      endDrawer: _buildDrawer(context, user, theme, ref),
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onIndexChanged,
        destinations: [
          const NavigationDestination(
            icon: ImageIcon(AssetImage('assets/icon/home.png')),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: ImageIcon(AssetImage('assets/icon/heart.png')),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          const NavigationDestination(
            icon: ImageIcon(AssetImage('assets/icon/envelope.png')),
            selectedIcon: Icon(Icons.message),
            label: 'Messages',
          ),
          const NavigationDestination(
            icon: ImageIcon(AssetImage('assets/icon/user.png')),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(
    BuildContext context,
    User? user,
    ThemeData theme,
    WidgetRef ref,
  ) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user?.profileImage ?? 'https://i.pravatar.cc/300',
              ),
            ),
            accountName: Text(user?.fullName ?? 'Guest User'),
            accountEmail: Text(user?.email ?? ''),
            decoration: BoxDecoration(color: theme.colorScheme.primary),
          ),
          _buildDrawerItems(context, ref),
        ],
      ),
    );
  }

  Widget _buildDrawerItems(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Column(
      children: [
        _buildDrawerItem(Icons.home_outlined, 'Home', 0, context, ref),
        _buildDrawerItem(Icons.favorite_outline, 'Favorites', 1, context, ref),
        _buildDrawerItem(Icons.message_outlined, 'Messages', 2, context, ref),
        _buildDrawerItem(Icons.person_outline, 'Profile', 3, context, ref),
        if (user?.role == UserRole.landlord || user?.role == UserRole.agent)
          _buildDrawerItem(
            Icons.business_outlined,
            'My Properties',
            null,
            context,
            ref,
          ),
        // _buildDrawerItem(Icons.list_alt_outlined, 'My Listings', null, context),
        const Divider(),
        _buildDrawerItem(
          Icons.settings_outlined,
          'Settings',
          null,
          context,
          ref,
        ),
        _buildDrawerItem(
          Icons.help_outline,
          'Help & Support',
          null,
          context,
          ref,
        ),
        _buildDrawerItem(Icons.logout, 'Logout', null, context, ref),
      ],
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    int? index,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (index != null) {
          onIndexChanged(index);
        } else {
          switch (title) {
            case 'My Properties':
              Navigator.pushNamed(context, '/my-listings');
              break;
            case 'Settings':
              Navigator.pushNamed(context, '/settings');
              break;
            case 'Help & Support':
              Navigator.pushNamed(context, '/help');
              break;
            case 'Logout':
              ref.read(authProvider.notifier).logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
              break;
          }
        }
      },
    );
  }
}
