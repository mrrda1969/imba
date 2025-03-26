import 'package:flutter/material.dart';
import 'package:imba/config/routes.dart' show AppRoutes;
import 'package:imba/ui/models/property.dart';

/// A card widget to display property information
class PropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onTap;
  final bool showActions;

  const PropertyCard({
    super.key,
    required this.property,
    this.onTap,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap ?? () {
          Navigator.pushNamed(
            context,
            AppRoutes.propertyDetails,
            arguments: {'propertyId': property.id},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: property.imageUrls.isNotEmpty
                  ? Image.network(
                      property.imageUrls.first,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, size: 50),
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.home, size: 50),
                      ),
                    ),
            ),
            
            // Property details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property.location,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${property.price.toStringAsFixed(2)}/night',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.bed, size: 16),
                          const SizedBox(width: 4),
                          Text('${property.bedrooms}'),
                          const SizedBox(width: 8),
                          const Icon(Icons.bathtub, size: 16),
                          const SizedBox(width: 4),
                          Text('${property.bathrooms}'),
                          const SizedBox(width: 8),
                          const Icon(Icons.person, size: 16),
                          const SizedBox(width: 4),
                          Text('${property.maxGuests}'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Actions
            if (showActions)
              Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.propertyDetails,
                          arguments: {'propertyId': property.id},
                        );
                      },
                      child: const Text('View Details'),
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
