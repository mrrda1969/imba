import 'package:flutter/material.dart';

class DemoCredentialsScreen extends StatelessWidget {
  const DemoCredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Credentials')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Demo Account Credentials',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildCredentialCard(
              'Tenant Account',
              'tenant@example.com',
              'password123',
            ),
            const SizedBox(height: 16),
            _buildCredentialCard(
              'Agent Account',
              'agent@example.com',
              'password123',
            ),
            const SizedBox(height: 16),
            _buildCredentialCard(
              'Landlord Account',
              'landlord@example.com',
              'password123',
            ),
            const SizedBox(height: 24),
            const Text(
              'Note:',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 8),
            const Text(
              '• These are demo accounts for testing purposes only\n'
              '• No real data is stored or processed\n'
              '• You can use any email/password combination to login\n'
              '• The app will simulate a successful login regardless of credentials',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCredentialCard(String title, String email, String password) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildCredentialRow('Email:', email),
            const SizedBox(height: 4),
            _buildCredentialRow('Password:', password),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildCredentialRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Text(value),
      ],
    );
  }
}
