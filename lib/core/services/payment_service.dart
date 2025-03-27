import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

class PaymentService {
  final String clientId;
  final String secretKey;
  final bool sandbox;

  PaymentService({String? clientId, String? secretKey, this.sandbox = true})
    : clientId = clientId ?? dotenv.env['PAYPAL_CLIENT_ID'] ?? '',
      secretKey = secretKey ?? dotenv.env['PAYPAL_SECRET_KEY'] ?? '';

  Future<void> makePayment({
    required BuildContext context,
    required String propertyId,
    required String propertyTitle,
    required double amount,
    required Function(String) onSuccess,
    required Function(String) onError,
    required Function() onCancel,
  }) async {
    try {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => UsePaypal(
                sandboxMode: sandbox,
                clientId: clientId,
                secretKey: secretKey,
                returnURL: "https://samplesite.com/return",
                cancelURL: "https://samplesite.com/cancel",
                transactions: [
                  {
                    "amount": {"total": amount.toString(), "currency": "USD"},
                    "description": "Payment for $propertyTitle",
                    "item_list": {
                      "items": [
                        {
                          "name": propertyTitle,
                          "quantity": 1,
                          "price": amount.toString(),
                          "currency": "USD",
                        },
                      ],
                    },
                  },
                ],
                note: "Contact us for any questions on your rental.",
                onSuccess: (Map<String, dynamic> params) {
                  onSuccess(params["paymentId"]);
                },
                onError: (error) {
                  onError(error.toString());
                },
                onCancel: () {
                  onCancel();
                },
              ),
        ),
      );
    } catch (e) {
      onError(e.toString());
    }
  }
}
