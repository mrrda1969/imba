import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/listings/presentation/providers/listings_provider.dart';
import 'package:imba/ui/listings/presentation/widgets/property_card.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';

class PropertyListingsScreen extends ConsumerWidget {
  const PropertyListingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listings = ref.watch(filteredListingsProvider);
    final authState = ref.watch(authProvider);

    // Check if user is authenticated and has agent role
    final isAgent =
        authState.isAuthenticated &&
        authState.user?.role?.toLowerCase() == 'agent';

    return Scaffold(
      body: Column(
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
                    childAspectRatio: constraints.maxWidth > 720 ? 1.2 : 1.1,
                  ),
                  itemCount: listings.length,
                  itemBuilder: (context, index) {
                    return PropertyCard(listing: listings[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:
          isAgent
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/listings/add');
                },
                icon: const Icon(Icons.add),
                label: const Text('Add A Listing'),
              )
              : null,
    );
  }
}
