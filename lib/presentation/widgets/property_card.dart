import 'package:flutter/material.dart';
import '../../data/models/property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const PropertyCard({
    super.key,
    required this.property,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(property.images[0], fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      property.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: property.isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: onFavorite,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),

                  // Text(
                  //   '\$${property.price.toStringAsFixed(2)}',
                  //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  //     color: Theme.of(context).colorScheme.primary,
                  //   ),
                  // ),
                  // const SizedBox(height: 4),
                  // Text(property.location),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${property.price}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
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
                            property.location,
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
    );
  }
}
