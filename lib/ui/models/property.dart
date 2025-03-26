import 'package:flutter/foundation.dart';

/// Property model class for UI layer
class Property {
  final String id;
  final String title;
  final String description;
  final String location;
  final double price;
  final List<String> amenities;
  final List<String> imageUrls;
  final int bedrooms;
  final int bathrooms;
  final int maxGuests;
  final String ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    this.amenities = const [],
    this.imageUrls = const [],
    this.bedrooms = 1,
    this.bathrooms = 1,
    this.maxGuests = 2,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create a Property from a Map (typically from API response)
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['name'] ?? '',
      title: json['listing_name'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      amenities: json['amenities'] != null 
          ? List<String>.from(json['amenities']) 
          : [],
      imageUrls: json['images'] != null 
          ? List<String>.from(json['images']) 
          : [],
      bedrooms: json['bedrooms'] ?? 1,
      bathrooms: json['bathrooms'] ?? 1,
      maxGuests: json['max_guests'] ?? 2,
      ownerId: json['listing_owner'] ?? '',
      createdAt: json['creation'] != null 
          ? DateTime.parse(json['creation']) 
          : DateTime.now(),
      updatedAt: json['modified'] != null 
          ? DateTime.parse(json['modified']) 
          : DateTime.now(),
    );
  }

  /// Convert Property to a Map (typically for API requests)
  Map<String, dynamic> toJson() {
    return {
      'name': id,
      'listing_name': title,
      'description': description,
      'location': location,
      'price': price,
      'amenities': amenities,
      'images': imageUrls,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'max_guests': maxGuests,
      'listing_owner': ownerId,
      'creation': createdAt.toIso8601String(),
      'modified': updatedAt.toIso8601String(),
    };
  }

  /// Create a copy of this Property with the given fields replaced with new values
  Property copyWith({
    String? id,
    String? title,
    String? description,
    String? location,
    double? price,
    List<String>? amenities,
    List<String>? imageUrls,
    int? bedrooms,
    int? bathrooms,
    int? maxGuests,
    String? ownerId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      price: price ?? this.price,
      amenities: amenities ?? this.amenities,
      imageUrls: imageUrls ?? this.imageUrls,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      maxGuests: maxGuests ?? this.maxGuests,
      ownerId: ownerId ?? this.ownerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Property &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.location == location &&
        other.price == price &&
        listEquals(other.amenities, amenities) &&
        listEquals(other.imageUrls, imageUrls) &&
        other.bedrooms == bedrooms &&
        other.bathrooms == bathrooms &&
        other.maxGuests == maxGuests &&
        other.ownerId == ownerId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        location.hashCode ^
        price.hashCode ^
        amenities.hashCode ^
        imageUrls.hashCode ^
        bedrooms.hashCode ^
        bathrooms.hashCode ^
        maxGuests.hashCode ^
        ownerId.hashCode;
  }
}
