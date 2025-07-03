import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:imba/core/utils/locations.dart';

part 'search_providers.g.dart';

/// List of available cities
@riverpod
List<String> searchCity(Ref ref) {
  return suburbsByCity.keys.toList();
}

/// Selected city state
@riverpod
class SearchLocation extends _$SearchLocation {
  String? build() => null;

  void set(String? city) => state = city;
}

/// Available suburbs based on selected city
@riverpod
List<String> availableSuburbs(Ref ref) {
  final selectedCity = ref.watch(searchLocationProvider);

  if (selectedCity == null) return [];

  return suburbsByCity[selectedCity] ?? [];
}
