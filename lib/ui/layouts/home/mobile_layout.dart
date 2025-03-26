import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/models/property.dart';
import 'package:imba/ui/services/property_ui_service.dart';
import 'package:imba/ui/components/search_delegate.dart';
import 'package:imba/ui/screens/property/property_listings_screen.dart';
import 'navigation_provider.dart';

/// Provider for all properties
final propertiesProvider = FutureProvider<List<Property>>((ref) async {
  final propertyService = ref.watch(propertyUIServiceProvider);
  return propertyService.getAllProperties();
});

class MobileLayout extends ConsumerWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imba'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PropertySearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final properties = ref.watch(propertiesProvider);
            
            return properties.when(
              data: (properties) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PropertyListingsScreen(),
                    ],
                  ),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Error loading properties: $error',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.refresh(propertiesProvider);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final currentItem = ref.watch(navigationProvider);
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentItem.index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              ref.read(navigationProvider.notifier).setNavigationItem(
                    NavigationItem.values[index],
                  );
            },
          );
        },
      ),
    );
  }
}