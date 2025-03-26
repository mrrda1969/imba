import 'package:flutter/material.dart';
import 'package:imba/ui/screens/auth/login_screen.dart';
import 'package:imba/ui/screens/auth/signup_screen.dart';
import 'package:imba/ui/screens/splash_screen.dart';
import 'package:imba/ui/screens/home_screen.dart';
import 'package:imba/ui/screens/property/property_details_screen.dart';

/// App route names as constants
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String propertyDetails = '/property/details';
  
  // Add more routes as needed
}

/// Route generator for the app
class AppRouter {
  /// The route generator callback used by the MaterialApp
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AppRoutes.propertyDetails:
        // Extract the property ID from arguments
        final args = settings.arguments as Map<String, dynamic>?;
        final propertyId = args?['propertyId'] as String? ?? '';
        return MaterialPageRoute(
          builder: (_) => PropertyDetailsScreen(propertyId: propertyId),
        );
      // Add more route cases as needed
      default:
        // Handle unknown routes
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  /// The app routes map used by MaterialApp
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splash: (_) => const SplashScreen(),
    AppRoutes.login: (_) => const LoginScreen(),
    AppRoutes.signup: (_) => const SignupScreen(),
    AppRoutes.home: (_) => const HomeScreen(),
    // Add more routes as needed
  };
}
