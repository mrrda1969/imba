import 'package:flutter/material.dart';
import 'package:imba/config/routes.dart';
import 'package:imba/data/models/property_listing_model.dart';
import 'package:imba/presentation/providers/property_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/property_card.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({super.key});

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  final _searchController = TextEditingController();
  late Future<List<PropertyListing>> listedProperties;
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PropertyProvider>().loadProperties().catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading properties: ${error.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      });
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
    return Consumer<PropertyProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
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
                                                provider.setSearchQuery(null);
                                              },
                                            )
                                          : null,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.surface,
                                ),
                                onChanged: (value) {
                                  provider.setSearchQuery(
                                    value.isEmpty ? null : value,
                                  );
                                },
                              ),
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
                              // TODO: Add filter chips
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
              if (provider.isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              else if (provider.error != null)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Error loading properties',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            provider.error.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: () => provider.loadProperties(),
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else if (provider.propertyListings.isEmpty)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No properties found'),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      mainAxisExtent: 400,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final property = provider.propertyListings[index];
                      return PropertyCard(
                        property: property,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/property-detail',
                            arguments: property.name,
                          );
                        },
                      );
                    }, childCount: provider.propertyListings.length),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _FilterBottomSheet extends StatelessWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PropertyProvider>();
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters', style: theme.textTheme.titleLarge),
                  TextButton(
                    onPressed: () {
                      provider.resetFilters();
                      Navigator.pop(context);
                    },
                    child: const Text('Reset All'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Price Range', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              RangeSlider(
                values: RangeValues(
                  provider.minPrice ?? 0,
                  provider.maxPrice ?? 5000,
                ),
                min: 0,
                max: 5000,
                divisions: 50,
                labels: RangeLabels(
                  '\$${(provider.minPrice ?? 0).toStringAsFixed(0)}',
                  '\$${(provider.maxPrice ?? 5000).toStringAsFixed(0)}',
                ),
                onChanged: (values) {
                  provider.setPriceRange(values.start, values.end);
                },
              ),
              const SizedBox(height: 24),
              Text('Bedrooms', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: [
                  // TODO: Add filter chips
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Apply Filters')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SortBottomSheet extends StatelessWidget {
  const _SortBottomSheet();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PropertyProvider>();
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sort By', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          _SortOption(
            title: 'Price: Low to High',
            selected: provider.sortBy == 'price' && provider.sortOrder == 'asc',
            onTap: () {
              provider.setSorting('price', 'asc');
              Navigator.pop(context);
            },
          ),
          _SortOption(
            title: 'Price: High to Low',
            selected:
                provider.sortBy == 'price' && provider.sortOrder == 'desc',
            onTap: () {
              provider.setSorting('price', 'desc');
              Navigator.pop(context);
            },
          ),
          _SortOption(
            title: 'Newest First',
            selected:
                provider.sortBy == 'createdAt' && provider.sortOrder == 'desc',
            onTap: () {
              provider.setSorting('createdAt', 'desc');
              Navigator.pop(context);
            },
          ),
          _SortOption(
            title: 'Oldest First',
            selected:
                provider.sortBy == 'createdAt' && provider.sortOrder == 'asc',
            onTap: () {
              provider.setSorting('createdAt', 'asc');
              Navigator.pop(context);
            },
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
