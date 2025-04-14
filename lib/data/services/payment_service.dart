import 'package:dio/dio.dart';
import 'package:imba/core/api/api_client.dart';
import 'package:imba/core/errors/app_error.dart';

class PaymentService {
  final ApiClient _apiClient;

  PaymentService(this._apiClient);

  Future<void> processPayment({
    required double amount,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) async {
    try {
      await _apiClient.post(
        '/payments',
        data: {
          'amount': amount,
          'cardNumber': cardNumber,
          'expiryDate': expiryDate,
          'cvv': cvv,
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const AuthError(message: 'Payment authorization failed');
      }
      if (e.response?.statusCode == 400) {
        throw const ValidationError(message: 'Invalid payment details');
      }
      throw ServerError(message: 'Failed to process payment');
    }
  }

  Future<List<Map<String, dynamic>>> getPaymentHistory() async {
    try {
      final response = await _apiClient.get('/payments/history');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const AuthError(message: 'Failed to fetch payment history');
      }
      throw ServerError(message: 'Failed to fetch payment history');
    }
  }
}
