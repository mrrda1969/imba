import 'package:dio/dio.dart';
import 'package:imba/data/models/user.dart';

class ProfileRepository {
  final Dio _dio;
  final String _baseUrl;
  User? _currentUser;

  ProfileRepository({required Dio dio, String? baseUrl})
    : _dio = dio,
      _baseUrl = baseUrl ?? 'https://imba.durihub.co.zw';


  Future<User> getCurrentUser({String? email,String? phoneNumber}) async {

    try {
      final response = await _dio.get('$_baseUrl/api/method/imba.www.main.get_user_by_email_or_phone', queryParameters: {
        'email': email,
        'phone_number': phoneNumber,
      });
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch user profile: $e');
    }
  }

  Stream<User?> userStream() async* {
    if (_currentUser != null) {
      yield _currentUser;
    }
    
    try {
      final user = await getCurrentUser();
      _currentUser = user;
      yield user;
    } catch (e) {
      yield null;
    }
  }

  // get all users
  Future<List<User>> getAllUsers() async {
    try {
      final response = await _dio.get('$_baseUrl/api/method/imba.www.main.get_all_users');

      if (response.statusCode == 200) {
        List<dynamic> usersJson = response.data['data'];
        List<User> users = usersJson.map((json) => User.fromJson(json)).toList();
        return users;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  // delete user
  Future<void> deleteAccount({required String email}) async {
    try {
      await _dio.delete('$_baseUrl/api/method/imba.www.main.delete_user_by_email', queryParameters: {
        'email': email,
      });
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }

  
}
