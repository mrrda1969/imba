import 'package:imba/data/models/property.dart';

class PropertyState {
  final List<Property> properties;
  final List<Property> favorites;
  final bool isLoading;
  final String? error;
  final String? searchQuery;
  final String? propertyType;
  final double? minPrice;
  final double? maxPrice;
  final int? minBedrooms;
  final String? sortBy;
  final String? sortOrder;

  const PropertyState({
    this.properties = const [],
    this.favorites = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery,
    this.propertyType,
    this.minPrice,
    this.maxPrice,
    this.minBedrooms,
    this.sortBy,
    this.sortOrder,
  });

  PropertyState copyWith({
    List<Property>? properties,
    List<Property>? favorites,
    bool? isLoading,
    String? error,
    String? searchQuery,
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    String? sortBy,
    String? sortOrder,
  }) {
    return PropertyState(
      properties: properties ?? this.properties,
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      propertyType: propertyType ?? this.propertyType,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      minBedrooms: minBedrooms ?? this.minBedrooms,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
