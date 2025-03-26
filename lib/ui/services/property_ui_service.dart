import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/services/service_locator.dart';
import 'package:imba/core/services/property/listing_services.dart';
import 'package:imba/core/services/property/image_service.dart';
import 'package:imba/ui/models/property.dart';
import 'dart:io';

/// Provider for the PropertyUIService
final propertyUIServiceProvider = Provider<PropertyUIService>((ref) {
  final listingService = ref.watch(listingServiceProvider);
  final imageService = ref.watch(imageServiceProvider);
  return PropertyUIService(listingService, imageService);
});

/// UI-friendly interface for property services
class PropertyUIService {
  final ListingService _listingService;
  final ImageService _imageService;

  PropertyUIService(this._listingService, this._imageService);

  /// Get all properties
  Future<List<Property>> getAllProperties() async {
    try {
      final response = await _listingService.getAllListings();
      if (response is Map<String, dynamic>) {
        final data = response['data'];
        if (data is List) {
          return data.map((json) => Property.fromJson(json as Map<String, dynamic>)).toList();
        }
      }
      return [];
    } catch (e) {
      print('Error in getAllProperties: $e');
      rethrow;
    }
  }

  /// Get property by ID
  Future<Property> getPropertyById(String propertyId) async {
    try {
      final listing = await _listingService.getListingById(propertyId);
      return Property.fromJson(listing);
    } catch (e) {
      rethrow;
    }
  }

  /// Create a new property
  Future<Property> createProperty(Property property) async {
    try {
      final response = await _listingService.createListing(
        listingName: property.title,
        location: property.location,
        price: property.price,
        listingAgent: '', // TODO: Get from auth service
        propertyOwner: property.ownerId,
        service: 'Renting', // TODO: Add to property model
        description: property.description,
      );
      return Property.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Update an existing property
  Future<Property> updateProperty(Property property) async {
    try {
      final response = await _listingService.editListing(
        listingId: property.id,
        listingName: property.title,
        location: property.location,
        price: property.price,
        description: property.description,
      );
      return Property.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Delete a property
  Future<void> deleteProperty(String propertyId) async {
    try {
      await _listingService.deleteListing(propertyId);
    } catch (e) {
      rethrow;
    }
  }

  /// Upload property image
  Future<String> uploadPropertyImage(String propertyId, String imagePath) async {
    try {
      final response = await _imageService.uploadImage(
        listingId: propertyId,
        imageFile: File(imagePath),
      );
      return response['url'] ?? '';
    } catch (e) {
      rethrow;
    }
  }

  /// Get property images
  Future<List<String>> getPropertyImages(String propertyId) async {
    try {
      final response = await _imageService.getListingImages(propertyId);
      final images = response['message'] as List<dynamic>;
      return images.map((img) => (img as Map<String, dynamic>)['url'] as String? ?? '').toList();
    } catch (e) {
      rethrow;
    }
  }
}
