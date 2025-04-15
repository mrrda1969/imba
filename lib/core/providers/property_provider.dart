import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/data/models/property.dart';
import 'package:imba/data/repositories/property_repository.dart';
import 'package:imba/core/providers/property_state.dart';
import 'package:imba/core/providers/repository_providers.dart';

class PropertyNotifier extends StateNotifier<PropertyState> {
  final PropertyRepository _repository;

  PropertyNotifier(this._repository) : super(const PropertyState());

  Future<void> loadProperties() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Use static data for filtering
      final allProperties = Property.getDummyProperties();

      // Apply filters
      final filteredProperties =
          allProperties.where((property) {
            final matchesQuery =
                state.searchQuery == null ||
                property.title.toLowerCase().contains(
                  state.searchQuery!.toLowerCase(),
                ) ||
                property.description.toLowerCase().contains(
                  state.searchQuery!.toLowerCase(),
                ) ||
                property.location.toLowerCase().contains(
                  state.searchQuery!.toLowerCase(),
                );

            final matchesType =
                state.propertyType == null ||
                property.type == state.propertyType;

            final matchesPrice =
                (state.minPrice == null || property.price >= state.minPrice!) &&
                (state.maxPrice == null || property.price <= state.maxPrice!);

            final matchesBedrooms =
                state.minBedrooms == null ||
                property.bedrooms >= state.minBedrooms!;

            return matchesQuery &&
                matchesType &&
                matchesPrice &&
                matchesBedrooms;
          }).toList();

      state = state.copyWith(
        properties: filteredProperties,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load properties: $e',
      );
    }
  }

  Future<void> resetFilters() async {
    state = state.copyWith(
      searchQuery: null,
      propertyType: null,
      minPrice: null,
      maxPrice: null,
      minBedrooms: null,
      sortBy: null,
      sortOrder: null,
    );
    loadProperties();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await _repository.getFavorites();
      state = state.copyWith(favorites: favorites);
    } catch (e) {
      state = state.copyWith(error: 'Failed to load favorites: $e');
    }
  }

  Future<void> toggleFavorite(Property property) async {
    try {
      final isFavorite = !property.isFavorite;
      await _repository.toggleFavorite(property.id, isFavorite);

      // Update the property in both properties and favorites lists
      final updatedProperty = property.copyWith(isFavorite: isFavorite);

      final updatedProperties =
          state.properties.map((p) {
            return p.id == property.id ? updatedProperty : p;
          }).toList();

      final updatedFavorites =
          isFavorite
              ? [...state.favorites, updatedProperty]
              : state.favorites.where((p) => p.id != property.id).toList();

      state = state.copyWith(
        properties: updatedProperties,
        favorites: updatedFavorites,
      );
    } catch (e) {
      state = state.copyWith(error: 'Failed to toggle favorite: $e');
    }
  }

  void setSearchQuery(String? query) {
    state = state.copyWith(searchQuery: query);
    loadProperties();
  }

  void setPropertyType(String? type) {
    state = state.copyWith(propertyType: type);
    loadProperties();
  }

  void setPriceRange(double? min, double? max) {
    state = state.copyWith(minPrice: min, maxPrice: max);
    loadProperties();
  }

  void setMinBedrooms(int? bedrooms) {
    state = state.copyWith(minBedrooms: bedrooms);
    loadProperties();
  }

  // void setSortOptions(String? sortBy, String? sortOrder) {
  //   state = state.copyWith(sortBy: sortBy, sortOrder: sortOrder);
  //   loadProperties();
  // }
  void setSortOptions(String? sortBy, String? sortOrder) {
    state = state.copyWith(sortBy: sortBy, sortOrder: sortOrder);

    // Apply sorting logic
    final sortedProperties = [...state.properties];
    if (sortBy != null && sortOrder != null) {
      sortedProperties.sort((a, b) {
        int comparison = 0;
        if (sortBy == 'price') {
          comparison = a.price.compareTo(b.price);
        }
        return sortOrder == 'asc' ? comparison : -comparison;
      });
    }

    state = state.copyWith(properties: sortedProperties);
  }
}

final propertyProvider = StateNotifierProvider<PropertyNotifier, PropertyState>(
  (ref) {
    final repository = ref.watch(propertyRepositoryProvider);
    return PropertyNotifier(repository);
  },
);
