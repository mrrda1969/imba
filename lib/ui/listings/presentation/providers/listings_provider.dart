import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:imba/ui/listings/data/models/listing.dart';
import '../../data/repos/listings.dart';
import 'search_providers.dart';
import 'agency_provider.dart';

part 'listings_provider.g.dart';

/// Holds the list of all listings
@riverpod
List<Listing> listings(Ref ref) {
  return staticListings;
}

/// State provider for search query
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

/// Selected listing by ID
@riverpod
Listing selectedListing(Ref ref, String id) {
  return staticListings.firstWhere(
    (listing) => listing.id == id,
    orElse: () => throw Exception('Listing not found'),
  );
}

/// Listing images extracted from all listings
@riverpod
List<String> listingImages(Ref ref) {
  final listings = ref.watch(listingsProvider);
  return listings
      .expand((listing) => listing.images.map((img) => img.url))
      .toList();
}

/// Filtered listings based on multiple criteria
@riverpod
List<Listing> filteredListings(Ref ref) {
  final listings = ref.watch(listingsProvider);
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();
  final selectedCity = ref.watch(searchLocationProvider);
  final selectedSuburb = ref.watch(selectedSuburbProvider);
  final selectedAgency = ref.watch(selectedAgencyProvider);

  return listings.where((listing) {
    final matchesSearch =
        searchQuery.isEmpty ||
        listing.title.toLowerCase().contains(searchQuery) ||
        listing.city.toLowerCase().contains(searchQuery) ||
        listing.surburb.toLowerCase().contains(searchQuery) ||
        listing.description.toLowerCase().contains(searchQuery);

    final matchesCity = selectedCity == null || listing.city == selectedCity;
    final matchesSuburb =
        selectedSuburb == null || listing.surburb == selectedSuburb;
    final matchesAgency =
        selectedAgency == null || listing.listingAgent == selectedAgency;

    return matchesSearch && matchesCity && matchesSuburb && matchesAgency;
  }).toList();
}
