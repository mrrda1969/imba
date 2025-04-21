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
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

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

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      ref.read(propertyProvider.notifier).searchProperties(query);
    } else {
      ref.read(propertyProvider.notifier).resetSearch();
    }
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _FilterBottomSheet(),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const _SortBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final propertyState = ref.watch(propertyProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (!_isSearching)
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                    )
                  else
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Search properties...',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _isSearching = false;
                                  _searchController.clear();
                                  _handleSearch('');
                                });
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                          ),
                          onChanged: _handleSearch,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          propertyState.when(
            loading:
                () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
            error:
                (error, stackTrace) => SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          error.toString(),
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
                ),
            data: (state) {
              if (state.isLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state.error != null) {
                return SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.error!,
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
                );
              }
              if (state.properties.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text('No properties found')),
                );
              }
              return SliverList(
                delegate: SliverChildListDelegate(
                  state.properties
                      .map(
                        (property) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
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
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showFilterBottomSheet,
        icon: const Icon(Icons.tune),
        label: const Text('Filters'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _FilterBottomSheet extends ConsumerWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyProvider);

    return propertyState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      data:
          (state) => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.sort),
                      onPressed: () {
                        Navigator.pop(context);
                        _showSortBottomSheet(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Location',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter location',
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
                const SizedBox(height: 24),
                Text(
                  'Price Range',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                RangeSlider(
                  values: RangeValues(
                    state.minPrice ?? 0,
                    state.maxPrice ?? 5000,
                  ),
                  min: 0,
                  max: 5000,
                  divisions: 50,
                  labels: RangeLabels(
                    '\$${(state.minPrice ?? 0).toStringAsFixed(0)}',
                    '\$${(state.maxPrice ?? 5000).toStringAsFixed(0)}',
                  ),
                  onChanged: (values) {
                    ref
                        .read(propertyProvider.notifier)
                        .setPriceRange(values.start, values.end);
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        ref.read(propertyProvider.notifier).resetFilters();
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
          ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const _SortBottomSheet(),
    );
  }
}

class _SortBottomSheet extends ConsumerWidget {
  const _SortBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyProvider);

    return propertyState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      data:
          (state) => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Text('Sort By', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                _SortOption(
                  title: 'Price: Low to High',
                  selected: state.sortBy == 'price' && state.sortOrder == 'asc',
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
                      state.sortBy == 'price' && state.sortOrder == 'desc',
                  onTap: () {
                    ref
                        .read(propertyProvider.notifier)
                        .setSortOptions('price', 'desc');
                    Navigator.pop(context);
                  },
                ),
                _SortOption(
                  title: 'Newest First',
                  selected:
                      state.sortBy == 'createdAt' && state.sortOrder == 'desc',
                  onTap: () {
                    ref
                        .read(propertyProvider.notifier)
                        .setSortOptions('createdAt', 'desc');
                    Navigator.pop(context);
                  },
                ),
                _SortOption(
                  title: 'Oldest First',
                  selected:
                      state.sortBy == 'createdAt' && state.sortOrder == 'asc',
                  onTap: () {
                    ref
                        .read(propertyProvider.notifier)
                        .setSortOptions('createdAt', 'asc');
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Sorting'),
                ),
              ],
            ),
          ),
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
