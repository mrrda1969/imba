import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/property_provider.dart';
import 'package:imba/presentation/widgets/property_card.dart';

class PropertyListScreen extends ConsumerStatefulWidget {
  const PropertyListScreen({super.key});

  @override
  ConsumerState<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends ConsumerState<PropertyListScreen> {
  final _searchController = TextEditingController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(propertyProvider.notifier).loadProperties();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const _FilterBottomSheet(),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const _SortBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final propertyState = ref.watch(propertyProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: const Text('Find Your Perfect Home'),
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(_showFilters ? 120 : 80),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search properties...',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon:
                                  _searchController.text.isNotEmpty
                                      ? IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          _searchController.clear();
                                          ref
                                              .read(propertyProvider.notifier)
                                              .setSearchQuery(null);
                                        },
                                      )
                                      : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).colorScheme.surface,
                            ),
                            onChanged: (value) {
                              ref
                                  .read(propertyProvider.notifier)
                                  .setSearchQuery(value.isEmpty ? null : value);
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          icon: const Icon(Icons.tune),
                          onPressed: _showFilterBottomSheet,
                        ),
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          icon: const Icon(Icons.sort),
                          onPressed: _showSortBottomSheet,
                        ),
                      ],
                    ),
                  ),
                  if (_showFilters) ...[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _FilterChip(
                            label: 'All',
                            selected: propertyState.propertyType == null,
                            onSelected:
                                (_) => ref
                                    .read(propertyProvider.notifier)
                                    .setPropertyType(null),
                          ),
                          _FilterChip(
                            label: 'Apartment',
                            selected: propertyState.propertyType == 'Apartment',
                            onSelected:
                                (_) => ref
                                    .read(propertyProvider.notifier)
                                    .setPropertyType('Apartment'),
                          ),
                          _FilterChip(
                            label: 'House',
                            selected: propertyState.propertyType == 'House',
                            onSelected:
                                (_) => ref
                                    .read(propertyProvider.notifier)
                                    .setPropertyType('House'),
                          ),
                          _FilterChip(
                            label: 'Penthouse',
                            selected: propertyState.propertyType == 'Penthouse',
                            onSelected:
                                (_) => ref
                                    .read(propertyProvider.notifier)
                                    .setPropertyType('Penthouse'),
                          ),
                          _FilterChip(
                            label: 'Studio',
                            selected: propertyState.propertyType == 'Studio',
                            onSelected:
                                (_) => ref
                                    .read(propertyProvider.notifier)
                                    .setPropertyType('Studio'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _showFilters ? Icons.filter_list_off : Icons.filter_list,
                ),
                onPressed: () {
                  setState(() {
                    _showFilters = !_showFilters;
                  });
                },
              ),
            ],
          ),
          if (propertyState.isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (propertyState.error != null)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      propertyState.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed:
                          () =>
                              ref
                                  .read(propertyProvider.notifier)
                                  .loadProperties(),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            )
          else if (propertyState.properties.isEmpty)
            const SliverFillRemaining(
              child: Center(child: Text('No properties found')),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final property = propertyState.properties[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PropertyCard(
                      property: property,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/property-detail',
                          arguments: property.id,
                        );
                      },
                      onFavorite: () {},
                      // () => ref
                      //     .read(propertyProvider.notifier)
                      //     .toggleFavorite(property),
                    ),
                  );
                }, childCount: propertyState.properties.length),
              ),
            ),
        ],
      ),
    );
  }
}

// filepath: /home/rda/src/imba/lib/presentation/screens/properties/property_list_screen.dart
class _FilterBottomSheet extends ConsumerWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filters',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text('Price Range', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          RangeSlider(
            values: RangeValues(
              propertyState.minPrice ?? 0,
              propertyState.maxPrice ?? 5000,
            ),
            min: 0,
            max: 5000,
            divisions: 50,
            labels: RangeLabels(
              '\$${(propertyState.minPrice ?? 0).toStringAsFixed(0)}',
              '\$${(propertyState.maxPrice ?? 5000).toStringAsFixed(0)}',
            ),
            onChanged: (values) {
              ref
                  .read(propertyProvider.notifier)
                  .setPriceRange(values.start, values.end);
            },
          ),
          const SizedBox(height: 24),
          Text('Bedrooms', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              _FilterChip(
                label: 'Any',
                selected: propertyState.minBedrooms == null,
                onSelected:
                    (_) => ref
                        .read(propertyProvider.notifier)
                        .setMinBedrooms(null),
              ),
              _FilterChip(
                label: '1+',
                selected: propertyState.minBedrooms == 1,
                onSelected:
                    (_) =>
                        ref.read(propertyProvider.notifier).setMinBedrooms(1),
              ),
              _FilterChip(
                label: '2+',
                selected: propertyState.minBedrooms == 2,
                onSelected:
                    (_) =>
                        ref.read(propertyProvider.notifier).setMinBedrooms(2),
              ),
              _FilterChip(
                label: '3+',
                selected: propertyState.minBedrooms == 3,
                onSelected:
                    (_) =>
                        ref.read(propertyProvider.notifier).setMinBedrooms(3),
              ),
              _FilterChip(
                label: '4+',
                selected: propertyState.minBedrooms == 4,
                onSelected:
                    (_) =>
                        ref.read(propertyProvider.notifier).setMinBedrooms(4),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ref.read(propertyProvider.notifier).resetFilters();
                  Navigator.pop(context);
                },
                child: const Text('Clear Filters'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SortBottomSheet extends ConsumerWidget {
  const _SortBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Sort By',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _SortOption(
            title: 'Price: Low to High',
            selected:
                ref.read(propertyProvider).sortBy == 'price' &&
                ref.read(propertyProvider).sortOrder == 'asc',
            onTap: () {
              ref
                  .read(propertyProvider.notifier)
                  .setSortOptions('price', 'asc');
              Navigator.pop(context);
            },
          ),
          _SortOption(
            title: 'Price: High to Low',
            selected:
                ref.read(propertyProvider).sortBy == 'price' &&
                ref.read(propertyProvider).sortOrder == 'desc',
            onTap: () {
              ref
                  .read(propertyProvider.notifier)
                  .setSortOptions('price', 'desc');
              Navigator.pop(context);
            },
          ),
          // _SortOption(
          //   title: 'Newest First',
          //   selected:
          //       ref.read(propertyProvider).sortBy == 'createdAt' &&
          //       ref.read(propertyProvider).sortOrder == 'desc',
          //   onTap: () {
          //     ref
          //         .read(propertyProvider.notifier)
          //         .setSortOptions('createdAt', 'desc');
          //     Navigator.pop(context);
          //   },
          // ),
          // _SortOption(
          //   title: 'Oldest First',
          //   selected:
          //       ref.read(propertyProvider).sortBy == 'createdAt' &&
          //       ref.read(propertyProvider).sortOrder == 'asc',
          //   onTap: () {
          //     ref
          //         .read(propertyProvider.notifier)
          //         .setSortOptions('createdAt', 'asc');
          //     Navigator.pop(context);
          //   },
          // ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Apply Sorting'),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function(bool)? onSelected;

  const _FilterChip({
    required this.label,
    required this.selected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
    );
  }
}

class _SortOption extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _SortOption({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(title),
      trailing: selected ? const Icon(Icons.check) : null,
      tileColor: selected ? theme.colorScheme.primaryContainer : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
    );
  }
}
