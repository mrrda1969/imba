import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/di/service_locator.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize service locator
  ServiceLocator.initialize();

  runApp(
    MultiProvider(
      providers: [Provider<ServiceLocator>(create: (_) => ServiceLocator())],
      child: const ImbaApp(),
    ),
  );
}
