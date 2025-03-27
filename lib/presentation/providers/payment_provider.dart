import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/payment_service.dart';
import '../../core/errors/app_error.dart';
import '../../core/api/api_client_provider.dart';

final paymentServiceProvider = Provider<PaymentService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PaymentService(apiClient);
});

final paymentProvider =
    StateNotifierProvider<PaymentNotifier, AsyncValue<void>>((ref) {
      final paymentService = ref.watch(paymentServiceProvider);
      return PaymentNotifier(paymentService);
    });

class PaymentNotifier extends StateNotifier<AsyncValue<void>> {
  final PaymentService _paymentService;

  PaymentNotifier(this._paymentService) : super(const AsyncValue.data(null));

  Future<void> processPayment({
    required double amount,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _paymentService.processPayment(
        amount: amount,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cvv: cvv,
      );
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
}
