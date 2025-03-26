import 'package:imba/core/services/base_service.dart';

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<Map<String, dynamic>> verifyUser(String phoneNumber) async {
    return await _apiService.sendRequest(
      endpoint: 'bnb_verification',
      method: 'POST',
      queryParams: {'phone_number': phoneNumber},
    );
  }

  Future<Map<String, dynamic>> signIn({
    required String identifier,
    required String password,
  }) async {
    return await _apiService.sendRequest(
      endpoint: 'sign_in',
      method: 'POST',
      queryParams: {
        'identifier': identifier,
        'password': password,
      },
    );
  }

  Future<Map<String, dynamic>> createUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String role,
    required String phoneNumber,
    required String verificationCode,
  }) async {
    return await _apiService.sendRequest(
      endpoint: 'create_user',
      method: 'POST',
      queryParams: {
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'role': role,
        'phone_number': phoneNumber,
        'verification_code': verificationCode,
      },
    );
  }

  Future<Map<String, dynamic>> deleteUser(String email) async {
    return await _apiService.sendRequest(
      endpoint: 'delete_user_by_email',
      method: 'DELETE',
      queryParams: {'email': email},
    );
  }
}