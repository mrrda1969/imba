// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listingsHash() => r'919112567ffa2d4b71e719bf7c782321c8777eef';

/// Holds the list of all listings
///
/// Copied from [listings].
@ProviderFor(listings)
final listingsProvider = AutoDisposeProvider<List<Listing>>.internal(
  listings,
  name: r'listingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListingsRef = AutoDisposeProviderRef<List<Listing>>;
String _$selectedListingHash() => r'ef16401ec19f79f32898edd39e021ebc44a4719a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Selected listing by ID
///
/// Copied from [selectedListing].
@ProviderFor(selectedListing)
const selectedListingProvider = SelectedListingFamily();

/// Selected listing by ID
///
/// Copied from [selectedListing].
class SelectedListingFamily extends Family<Listing> {
  /// Selected listing by ID
  ///
  /// Copied from [selectedListing].
  const SelectedListingFamily();

  /// Selected listing by ID
  ///
  /// Copied from [selectedListing].
  SelectedListingProvider call(String id) {
    return SelectedListingProvider(id);
  }

  @override
  SelectedListingProvider getProviderOverride(
    covariant SelectedListingProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedListingProvider';
}

/// Selected listing by ID
///
/// Copied from [selectedListing].
class SelectedListingProvider extends AutoDisposeProvider<Listing> {
  /// Selected listing by ID
  ///
  /// Copied from [selectedListing].
  SelectedListingProvider(String id)
    : this._internal(
        (ref) => selectedListing(ref as SelectedListingRef, id),
        from: selectedListingProvider,
        name: r'selectedListingProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$selectedListingHash,
        dependencies: SelectedListingFamily._dependencies,
        allTransitiveDependencies:
            SelectedListingFamily._allTransitiveDependencies,
        id: id,
      );

  SelectedListingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(Listing Function(SelectedListingRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SelectedListingProvider._internal(
        (ref) => create(ref as SelectedListingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Listing> createElement() {
    return _SelectedListingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedListingProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedListingRef on AutoDisposeProviderRef<Listing> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SelectedListingProviderElement
    extends AutoDisposeProviderElement<Listing>
    with SelectedListingRef {
  _SelectedListingProviderElement(super.provider);

  @override
  String get id => (origin as SelectedListingProvider).id;
}

String _$listingImagesHash() => r'c710638f5f5b8260fac982c26c52a83c1c06b680';

/// Listing images extracted from all listings
///
/// Copied from [listingImages].
@ProviderFor(listingImages)
final listingImagesProvider = AutoDisposeProvider<List<String>>.internal(
  listingImages,
  name: r'listingImagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listingImagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ListingImagesRef = AutoDisposeProviderRef<List<String>>;
String _$filteredListingsHash() => r'c2f9ed9145aae501181c679741e1809da88b19db';

/// Filtered listings based on multiple criteria
///
/// Copied from [filteredListings].
@ProviderFor(filteredListings)
final filteredListingsProvider = AutoDisposeProvider<List<Listing>>.internal(
  filteredListings,
  name: r'filteredListingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredListingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredListingsRef = AutoDisposeProviderRef<List<Listing>>;
String _$searchQueryHash() => r'286abcff51dc844febe02639bb2e883ccab22cfd';

/// State provider for search query
///
/// Copied from [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
      SearchQuery.new,
      name: r'searchQueryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
