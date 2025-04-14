import 'package:dio/dio.dart';
import '../models/user.dart';

class ProfileRepository {
  final Dio _dio;
  final String _baseUrl;

  ProfileRepository({required Dio dio, required String baseUrl})
    : _dio = dio,
      _baseUrl = baseUrl;

  // Dummy user data for testing
  User get dummyUser => User(
    id: '1',
    email: 'john.doe@example.com',
    fullName: 'John Doe',
    phoneNumber: '+1234567890',
    profileImage: 'https://i.pravatar.cc/300',
    role: UserRole.tenant,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    isVerified: true,
    favoriteProperties: ['1', '2', '3'],
  );

  Future<User> getCurrentUser() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      return dummyUser;
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  Future<User> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? profileImage,
  }) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      return dummyUser.copyWith(
        fullName: fullName,
        phoneNumber: phoneNumber,
        profileImage: profileImage,
      );
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Simulate validation
      if (currentPassword == 'wrong_password') {
        throw Exception('Current password is incorrect');
      }
    } catch (e) {
      throw Exception('Failed to change password: $e');
    }
  }

  Future<void> deleteAccount() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }
}
