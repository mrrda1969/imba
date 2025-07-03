import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavTab extends ConsumerWidget {
  final Widget icon;
  final String label;
  final bool isActive;

  const NavTab({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 4),
        Text(label),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 20,
            color: Colors.black,
          ),
      ],
    );
  }
}
