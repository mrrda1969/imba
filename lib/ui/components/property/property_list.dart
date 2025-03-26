import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/components/property/property_card.dart';
import 'package:imba/ui/models/property.dart';
import 'package:imba/ui/providers/property_ui_providers.dart';

/// A widget to display a list of properties
class PropertyList extends ConsumerWidget {
  final List<Property>? properties;
  final bool isLoading;
  final String? errorMessage;
  final bool autoLoad;
  final ScrollController? scrollController;

  const PropertyList({
    super.key,
    this.properties,
    this.isLoading = false,
    this.errorMessage,
    this.autoLoad = true,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If properties are not provided, use the ones from the provider
    final propertiesState = ref.watch(propertyStateProvider);
    final propertiesNotifier = ref.read(propertyStateProvider.notifier);
    
    final displayProperties = properties ?? propertiesState.properties;
    final displayLoading = isLoading || propertiesState.isLoading;
    final displayError = errorMessage ?? propertiesState.errorMessage;

    // Auto-load properties if needed
    if (autoLoad && displayProperties == null && !displayLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        propertiesNotifier.loadProperties();
      });
    }

    if (displayLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (displayError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error loading properties',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              displayError,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => propertiesNotifier.loadProperties(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (displayProperties == null || displayProperties.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home_work,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'No properties found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search or check back later',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: displayProperties.length,
      itemBuilder: (context, index) {
        final property = displayProperties[index];
        return PropertyCard(property: property);
      },
    );
  }
}
