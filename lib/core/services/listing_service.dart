import 'package:dio/dio.dart';
import 'package:imba/data/models/property_listing_model.dart';

class ListingService {
  final Dio _dio;
  final String _baseUrl;

  ListingService({ required Dio dio, required String baseUrl })
      : _dio = dio,
        _baseUrl = baseUrl;

  // create a listing
  Future<PropertyListing> createListing({ required PropertyListing listing }) async {
    try {
      final response = await _dio.post('$_baseUrl/api/method/imba.www.main.create_bnb_listing', data: listing.toJson());
      return PropertyListing.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create listing: $e');
    }
  }

  // delete a listing by id
  Future<PropertyListing> deleteListingById({ required String name }) async {
    try {
      final response = await _dio.delete('$_baseUrl/api/method/imba.www.main.delete_bnb_listing', queryParameters: {
        'name': name,
      });
      return PropertyListing.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to delete property: $e');
    }
  }

  // edit a listing by id
  Future<PropertyListing> editListingById({ required String name, required PropertyListing listing }) async {
    try {
      final response = await _dio.put('$_baseUrl/api/method/imba.www.main.edit_bnb_listing', queryParameters: {
        'name': name,
      }, data: listing.toJson());
      return PropertyListing.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to edit property: $e');
    }
  }
}