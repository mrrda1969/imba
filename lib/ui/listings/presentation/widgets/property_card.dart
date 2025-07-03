import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/listings/data/models/listing.dart';

class PropertyCard extends ConsumerWidget {
  final Listing listing;

  const PropertyCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> images = listing.images.map((img) => img.url).toList();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => onTap(context),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100, maxHeight: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child:
                          images.isNotEmpty
                              ? PageView.builder(
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Center(
                                              child: Icon(Icons.broken_image),
                                            ),
                                  );
                                },
                              )
                              : Image.network(
                                'https://via.placeholder.com/400',
                                fit: BoxFit.cover,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      listing.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${listing.price.toStringAsFixed(2)}',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${listing.city}, ${listing.surburb}',
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.pushNamed(context, '/listing-details', arguments: listing.id);
  }
}
