import 'package:dio/dio.dart';

class ImageServices {
  final Dio _dio;
  final String _baseUrl;

  ImageServices({ required Dio dio, required String baseUrl })
      : _dio = dio,
        _baseUrl = baseUrl;

  // Upload image for a listing
  Future<String> uploadImage({ required String listingId, required String image }) async {
    try {
      final response = await _dio.post('$_baseUrl/api/method/imba.www.main.upload_image', data: {
        'property_name': listingId,
        'image': image,
      });
      return response.data['image_url'];
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  // Delete image for a listing
  Future<void> deleteImage({ required String imageId }) async {
    try {
      await _dio.delete('$_baseUrl/api/method/imba.www.main.delete_image', queryParameters: {
        'image_id': imageId,
      });
    } catch (e) {
      throw Exception('Failed to delete image: $e');
    }
  }

  // Get all images for a listing
  Future<List<String>> getAllImages({ required String listingId }) async {
    try {
      final response = await _dio.get('$_baseUrl/api/method/imba.www.main.get_images', queryParameters: {
        'listing_name': listingId,
      });
      return response.data['images'];
    } catch (e) {
      throw Exception('Failed to get images: $e');
    }
  }
}