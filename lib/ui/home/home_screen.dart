import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';
import 'package:imba/ui/listings/presentation/screens/listings_screens.dart';
import 'package:imba/ui/shared/appbar/nav_drawer.dart';
import 'package:imba/ui/shared/appbar/top_navbar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final appBarHeight = isMobile ? 100.0 : 160.0;
    final authState = ref.watch(authProvider);

    if (!authState.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/login', (route) => false);
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: TopNavbar(
          selectedTabIndex: _selectedTabIndex,
          onTabChanged: _onTabChanged,
        ),
      ),
      drawer: const NavDrawer(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 4080),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _selectedTabIndex == 0
                ? const PropertyListingsScreen()
                : const ListingsByAgencies(),
          ),
        ),
      ),
    );
  }
}
