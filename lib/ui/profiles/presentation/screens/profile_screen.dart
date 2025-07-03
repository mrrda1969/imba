import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';
import 'package:imba/ui/profiles/presentation/providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(profileProvider);

    Future<void> handleLogout() async {
      final navigator = Navigator.of(context);
      await ref.read(authProvider.notifier).logout();
      navigator.pushNamedAndRemoveUntil('/login', (route) => false);
    }

    String buildFullName(String firstName, String lastName) {
      return firstName + " " + lastName;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/edit-profile');
            },
          ),
        ],
      ),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: ${error.toString()}')),
        data: (user) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Text(
                      user.firstName[0].toUpperCase(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              buildFullName(user.firstName, user.lastName),
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              user.role.toString().split('.').last.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _ProfileItem(
              icon: Icons.email,
              title: 'Email',
              subtitle: user.email,
            ),
            const Divider(),
            _ProfileItem(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: user.phoneNumber ?? 'Not provided',
            ),
            const Divider(),
            _ProfileItem(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'App preferences, notifications, etc.',
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const Divider(),
            _ProfileItem(
              icon: Icons.help,
              title: 'Help & Support',
              subtitle: 'FAQ, contact support',
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              onPressed: handleLogout,
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _ProfileItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing:
          trailing ?? (onTap != null ? const Icon(Icons.chevron_right) : null),
      onTap: onTap,
    );
  }
}
