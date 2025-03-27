import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart';
import 'config/themes.dart';
import 'core/di/service_locator.dart';
import 'data/repositories/property_repository.dart';
import 'data/repositories/profile_repository.dart';
import 'data/models/user.dart';
import 'presentation/providers/property_provider.dart';

class ImbaApp extends StatelessWidget {
  const ImbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    late final serviceLocator = context.read<ServiceLocator>();

    return MultiProvider(
      providers: [
        Provider<PropertyRepository>(
          create: (_) => serviceLocator.propertyRepository,
        ),
        Provider<ProfileRepository>(
          create: (_) => serviceLocator.profileRepository,
        ),
        StreamProvider<User?>(
          create: (_) => serviceLocator.profileRepository.userStream(),
          initialData: null,
        ),
        ChangeNotifierProxyProvider<PropertyRepository, PropertyProvider>(
          create:
              (context) => PropertyProvider(context.read<PropertyRepository>()),
          update:
              (context, repository, previous) =>
                  previous ?? PropertyProvider(repository),
        ),
      ],
      child: MaterialApp(
        title: 'Imba - Find Your Perfect Home',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/splash',
      ),
    );
  }
}
