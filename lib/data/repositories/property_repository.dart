import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imba/data/models/property.dart';

class PropertyRepository {
  final String baseUrl;
  final http.Client _client;

  PropertyRepository({
    this.baseUrl =
        'https://api.example.com/v1', // Replace with your actual API URL
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<List<Property>> getProperties({
    String? query,
    String? type,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final queryParams = <String, String>{
        if (query != null && query.isNotEmpty) 'q': query,
        if (type != null) 'type': type,
        if (minPrice != null) 'minPrice': minPrice.toString(),
        if (maxPrice != null) 'maxPrice': maxPrice.toString(),
        if (minBedrooms != null) 'minBedrooms': minBedrooms.toString(),
        if (sortBy != null) 'sortBy': sortBy,
        if (sortOrder != null) 'sortOrder': sortOrder,
      };

      final uri = Uri.parse(
        '$baseUrl/properties',
      ).replace(queryParameters: queryParams);
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load properties: ${response.statusCode}');
      }
    } catch (e) {
      // For development, return dummy data if API is not available
      return Property.getDummyProperties();
    }
  }

  Future<Property> getProperty(String id) async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/properties/$id'));

      if (response.statusCode == 200) {
        return Property.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load property: ${response.statusCode}');
      }
    } catch (e) {
      // For development, return dummy data if API is not available
      final dummyProperties = Property.getDummyProperties();
      final property = dummyProperties.firstWhere(
        (p) => p.id == id,
        orElse: () => dummyProperties.first,
      );
      return property;
    }
  }

  Future<void> toggleFavorite(String propertyId, bool isFavorite) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/properties/$propertyId/favorite'),
        body: json.encode({'isFavorite': isFavorite}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to update favorite status: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to update favorite status: $e');
    }
  }

  Future<List<Property>> getFavorites() async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/properties/favorites'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load favorites: ${response.statusCode}');
      }
    } catch (e) {
      // For development, return dummy data if API is not available
      return Property.getDummyProperties().where((p) => p.isFavorite).toList();
    }
  }
}
