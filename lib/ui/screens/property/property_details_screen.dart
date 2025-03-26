import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/models/property.dart';
import 'package:imba/ui/providers/property_ui_providers.dart';
import 'package:imba/ui/utils/snackbar.dart';

class PropertyDetailsScreen extends ConsumerStatefulWidget {
  final String propertyId;

  const PropertyDetailsScreen({
    super.key,
    required this.propertyId,
  });

  @override
  ConsumerState<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends ConsumerState<PropertyDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPropertyDetails();
    });
  }

  Future<void> _loadPropertyDetails() async {
    try {
      await ref.read(propertyStateProvider.notifier).loadPropertyById(widget.propertyId);
    } catch (e) {
      if (mounted) {
        showErrorSnackBar(context, e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final propertyState = ref.watch(propertyStateProvider);
    final selectedProperty = propertyState.selectedProperty;
    final isLoading = propertyState.isLoading;
    final errorMessage = propertyState.errorMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProperty?.title ?? 'Property Details'),
        actions: [
          if (selectedProperty != null)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // TODO: Implement share functionality
                showSuccessSnackBar(context, 'Share feature coming soon!');
              },
            ),
        ],
      ),
      body: _buildBody(isLoading, errorMessage, selectedProperty),
      bottomNavigationBar: selectedProperty != null
          ? _buildBottomBar(context, selectedProperty)
          : null,
    );
  }

  Widget _buildBody(bool isLoading, String? errorMessage, Property? property) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      return Center(
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
              'Error loading property details',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadPropertyDetails,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (property == null) {
      return const Center(
        child: Text('Property not found'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property images
          _buildImageGallery(property),
          
          // Property details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        property.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '\$${property.price.toStringAsFixed(2)} / night',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                
                // Property features
                _buildPropertyFeatures(property),
                
                const Divider(height: 32),
                
                // Property description
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  property.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                
                const Divider(height: 32),
                
                // Amenities
                Text(
                  'Amenities',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                _buildAmenities(property),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGallery(Property property) {
    if (property.imageUrls.isEmpty) {
      return Container(
        height: 250,
        color: Colors.grey[300],
        child: const Center(
          child: Icon(Icons.image_not_supported, size: 64),
        ),
      );
    }

    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: property.imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            property.imageUrls[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 64),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPropertyFeatures(Property property) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFeatureItem(Icons.bed, '${property.bedrooms} Bedrooms'),
        _buildFeatureItem(Icons.bathtub, '${property.bathrooms} Bathrooms'),
        _buildFeatureItem(Icons.person, '${property.maxGuests} Guests'),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Text(text),
      ],
    );
  }

  Widget _buildAmenities(Property property) {
    if (property.amenities.isEmpty) {
      return const Text('No amenities listed');
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: property.amenities.map((amenity) {
        return Chip(
          label: Text(amenity),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar(BuildContext context, Property property) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${property.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Text('per night'),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement booking functionality
                showSuccessSnackBar(context, 'Booking feature coming soon!');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}
