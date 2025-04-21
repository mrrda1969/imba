import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/data/models/property.dart';
import 'package:imba/data/models/user.dart';
import 'package:imba/data/repositories/property_repository.dart';
import 'package:imba/core/providers/property_state.dart';
import 'package:imba/core/providers/repository_providers.dart';

final propertyRepositoryProvider = Provider<PropertyRepository>((ref) {
  return PropertyRepository();
});

final myPropertiesProvider = FutureProvider<List<Property>>((ref) async {
  final authState = ref.watch(authProvider);
  final user = authState.user;
  final repository = ref.watch(propertyRepositoryProvider);

  if (user == null) return [];

  if (user.role == UserRole.landlord) {
    return repository.getPropertiesByOwner(user.id);
  } else if (user.role == UserRole.agent) {
    return repository.getPropertiesByAgent(user.id);
  }

  return [];
});

final propertyProvider =
    StateNotifierProvider<PropertyNotifier, AsyncValue<PropertyState>>((ref) {
      return PropertyNotifier(ref.watch(propertyRepositoryProvider));
    });

class PropertyNotifier extends StateNotifier<AsyncValue<PropertyState>> {
  final PropertyRepository _repository;

  PropertyNotifier(this._repository)
    : super(AsyncValue.data(const PropertyState()));

  Future<void> createProperty(Property property) async {
    state = AsyncValue.data(state.value!.copyWith(isLoading: true));
    try {
      final newProperty = await _repository.createProperty(property);
      state = AsyncValue.data(
        state.value!.copyWith(
          isLoading: false,
          properties: [...state.value!.properties, newProperty],
        ),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> loadProperty(String id) async {
    state = AsyncValue.data(state.value!.copyWith(isLoading: true));
    try {
      final property = await _repository.getProperty(id);
      state = AsyncValue.data(
        state.value!.copyWith(isLoading: false, properties: [property]),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> loadProperties() async {
    state = AsyncValue.data(
      state.value!.copyWith(isLoading: true, error: null),
    );

    try {
      // Use static data for filtering
      final allProperties = Property.getDummyProperties();

      // Apply filters
      final filteredProperties =
          allProperties.where((property) {
            final matchesQuery =
                state.value!.searchQuery == null ||
                property.title.toLowerCase().contains(
                  state.value!.searchQuery!.toLowerCase(),
                ) ||
                property.description.toLowerCase().contains(
                  state.value!.searchQuery!.toLowerCase(),
                ) ||
                (property.location?.toLowerCase() ?? '').contains(
                  state.value!.searchQuery!.toLowerCase(),
                );

            final matchesType =
                state.value!.propertyType == null ||
                property.type == state.value!.propertyType;

            final matchesPrice =
                (state.value!.minPrice == null ||
                    (property.price ?? 0) >= state.value!.minPrice!) &&
                (state.value!.maxPrice == null ||
                    (property.price ?? 0) <= state.value!.maxPrice!);

            final matchesBedrooms =
                state.value!.minBedrooms == null ||
                (property.bedrooms != null &&
                    property.bedrooms! >= state.value!.minBedrooms!);

            return matchesQuery &&
                matchesType &&
                matchesPrice &&
                matchesBedrooms;
          }).toList();

      // Apply sorting
      final sortedProperties = [...filteredProperties];
      if (state.value!.sortBy != null && state.value!.sortOrder != null) {
        sortedProperties.sort((a, b) {
          int comparison = 0;
          if (state.value!.sortBy == 'price') {
            comparison = (a.price ?? 0).compareTo(b.price ?? 0);
          } else if (state.value!.sortBy == 'createdAt') {
            // TODO: Add createdAt field to Property model
            comparison = 0;
          }
          return state.value!.sortOrder == 'asc' ? comparison : -comparison;
        });
      }

      state = AsyncValue.data(
        state.value!.copyWith(
          properties: sortedProperties,
          isLoading: false,
          error: null,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(
          isLoading: false,
          error: 'Failed to load properties: $e',
        ),
      );
    }
  }

  Future<void> resetFilters() async {
    state = AsyncValue.data(
      state.value!.copyWith(
        searchQuery: null,
        propertyType: null,
        minPrice: null,
        maxPrice: null,
        minBedrooms: null,
        sortBy: null,
        sortOrder: null,
      ),
    );
    loadProperties();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await _repository.getFavorites();
      state = AsyncValue.data(state.value!.copyWith(favorites: favorites));
    } catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(error: 'Failed to load favorites: $e'),
      );
    }
  }

  Future<void> toggleFavorite(Property property) async {
    try {
      final isFavorite = !property.isFavorite;
      await _repository.toggleFavorite(property.id, isFavorite);

      // Update the property in both properties and favorites lists
      final updatedProperty = property.copyWith(isFavorite: isFavorite);

      final updatedProperties =
          state.value!.properties.map((p) {
            return p.id == property.id ? updatedProperty : p;
          }).toList();

      final updatedFavorites =
          isFavorite
              ? [...state.value!.favorites, updatedProperty]
              : state.value!.favorites
                  .where((p) => p.id != property.id)
                  .toList();

      state = AsyncValue.data(
        state.value!.copyWith(
          properties: updatedProperties,
          favorites: updatedFavorites,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        state.value!.copyWith(error: 'Failed to toggle favorite: $e'),
      );
    }
  }

  void setSearchQuery(String? query) {
    state = AsyncValue.data(state.value!.copyWith(searchQuery: query));
    loadProperties();
  }

  void setPropertyType(String? type) {
    state = AsyncValue.data(state.value!.copyWith(propertyType: type));
    loadProperties();
  }

  void setPriceRange(double? min, double? max) {
    state = AsyncValue.data(
      state.value!.copyWith(minPrice: min, maxPrice: max),
    );
    loadProperties();
  }

  void setMinBedrooms(int? bedrooms) {
    state = AsyncValue.data(state.value!.copyWith(minBedrooms: bedrooms));
    loadProperties();
  }

  void setSortOptions(String? sortBy, String? sortOrder) {
    state = AsyncValue.data(
      state.value!.copyWith(sortBy: sortBy, sortOrder: sortOrder),
    );
    loadProperties();
  }

  void searchProperties(String query) {
    setSearchQuery(query);
  }

  void resetSearch() {
    setSearchQuery(null);
  }
}
