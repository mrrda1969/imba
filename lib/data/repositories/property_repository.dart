import 'package:dio/dio.dart';
import 'package:imba/data/models/property_listing_model.dart';

class PropertyRepository {
  final Dio _dio;
  final String _baseUrl;

  PropertyRepository({
    required Dio dio,
    String? baseUrl,
  }) : _dio = dio,
       _baseUrl = baseUrl ?? 'https://imba.durihub.co.zw';

  // get all properties
  Future<List<PropertyListing>> getAllProperties() async {
    try {
      final response = await _dio.get('$_baseUrl/api/method/imba.www.main.get_all_bnb_listings');
      
      if (response.statusCode == 200) {
        List<dynamic> listingsJson = response.data['data']['listings'];
        List<PropertyListing> listings = listingsJson.map((json) => PropertyListing.fromJson(json)).toList();
        return listings;
      } else {
        throw Exception('Failed to fetch properties');
      }
    } catch (e) {
      throw Exception('Failed to fetch properties: $e');
    }
  }

  // get listing by id
  Future<PropertyListing> getListingById(String name) async {
    try {
      final response = await _dio.get('$_baseUrl/api/method/imba.www.main.get_bnb_listing_by_name', queryParameters: {
        'name': name,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> listingJson = response.data['data']['listing'];
        return PropertyListing.fromJson(listingJson);
      } else {
        throw Exception('Failed to fetch listing');
      }
    } catch (e) {
      throw Exception('Failed to fetch listing: $e');
    }
  }

}
