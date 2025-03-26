import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/models/property.dart';
import 'package:imba/ui/services/property_ui_service.dart';

/// State class for property data
class PropertyState {
  final bool isLoading;
  final String? errorMessage;
  final List<Property>? properties;
  final Property? selectedProperty;

  PropertyState({
    this.isLoading = false,
    this.errorMessage,
    this.properties,
    this.selectedProperty,
  });

  PropertyState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Property>? properties,
    Property? selectedProperty,
    bool clearError = false,
    bool clearProperties = false,
    bool clearSelectedProperty = false,
  }) {
    return PropertyState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      properties: clearProperties ? null : properties ?? this.properties,
      selectedProperty: clearSelectedProperty ? null : selectedProperty ?? this.selectedProperty,
    );
  }
}

/// Provider for property state
final propertyStateProvider = StateNotifierProvider<PropertyStateNotifier, PropertyState>((ref) {
  final propertyService = ref.watch(propertyUIServiceProvider);
  return PropertyStateNotifier(propertyService);
});

/// Notifier for property state
class PropertyStateNotifier extends StateNotifier<PropertyState> {
  final PropertyUIService _propertyService;

  PropertyStateNotifier(this._propertyService) : super(PropertyState());

  /// Load all properties
  Future<void> loadProperties() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final properties = await _propertyService.getAllProperties();
      state = state.copyWith(
        isLoading: false,
        properties: properties,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Load property by ID
  Future<void> loadPropertyById(String propertyId) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final property = await _propertyService.getPropertyById(propertyId);
      state = state.copyWith(
        isLoading: false,
        selectedProperty: property,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Create a new property
  Future<bool> createProperty(Property property) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final newProperty = await _propertyService.createProperty(property);
      
      // Update properties list if it exists
      final currentProperties = state.properties;
      if (currentProperties != null) {
        state = state.copyWith(
          isLoading: false,
          properties: [...currentProperties, newProperty],
          selectedProperty: newProperty,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          selectedProperty: newProperty,
        );
      }
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Update an existing property
  Future<bool> updateProperty(Property property) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final updatedProperty = await _propertyService.updateProperty(property);
      
      // Update properties list if it exists
      final currentProperties = state.properties;
      if (currentProperties != null) {
        state = state.copyWith(
          isLoading: false,
          properties: currentProperties.map((p) => 
            p.id == updatedProperty.id ? updatedProperty : p
          ).toList(),
          selectedProperty: updatedProperty,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          selectedProperty: updatedProperty,
        );
      }
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Delete a property
  Future<bool> deleteProperty(String propertyId) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _propertyService.deleteProperty(propertyId);
      
      // Update properties list if it exists
      final currentProperties = state.properties;
      if (currentProperties != null) {
        state = state.copyWith(
          isLoading: false,
          properties: currentProperties.where((p) => p.id != propertyId).toList(),
          clearSelectedProperty: state.selectedProperty?.id == propertyId,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          clearSelectedProperty: state.selectedProperty?.id == propertyId,
        );
      }
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Clear selected property
  void clearSelectedProperty() {
    state = state.copyWith(clearSelectedProperty: true);
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
