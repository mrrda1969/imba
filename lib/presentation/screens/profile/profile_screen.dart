import 'package:flutter/material.dart';
import 'package:imba/data/models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Get user from provider
    final user = User(
      id: '1',
      email: 'john.doe@example.com',
      fullName: 'John Doe',
      phoneNumber: '+1234567890',
      profileImage: null,
      role: UserRole.tenant,
      createdAt: DateTime.now(),
      isVerified: true,
      favoriteProperties: [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Implement edit profile
              Navigator.pushNamed(context, '/edit-profile');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      user.profileImage != null
                          ? NetworkImage(user.profileImage!)
                          : null,
                  child:
                      user.profileImage == null
                          ? Text(
                            user.fullName[0].toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          )
                          : null,
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
            user.fullName,
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
          _ProfileItem(icon: Icons.email, title: 'Email', subtitle: user.email),
          const Divider(),
          _ProfileItem(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: user.phoneNumber ?? 'Not provided',
          ),
          const Divider(),
          _ProfileItem(
            icon: Icons.verified_user,
            title: 'Account Status',
            subtitle: user.isVerified ? 'Verified' : 'Not verified',
            trailing:
                user.isVerified
                    ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                    )
                    : TextButton(
                      onPressed: () {
                        // TODO: Implement verify account
                      },
                      child: const Text('Verify'),
                    ),
          ),
          const Divider(),
          _ProfileItem(
            icon: Icons.favorite,
            title: 'Favorite Properties',
            subtitle: '${user.favoriteProperties.length} properties',
            onTap: () {
              // TODO: Navigate to favorite properties
            },
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
              // TODO: Navigate to help & support
              Navigator.pushNamed(context, '/help');
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            onPressed: () {
              // TODO: Implement logout
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
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
    this.trailing,
    this.onTap,
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
