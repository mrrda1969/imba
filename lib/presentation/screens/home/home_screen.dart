import 'package:flutter/material.dart';
import 'package:imba/presentation/screens/profile/profile_screen.dart';
import 'package:imba/presentation/screens/properties/add_property_listing.dart';
import 'package:imba/presentation/screens/properties/property_list_screen.dart';
import 'package:imba/presentation/layouts/responsive_layout.dart';
import 'package:imba/presentation/layouts/home/mobile_layout.dart';
import 'package:imba/presentation/layouts/home/tablet_layout.dart';
import 'package:imba/presentation/layouts/home/desktop_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PropertyListScreen(),
    Center(child: Text('Favorites')),
    Center(child: Text('Messages')),
    ProfileScreen(),
    AddPropertyListing(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: MobileHomeLayout(
        currentIndex: _currentIndex,
        screens: _screens,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
      tablet: TabletHomeLayout(
        currentIndex: _currentIndex,
        screens: _screens,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
      desktop: DesktopHomeLayout(
        currentIndex: _currentIndex,
        screens: _screens,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
