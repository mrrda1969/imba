import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: ref.watch(themeProviderNotifier),
                onChanged: (value) {
                  ref.read(themeProviderNotifier.notifier).toggleTheme();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
