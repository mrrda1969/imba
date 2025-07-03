import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';

class NavDrawer extends ConsumerWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    final isAgent =
        authState.isAuthenticated &&
        authState.user?.role?.toLowerCase() == 'agent';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 48),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  child: Text('Profile'),
                ),
              ],
            ),
          ),
          ListTile(
            leading: kIsWeb
                ? const Icon(Icons.home)
                : Platform.isIOS
                ? const Icon(CupertinoIcons.home)
                : const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: kIsWeb
                ? const Icon(Icons.settings)
                : Platform.isIOS
                ? Icon(CupertinoIcons.settings)
                : const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          if (isAgent)
            ListTile(
              leading: kIsWeb
                  ? Icon(Icons.business)
                  : Platform.isIOS
                  ? Icon(CupertinoIcons.building_2_fill)
                  : Icon(Icons.business),
              title: Text('My Listings'),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/my-listings'),
              },
            ),
          ListTile(
            leading: kIsWeb
                ? const Icon(Icons.info)
                : Platform.isIOS
                ? Icon(CupertinoIcons.info)
                : const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          const Divider(),
          ListTile(
            leading: kIsWeb
                ? const Icon(Icons.logout)
                : Platform.isIOS
                ? const Icon(CupertinoIcons.square_arrow_right)
                : const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              Navigator.pop(context);
              final authNotifier = ref.read(authProvider.notifier);
              await authNotifier.logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
    );
  }
}
