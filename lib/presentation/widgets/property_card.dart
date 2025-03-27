import 'package:flutter/material.dart';
import '../../data/models/property_listing_model.dart';

class PropertyCard extends StatelessWidget {
  final PropertyListing property;
  final VoidCallback onTap;

  const PropertyCard({
    super.key,
    required this.property,
    required this.onTap,
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
                  // TODO: Add image
                  child: Image.asset('assets/images/image.jpg', fit: BoxFit.cover),
                ),
                // Positioned(
                //   top: 8,
                //   right: 8,
                //   child: IconButton(
                //     icon: Icon(
                //       property.isFavorite
                //           ? Icons.favorite
                //           : Icons.favorite_border,
                //       color: property.isFavorite ? Colors.red : Colors.white,
                //     ),
                //     onPressed: onFavorite,
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.listingName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${property.price}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(property.location),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
