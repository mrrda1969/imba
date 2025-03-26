import 'package:imba/core/services/base_service.dart';

class UserService {
  final ApiService _apiService;

  UserService(this._apiService);

  Future<Map<String, dynamic>> getAllUsers() async {
    return await _apiService.sendRequest(
      endpoint: 'get_all_users',
      method: 'GET',
    );
  }

  Future<Map<String, dynamic>> getUserByEmailOrPhone({
    String? email,
    String? phoneNumber,
  }) async {
    if (email == null && phoneNumber == null) {
      throw Exception('Either email or phoneNumber must be provided');
    }

    return await _apiService.sendRequest(
      endpoint: 'get_user_by_email_or_phone',
      method: 'GET',
      queryParams: {
        if (email != null) 'email': email,
        if (phoneNumber != null) 'phone_number': phoneNumber,
      },
    );
  }
}