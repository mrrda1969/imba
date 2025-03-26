import 'package:flutter/material.dart';
import 'package:imba/ui/layouts/home/desktop_layout.dart';
import 'package:imba/ui/layouts/home/mobile_layout.dart';

/// A responsive layout that switches between mobile and desktop layouts
/// based on the screen width
class ResponsiveLayout extends StatelessWidget {
  /// The breakpoint width at which to switch between mobile and desktop layouts
  static const double breakpoint = 800;

  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < breakpoint) {
          return const MobileLayout();
        } else {
          return const DesktopLayout();
        }
      },
    );
  }
}
