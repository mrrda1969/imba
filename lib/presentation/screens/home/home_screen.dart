import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/presentation/screens/profile/profile_screen.dart';
import 'package:imba/presentation/screens/properties/add_property_screen.dart';
import 'package:imba/presentation/screens/properties/property_list_screen.dart';
import 'package:imba/presentation/screens/properties/my_properties_screen.dart';
import 'package:imba/presentation/layouts/responsive_layout.dart';
import 'package:imba/presentation/layouts/home/mobile_layout.dart';
import 'package:imba/presentation/layouts/home/tablet_layout.dart';
import 'package:imba/presentation/layouts/home/desktop_layout.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/data/models/user.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _buildScreens(User? user) {
    final screens = [
      const PropertyListScreen(),
      const Center(child: Text('Favorites')),
      const Center(child: Text('Messages')),
      const ProfileScreen(),
    ];

    // Add My Properties screen if user is landlord or agent
    if (user?.role == UserRole.landlord || user?.role == UserRole.agent) {
      screens.add(const MyPropertiesScreen());
    }

    // Add Add Property Listing screen
    screens.add(const AddPropertyScreen());

    return screens;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final screens = _buildScreens(user);

    return ResponsiveLayout(
      mobile: MobileHomeLayout(
        currentIndex: _currentIndex,
        screens: screens,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
      tablet: TabletHomeLayout(
        currentIndex: _currentIndex,
        screens: screens,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
      desktop: DesktopHomeLayout(
        currentIndex: _currentIndex,
        screens: screens,
        onIndexChanged: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
