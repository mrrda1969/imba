import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help & Support')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help & Support',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This is the Help & Support page. Here you can find answers to common questions and get assistance.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
