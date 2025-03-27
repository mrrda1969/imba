import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/di/service_locator.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize service locator
  ServiceLocator.initialize();

  runApp(
    ProviderScope(
      child: provider.MultiProvider(
        providers: [provider.Provider<ServiceLocator>(create: (_) => ServiceLocator())],
        child: const ImbaApp(),
      ),
    ),
  );
}
