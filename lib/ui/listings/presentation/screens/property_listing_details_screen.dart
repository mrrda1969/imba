import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/listings/data/models/listing.dart';
import 'package:imba/ui/listings/presentation/providers/agency_provider.dart';
import 'package:imba/ui/listings/presentation/providers/listings_provider.dart';
import '../../../shared/fullscreen_image_viewer.dart';

class PropertyListingDetailsScreen extends ConsumerWidget {
  final String listingId;

  const PropertyListingDetailsScreen({required this.listingId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listing = ref.watch(selectedListingProvider(listingId));
    final agencyName = listing.agencyId != null
        ? ref.watch(agencyNameByIdProvider(listing.agencyId!))
        : null;
    final String displayAgent = (agencyName != null && agencyName.isNotEmpty)
        ? agencyName
        : (listing.listingAgent.isNotEmpty
              ? listing.listingAgent
              : 'Unknown Agent');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _BuildSliverAppBar(listing: listing),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PropertyHeader(listing: listing),
                  const SizedBox(height: 24),
                  _PropertyPrice(price: listing.price),
                  const SizedBox(height: 24),
                  _PropertyDescription(description: listing.description),
                  const SizedBox(height: 24),
                  _PropertyAgent(agent: displayAgent),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomActionBar(listing: listing),
    );
  }
}

class _BuildSliverAppBar extends StatelessWidget {
  final Listing listing;

  const _BuildSliverAppBar({required this.listing});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: listing.images.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullscreenImageViewer(
                        images: listing.images.map((img) => img.url).toList(),
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'listing-image-${listing.id}',
                  child: Image.network(
                    listing.images.first.url,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              )
            // Image.network(listing.images.first.url, fit: BoxFit.cover)
            : Container(
                color: Colors.grey[300],
                child: const Icon(Icons.home, size: 100),
              ),
      ),
    );
  }
}

class _PropertyHeader extends StatelessWidget {
  final Listing listing;

  const _PropertyHeader({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(listing.title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16),
            const SizedBox(width: 4),
            Text(
              '${listing.city}, ${listing.surburb}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class _PropertyPrice extends StatelessWidget {
  final double price;

  const _PropertyPrice({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _PropertyDescription extends StatelessWidget {
  final String description;

  const _PropertyDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _PropertyAgent extends StatelessWidget {
  final String agent;

  const _PropertyAgent({required this.agent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Listing Agent', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(child: Text(agent[0])),
            const SizedBox(width: 16),
            Text(agent, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  final Listing listing;

  const _BottomActionBar({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: const Text('Contact Agent'),
            ),
          ),
        ],
      ),
    );
  }
}
