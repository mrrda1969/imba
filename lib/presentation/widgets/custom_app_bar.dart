import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/data/models/user.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  const CustomAppBar({
    super.key,
    this.isMobile = false,
    this.isTablet = false,
    this.isDesktop = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isMobile) {
      return AppBar(
        title: const Text('Imba'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
        ],
      );
    }

    if (isTablet) {
      return AppBar(
        title: const Text('Imba'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      );
    }

    // Desktop layout
    return AppBar(
      title: const Text('Imba'),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // TODO: Implement notifications
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () => Navigator.pushNamed(context, '/settings'),
        ),
      ],
    );
  }

  Widget _buildDrawerItems(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Column(
      children: [
        _buildDrawerItem(Icons.home_outlined, 'Home', 0, context),
        _buildDrawerItem(Icons.favorite_outline, 'Favorites', 1, context),
        _buildDrawerItem(Icons.message_outlined, 'Messages', 2, context),
        _buildDrawerItem(Icons.person_outline, 'Profile', 3, context),
        if (user?.role == UserRole.landlord || user?.role == UserRole.agent)
          _buildDrawerItem(
            Icons.business_outlined,
            'My Properties',
            null,
            context,
          ),
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
        Navigator.pop(context);
        if (index != null) {
          // TODO: Handle navigation to different screens
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
              Navigator.pushNamed(context, '/login');
              break;
          }
        }
      },
    );
  }
}
