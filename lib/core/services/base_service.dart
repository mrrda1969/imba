import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiService {
  static const String _baseUrl = 'https://imba.durihub.co.zw/api/method/imba.www.main';

  Future<dynamic> sendRequest({
    required String endpoint,
    required String method,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    List<http.MultipartFile>? files,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl.$endpoint').replace(
        queryParameters: queryParams?.map((key, value) => 
            MapEntry(key, value.toString())));

      http.Response response;
      
      if (files != null) {
        // Handle file uploads
        var request = http.MultipartRequest(method, uri);
        request.files.addAll(files);
        if (body != null) {
          request.fields.addAll(body.map((key, value) => 
              MapEntry(key, value.toString())));
        }
        var streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      } else {
        // Handle regular requests
        switch (method) {
          case 'GET':
            response = await http.get(uri);
            break;
          case 'POST':
            response = await http.post(
              uri,
              body: body,
              headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            );
            break;
          case 'DELETE':
            response = await http.delete(uri);
            break;
          default:
            throw Exception('Unsupported HTTP method');
        }
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('API Error: $e');
      rethrow;
    }
  }
}