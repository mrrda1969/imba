import 'package:flutter/material.dart';
import 'package:imba/presentation/screens/splash/splash_screen.dart';
import 'package:imba/presentation/screens/auth/login_screen.dart';
import 'package:imba/presentation/screens/auth/signup_screen.dart';
import 'package:imba/presentation/screens/home/home_screen.dart';
import 'package:imba/presentation/screens/properties/property_detail_screen.dart';
import 'package:imba/presentation/screens/profile/profile_screen.dart';
import 'package:imba/presentation/screens/profile/edit_profile_screen.dart';

enum AppRoutes { splash, login, signup, home, propertyDetail, profile, editProfile, serviceTest }

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/property-detail':
        final propertyId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PropertyDetailScreen(propertyId: propertyId),
        );
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/edit-profile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
