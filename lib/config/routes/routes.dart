import 'package:flutter/material.dart';
import 'package:imba/ui/auth/presentation/presentation.dart';
import 'package:imba/ui/auth/presentation/widgets/auth_guard.dart';
import 'package:imba/ui/home/home_screen.dart';
import 'package:imba/ui/listings/presentation/presentation.dart';
import 'package:imba/ui/listings/presentation/screens/my_listings_screen.dart';
import 'package:imba/ui/profiles/presentation/screens/profile_screen.dart';
import 'package:imba/ui/settings/settings_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => HomeScreen(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => const SignupScreen(),
      '/listings': (context) =>
          const AuthGuard(child: PropertyListingsScreen()),
      '/my-listings': (context) => const AuthGuard(child: MyListingsScreen()),
      '/listings/add': (context) => const AuthGuard(child: CreateListing()),
      '/listing-details': (context) {
        final listingId = ModalRoute.of(context)?.settings.arguments as String;
        return AuthGuard(
          child: PropertyListingDetailsScreen(listingId: listingId),
        );
      },
      '/settings': (context) => const AuthGuard(child: SettingsScreen()),
      '/profile': (context) => const AuthGuard(child: ProfileScreen()),
    };
  }
}
