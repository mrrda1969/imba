import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/utils/locations.dart';

final citiesProvider = Provider<List<String>>((ref) {
  return suburbsByCity.keys.toList();
});

final locationProvider = StateProvider<String?>((ref) => null);

final availableSuburbsProvider = Provider<List<String>>((ref) {
  final selectedCity = ref.watch(locationProvider);

  if (selectedCity == null) {
    return [];
  }

  return suburbsByCity[selectedCity] ?? [];
});

final formLocationProvider = StateProvider<String?>((ref) => null);

final availableFormSuburbsProvider = Provider<List<String>>((ref) {
  final selectedCity = ref.watch(formLocationProvider);

  if (selectedCity == null) {
    return [];
  }

  return suburbsByCity[selectedCity] ?? [];
});
