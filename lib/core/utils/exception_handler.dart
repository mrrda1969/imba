import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpExceptionHandler {
  static String handle(dynamic error) {
    if (error is SocketException) {
      return "No internet connection. Please check your network.";
    } else if (error is TimeoutException) {
      return "Connection timed out. Please try again.";
    } else if (error is http.Response) {
      return _handleBadResponse(error);
    } else {
      return "Something went wrong. Please try again.";
    }
  }

  static String _handleBadResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    try {
      final data = body.isNotEmpty ? jsonDecode(body) : null;

      if (data is Map && data['message'] != null) {
        return data['message'];
      }
    } catch (_) {}

    switch (statusCode) {
      case 400:
        return "Bad request. Please check your input.";
      case 401:
        return "Unauthorized. Please login again.";
      case 403:
        return "You do not have permission for this action.";
      case 404:
        return "Resource not found.";
      case 500:
        return "Server error. Try again later.";
      default:
        return "Unexpected error occurred [$statusCode].";
    }
  }
}
