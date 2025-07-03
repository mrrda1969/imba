// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchCityHash() => r'4e8867f91887edf1a373a07000f19a7b0aa98062';

/// List of available cities
///
/// Copied from [searchCity].
@ProviderFor(searchCity)
final searchCityProvider = AutoDisposeProvider<List<String>>.internal(
  searchCity,
  name: r'searchCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchCityRef = AutoDisposeProviderRef<List<String>>;
String _$availableSuburbsHash() => r'b0d32ab9a0a72971931f20355c2587d9b80c702f';

/// Available suburbs based on selected city
///
/// Copied from [availableSuburbs].
@ProviderFor(availableSuburbs)
final availableSuburbsProvider = AutoDisposeProvider<List<String>>.internal(
  availableSuburbs,
  name: r'availableSuburbsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSuburbsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AvailableSuburbsRef = AutoDisposeProviderRef<List<String>>;
String _$searchLocationHash() => r'9a5826e98dcf7a488dacfc50732e87e47a2a5227';

/// Selected city state
///
/// Copied from [SearchLocation].
@ProviderFor(SearchLocation)
final searchLocationProvider =
    AutoDisposeNotifierProvider<SearchLocation, String?>.internal(
      SearchLocation.new,
      name: r'searchLocationProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchLocationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchLocation = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
