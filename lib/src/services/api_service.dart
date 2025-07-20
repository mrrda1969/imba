import 'package:dio/dio.dart';
import 'package:imba/src/models/agency/agency_model.dart';
import 'package:imba/src/models/auth/auth_response_model.dart';
import 'package:imba/src/models/listing/listing_model.dart';
import 'package:imba/src/models/listing/paginated_listing_response.dart';
import 'package:imba/src/models/stats_response/stats_response_model.dart';
import 'package:imba/src/models/user/user_model.dart';
import 'package:imba/src/services/storage_service.dart';

class ApiService {
  final Dio _dio;

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: const String.fromEnvironment(
            'API_BASE_URL',
            defaultValue: 'https://imba-api.onrender.com',
          ),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await StorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }

  Future<String?> getToken() {
    return StorageService.getToken();
  }

  // Auth endpoints
  Future<AuthResponse> login(String email, String password) async {
    final response = await _dio.post(
      '/api/auth/login',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> register(UserModel user) async {
    if (user.password == null || user.password!.isEmpty) {
      throw Exception("Password is required for registration.");
    }

    final response = await _dio.post('/api/auth/register', data: user.toJson());
    return AuthResponse.fromJson(response.data);
  }

  Future<UserModel> getProfile() async {
    final response = await _dio.get('/api/auth/profile');
    return UserModel.fromJson(response.data['user']);
  }

  Future<UserModel> updateProfile(Map<String, dynamic> userData) async {
    final response = await _dio.put('/api/auth/profile', data: userData);
    return UserModel.fromJson(response.data);
  }

  Future<void> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    await _dio.put(
      '/api/auth/change-password',
      data: {'currentPassword': currentPassword, 'newPassword': newPassword},
    );
  }

  Future<void> logout() async {
    await _dio.post('/api/auth/logout');
  }

  // Users endpoints
  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get('/api/users');
    return (response.data['users'] as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
  }

  Future<UserModel> getUserById(String id) async {
    final response = await _dio.get('/api/users/$id');
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> createUser(Map<String, dynamic> userData) async {
    final response = await _dio.post('/api/users', data: userData);
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> updateUser(String id, Map<String, dynamic> userData) async {
    final response = await _dio.put('/api/users/$id', data: userData);
    return UserModel.fromJson(response.data);
  }

  Future<void> deleteUser(String id) async {
    await _dio.delete('/api/users/$id');
  }

  // Agencies endpoints
  Future<List<AgencyModel>> getAgencies() async {
    final response = await _dio.get('/api/agencies');
    return (response.data['agencies'] as List)
        .map((json) => AgencyModel.fromJson(json))
        .toList();
  }

  Future<AgencyModel> getAgencyById(String id) async {
    final response = await _dio.get('/api/agencies/$id');
    return AgencyModel.fromJson(response.data);
  }

  Future<AgencyModel> createAgency(Map<String, dynamic> agencyData) async {
    final response = await _dio.post('/api/agencies', data: agencyData);
    return AgencyModel.fromJson(response.data);
  }

  Future<AgencyModel> updateAgency(
    String id,
    Map<String, dynamic> agencyData,
  ) async {
    final response = await _dio.put('/api/agencies/$id', data: agencyData);
    return AgencyModel.fromJson(response.data);
  }

  Future<void> deleteAgency(String id) async {
    await _dio.delete('/api/agencies/$id');
  }

  Future<List<AgencyModel>> getChildAgencies(String id) async {
    final response = await _dio.get('/api/agencies/$id/children');
    return (response.data as List)
        .map((json) => AgencyModel.fromJson(json))
        .toList();
  }

  // Listings endpoints
  Future<PaginatedListingsResponse> getListings() async {
    final response = await _dio.get('/api/listings');
    return PaginatedListingsResponse.fromJson(response.data);
  }

  Future<ListingModel> getListingById(String id) async {
    final response = await _dio.get('/api/listings/$id');
    return ListingModel.fromJson(response.data);
  }

  Future<ListingModel> createListing(Map<String, dynamic> listingData) async {
    final response = await _dio.post('/api/listings', data: listingData);
    return ListingModel.fromJson(response.data);
  }

  Future<ListingModel> updateListing(
    String id,
    Map<String, dynamic> listingData,
  ) async {
    final response = await _dio.put('/api/listings/$id', data: listingData);
    return ListingModel.fromJson(response.data);
  }

  Future<List<ListingModel>> getListingsByAgent(String agentId) async {
    final response = await _dio.get('/api/listings/agent/$agentId');
    return (response.data as List)
        .map((json) => ListingModel.fromJson(json))
        .toList();
  }

  Future<List<ListingModel>> getListingsByAgency(String agencyId) async {
    final response = await _dio.get('/api/listings/agency/$agencyId');
    return (response.data as List)
        .map((json) => ListingModel.fromJson(json))
        .toList();
  }

  Future<List<ListingModel>> getMyListings() async {
    final response = await _dio.get('/api/listings/my-listings');
    return (response.data as List)
        .map((json) => ListingModel.fromJson(json))
        .toList();
  }

  Future<StatsResponse> getStats() async {
    final response = await _dio.get('/api/stats');
    return StatsResponse.fromJson(response.data);
  }
}
