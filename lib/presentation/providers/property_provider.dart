import 'package:flutter/foundation.dart';
import '../../data/models/property_listing_model.dart';
import '../../data/repositories/property_repository.dart';

class PropertyProvider with ChangeNotifier {
  final PropertyRepository _repository;

  List<PropertyListing> _propertyListings = [];
  bool _isLoading = false;
  String? _error;

  // Filters
  String? _searchQuery;
  double? _minPrice;
  double? _maxPrice;
  String? _sortBy;
  String? _sortOrder;

  PropertyProvider(this._repository);

  // Getters
  List<PropertyListing> get propertyListings => _propertyListings;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // // Filter getters
  String? get searchQuery => _searchQuery;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;
  String? get sortBy => _sortBy;
  String? get sortOrder => _sortOrder;

  Future<void> loadProperties() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _propertyListings = await _repository.getAllProperties();
      _error = null;
    } catch (e) {
      _error = 'Failed to load properties: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // load listing by id
  Future<PropertyListing> getListingById(String name) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      return await _repository.getListingById(name);
    } catch (e) {
      _error = 'Failed to load listing: $e';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadFavorites() async {
    try {
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load favorites: $e';
      notifyListeners();
    }
  }


  // Filter setters
  void setSearchQuery(String? query) {
    _searchQuery = query;
    loadProperties();
  }


  void setPriceRange(double? min, double? max) {
    _minPrice = min;
    _maxPrice = max;
    loadProperties();
  }


  void setSorting(String? by, String? order) {
    _sortBy = by;
    _sortOrder = order;
    loadProperties();
  }

  void resetFilters() {
    _searchQuery = null;
    _minPrice = null;
    _maxPrice = null;
    _sortBy = null;
    _sortOrder = null;
    loadProperties();
  }
}
