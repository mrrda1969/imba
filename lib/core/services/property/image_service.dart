import 'package:imba/core/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ImageService {
  final ApiService _apiService;

  ImageService(this._apiService);

  Future<Map<String, dynamic>> uploadImage({
    required String listingId,
    required File imageFile,
  }) async {
    final file = await http.MultipartFile.fromPath(
      'image_file',
      imageFile.path,
    );

    return await _apiService.sendRequest(
      endpoint: 'upload_image',
      method: 'POST',
      body: {'property_name': listingId},
      files: [file],
    );
  }

  Future<Map<String, dynamic>> deleteImage(String imageId) async {
    return await _apiService.sendRequest(
      endpoint: 'delete_image',
      method: 'DELETE',
      queryParams: {'image_id': imageId},
    );
  }

  Future<Map<String, dynamic>> getListingImages(String listingName) async {
    return await _apiService.sendRequest(
      endpoint: 'get_images_by_listing',
      method: 'GET',
      queryParams: {'listing_name': listingName},
    );
  }
}