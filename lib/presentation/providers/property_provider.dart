import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/models/property.dart';
import 'package:imba/data/repositories/property_repository.dart';

class PropertyProvider with ChangeNotifier {
  final PropertyRepository _repository;

  List<Property> _properties = [];
  List<Property> _favorites = [];
  bool _isLoading = false;
  String? _error;

  // Filters
  String? _searchQuery;
  String? _propertyType;
  double? _minPrice;
  double? _maxPrice;
  int? _minBedrooms;
  String? _sortBy;
  String? _sortOrder;

  PropertyProvider(this._repository);

  // Getters
  List<Property> get properties => _properties;
  List<Property> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Filter getters
  String? get searchQuery => _searchQuery;
  String? get propertyType => _propertyType;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;
  int? get minBedrooms => _minBedrooms;
  String? get sortBy => _sortBy;
  String? get sortOrder => _sortOrder;

  Future<void> loadProperties() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Use static data for filtering
      final allProperties = Property.getDummyProperties();

      // Apply search query filter
      _properties =
          allProperties.where((property) {
            final matchesQuery =
                _searchQuery == null ||
                property.title.toLowerCase().contains(
                  _searchQuery!.toLowerCase(),
                ) ||
                property.description.toLowerCase().contains(
                  _searchQuery!.toLowerCase(),
                ) ||
                property.location.toLowerCase().contains(
                  _searchQuery!.toLowerCase(),
                );

            final matchesType =
                _propertyType == null || property.type == _propertyType;

            final matchesPrice =
                (_minPrice == null || property.price >= _minPrice!) &&
                (_maxPrice == null || property.price <= _maxPrice!);

            final matchesBedrooms =
                _minBedrooms == null || property.bedrooms >= _minBedrooms!;
            return matchesQuery &&
                matchesType &&
                matchesPrice &&
                matchesBedrooms;
          }).toList();
      _error = null;
    } catch (e) {
      _error = 'Failed to load properties: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadFavorites() async {
    try {
      _favorites = await _repository.getFavorites();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load favorites: $e';
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Property property) async {
    try {
      final isFavorite = !property.isFavorite;
      await _repository.toggleFavorite(property.id, isFavorite);

      // Update property in the lists
      _properties =
          _properties.map((p) {
            if (p.id == property.id) {
              return p.copyWith(isFavorite: isFavorite);
            }
            return p;
          }).toList();

      if (isFavorite) {
        _favorites.add(property.copyWith(isFavorite: true));
      } else {
        _favorites.removeWhere((p) => p.id == property.id);
      }

      notifyListeners();
    } catch (e) {
      _error = 'Failed to update favorite: $e';
      notifyListeners();
    }
  }

  // Filter setters
  void setSearchQuery(String? query) {
    _searchQuery = query;
    loadProperties();
  }

  void setPropertyType(String? type) {
    _propertyType = type;
    loadProperties();
  }

  void setPriceRange(double? min, double? max) {
    _minPrice = min;
    _maxPrice = max;
    loadProperties();
  }

  void setMinBedrooms(int? bedrooms) {
    _minBedrooms = bedrooms;
    loadProperties();
  }

  void setSorting(String? by, String? order) {
    _sortBy = by;
    _sortOrder = order;
    loadProperties();
  }

  void resetFilters() {
    _searchQuery = null;
    _propertyType = null;
    _minPrice = null;
    _maxPrice = null;
    _minBedrooms = null;
    _sortBy = null;
    _sortOrder = null;
    loadProperties();
  }
}

final searchFiltersProvider = StateProvider<SearchFilters>((ref) {
  return SearchFilters();
});

class SearchFilters {
  final String? searchQuery;
  final String? propertyType;
  final double? minPrice;
  final double? maxPrice;
  final int? minBedrooms;
  final String? sortBy;
  final String? sortOrder;

  const SearchFilters({
    this.searchQuery,
    this.propertyType,
    this.minPrice,
    this.maxPrice,
    this.minBedrooms,
    this.sortBy,
    this.sortOrder,
  });

  SearchFilters copyWith({
    String? searchQuery,
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    String? sortBy,
    String? sortOrder,
  }) {
    return SearchFilters(
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
