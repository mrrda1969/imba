import 'package:imba/core/services/base_service.dart';

class ListingService {
  final ApiService _apiService;

  ListingService(this._apiService);

  Future<Map<String, dynamic>> createListing({
    required String listingName,
    required String location,
    required double price,
    required String listingAgent,
    required String propertyOwner,
    required String service,
    String? description,
  }) async {
    return await _apiService.sendRequest(
      endpoint: 'create_bnb_listing',
      method: 'POST',
      queryParams: {
        'listing_name': listingName,
        'location': location,
        'price': price.toString(),
        'listing_agent': listingAgent,
        'property_owner': propertyOwner,
        'service': service,
        if (description != null) 'description': description,
      },
    );
  }

  Future<Map<String, dynamic>> getAllListings() async {
    return await _apiService.sendRequest(
      endpoint: 'get_all_bnb_listings',
      method: 'POST',
    );
  }

  Future<Map<String, dynamic>> getListingById(String listingName) async {
    return await _apiService.sendRequest(
      endpoint: 'get_bnb_listing_by_name',
      method: 'GET',
      queryParams: {'listing_name': listingName},
    );
  }

  Future<Map<String, dynamic>> deleteListing(String listingId) async {
    return await _apiService.sendRequest(
      endpoint: 'delete_bnb_listing',
      method: 'DELETE',
      queryParams: {'name': listingId},
    );
  }

  Future<Map<String, dynamic>> editListing({
    required String listingId,
    String? listingName,
    String? listingAgent,
    String? propertyOwner,
    String? service,
    String? description,
    String? location,
    double? price,
  }) async {
    return await _apiService.sendRequest(
      endpoint: 'edit_bnb_listing',
      method: 'POST',
      queryParams: {
        'name': listingId,
        if (listingName != null) 'listing_name': listingName,
        if (listingAgent != null) 'listing_agent': listingAgent,
        if (propertyOwner != null) 'property_owner': propertyOwner,
        if (service != null) 'service': service,
        if (description != null) 'description': description,
        if (location != null) 'location': location,
        if (price != null) 'price': price.toString(),
      },
    );
  }
}