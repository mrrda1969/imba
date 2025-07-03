import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/listings/presentation/providers/listings_provider.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';
import 'package:imba/ui/listings/presentation/widgets/property_card.dart';

class MyListingsScreen extends ConsumerWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final listings = ref.watch(listingsProvider);
    final myListings = user == null
        ? []
        : listings
              .where((listing) => listing.listingAgent == user.email)
              .toList();
    return Scaffold(
      appBar: AppBar(title: Text('My Listings')),
      body: myListings.isEmpty
          ? Center(child: Text('No listings found.'))
          : Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = 1;
                      if (constraints.maxWidth > 1200) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth > 800) {
                        crossAxisCount = 2;
                      } else {
                        crossAxisCount = 1;
                      }

                      return GridView.builder(
                        padding: const EdgeInsets.all(16.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: constraints.maxWidth > 720
                              ? 1.2
                              : 1.1,
                        ),
                        itemCount: myListings.length,
                        itemBuilder: (context, index) {
                          return PropertyCard(listing: myListings[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
