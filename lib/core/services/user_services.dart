import 'package:dio/dio.dart';
import 'package:imba/data/models/user.dart';

class UserServices {

  final Dio _dio;
  final String _baseUrl;

  UserServices({ required Dio dio, required String baseUrl}): _dio = dio, _baseUrl = baseUrl;

  // sign in
  Future<User> signIn({required String identifier, required String password}) async {
    try {
      final response = await _dio.post('$_baseUrl/api/method/imba.www.main.sign_in', data: {
        'identifier': identifier,
        'password': password,
      });
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // create user
  Future<User> createUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String role,
    required String verificationCode,
    required String phoneNumber
    }) async {
    try {
      final response = await _dio.post('$_baseUrl/api/method/imba.www.main.create_user', data: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'role': role,
        'verification_code': verificationCode,
        'phone_number': phoneNumber
      });
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  // get verification code
  Future<String> getVerificationCode({ required String phoneNumber }) async {
    try {
      final response = await _dio.post('$_baseUrl/api/method/imba.www.main.bnb_verification', data: {
        'phone_number': phoneNumber,
      });
      return response.data['verification_code'];
    } catch (e) {
      throw Exception('Failed to get verification code: $e');
    }
  }

  // delete user by email
  Future<void> deleteUser({ required String email }) async {
    try {
      await _dio.delete('$_baseUrl/api/method/imba.www.main.delete_user_by_email', queryParameters: {
        'email': email,
      });
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}