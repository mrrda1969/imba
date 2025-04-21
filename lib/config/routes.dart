import 'package:flutter/material.dart';
import 'package:imba/presentation/screens/profile/change_password_screen.dart';
import 'package:imba/presentation/screens/profile/edit_profile_screen.dart';
import 'package:imba/presentation/screens/properties/my_properties_screen.dart';
import 'package:imba/presentation/screens/settings/settings_screen.dart';
import 'package:imba/presentation/screens/support/help_and_support.dart';
import '../presentation/screens/splash/splash_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/properties/property_detail_screen.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/signup_screen.dart';
import '../presentation/screens/profile/profile_screen.dart';
import '../presentation/screens/payments/payment_screen.dart';

enum AppRoutes { splash, login, signup, home, propertyDetail, profile, payment }

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
      case 'edit-profile':
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case '/change-password':
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const HelpAndSupportPage());
      case '/payment':
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case '/my-listings':
        return MaterialPageRoute(builder: (_) => const MyPropertiesScreen());
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
