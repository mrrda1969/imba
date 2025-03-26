import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/components/property/property_listing_card.dart';
import 'package:imba/ui/models/property_listing.dart';
import 'package:imba/ui/services/property_ui_service.dart';

/// Provider for property listings
final propertyListingsProvider = FutureProvider<List<PropertyListing>>((ref) async {
  try {
    final propertyService = ref.watch(propertyUIServiceProvider);
    final properties = await propertyService.getAllProperties();
    
    // Convert Property objects to PropertyListing objects
    final listings = properties.map((property) => PropertyListing(
      name: property.id,
      listingName: property.title,
      listingOwner: property.ownerId,
      listingAgent: '', // Not available in the Property model
      location: property.location,
      price: property.price,
      service: 'Renting', // Default to renting since it's in the example
      description: property.description,
    )).toList();
    
    return listings;
  } catch (e) {
    throw Exception('Failed to load property listings: $e');
  }
});

/// A screen that displays a list of property listings
class PropertyListingsScreen extends ConsumerStatefulWidget {
  const PropertyListingsScreen({super.key});

  @override
  ConsumerState<PropertyListingsScreen> createState() => _PropertyListingsScreenState();
}

class _PropertyListingsScreenState extends ConsumerState<PropertyListingsScreen> {
  @override
  void initState() {
    super.initState();
    // Prefetch data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger a refresh
      final _ = ref.refresh(propertyListingsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listingsAsync = ref.watch(propertyListingsProvider);
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return SafeArea(
      child: SizedBox.expand(
        child: listingsAsync.when(
          data: (listings) => _buildListings(listings, isDesktop),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => _buildError(error),
        ),
      ),
    );
  }

  Widget _buildListings(List<PropertyListing> listings, bool isDesktop) {
    if (listings.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_work, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No property listings found',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Check back later for new listings',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    if (isDesktop) {
      return RefreshIndicator(
        onRefresh: () async {
          final _ = ref.refresh(propertyListingsProvider);
          return Future.value();
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final listing = listings[index];
                    return PropertyListingCard(
                      propertyListing: listing,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/property/details',
                          arguments: {'propertyId': listing.name},
                        );
                      },
                    );
                  },
                  childCount: listings.length,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        final _ = ref.refresh(propertyListingsProvider);
        return Future.value();
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: listings.length,
        itemBuilder: (context, index) {
          final listing = listings[index];
          return PropertyListingCard(
            propertyListing: listing,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/property/details',
                arguments: {'propertyId': listing.name},
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildError(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading property listings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final _ = ref.refresh(propertyListingsProvider);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
