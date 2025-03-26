import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:imba/core/services/auth/auth_service.dart';
import 'package:imba/core/services/auth/session_service.dart';
import 'package:imba/core/services/base_service.dart';
import 'package:imba/core/services/user/user_services.dart';
import 'package:imba/core/services/property/listing_services.dart';
import 'package:imba/core/services/property/image_service.dart';

// Core service providers
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sessionServiceProvider = Provider<SessionService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SessionService(prefs);
});

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final authServiceProvider = Provider<AuthService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthService(apiService);
});

final userServiceProvider = Provider<UserService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UserService(apiService);
});

final listingServiceProvider = Provider<ListingService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ListingService(apiService);
});

final imageServiceProvider = Provider<ImageService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ImageService(apiService);
});