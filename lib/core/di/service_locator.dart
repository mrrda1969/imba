import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imba/core/services/payment_service.dart';
import 'package:imba/data/repositories/profile_repository.dart';
import 'package:imba/data/repositories/property_repository.dart';

class ServiceLocator {
  late final Dio _dio;
  late final PropertyRepository propertyRepository;
  late final ProfileRepository profileRepository;
  late final PaymentService paymentService;

  ServiceLocator() {
    _initializeDio();
    _initializeRepositories();
    _initializeServices();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _initializeRepositories() {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000';

    propertyRepository = PropertyRepository(baseUrl: baseUrl);
    profileRepository = ProfileRepository(dio: _dio, baseUrl: baseUrl);
  }

  void _initializeServices() {
    paymentService = PaymentService(
      sandbox: dotenv.env['PAYPAL_SANDBOX'] == 'true',
    );
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token if available
          // final token = await secureStorage.read(key: 'auth_token');
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Handle common errors
          print('Error: ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  static void initialize() {
    // Initialize any global configurations here
  }
}
