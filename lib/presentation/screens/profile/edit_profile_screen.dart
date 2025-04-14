import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/profile_repository.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final user = context.read<User?>();
    _fullNameController = TextEditingController(text: user?.fullName);
    _phoneController = TextEditingController(text: user?.phoneNumber);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      try {
        final repository = context.read<ProfileRepository>();
        await repository.updateProfile(
          fullName: _fullNameController.text,
          phoneNumber: _phoneController.text,
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully')),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update profile: $e')),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(icon: const Icon(Icons.save), onPressed: _saveProfile),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
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
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () {
                          // TODO: Implement image upload
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/change-password');
              },
              child: const Text('Change Password'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Delete Account'),
                        content: const Text(
                          'Are you sure you want to delete your account? This action cannot be undone.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.error,
                            ),
                            onPressed: () async {
                              try {
                                final repository =
                                    context.read<ProfileRepository>();
                                await repository.deleteAccount();
                                if (mounted) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/login',
                                    (route) => false,
                                  );
                                }
                              } catch (e) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Failed to delete account: $e',
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                );
              },
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
