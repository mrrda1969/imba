import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/listings/presentation/providers/agency_provider.dart';
import 'package:imba/ui/listings/presentation/providers/listings_provider.dart';
import 'package:imba/ui/listings/presentation/providers/search_providers.dart';

class NavSearchBar extends ConsumerStatefulWidget {
  const NavSearchBar({super.key});

  @override
  ConsumerState<NavSearchBar> createState() => _NavSearchBarState();
}

class _NavSearchBarState extends ConsumerState<NavSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch(String query, {bool dismiss = false}) {
    ref.read(searchQueryProvider.notifier).update(query);
    setState(() {
      _isSearching = query.isNotEmpty;
    });
    if (dismiss) {
      Navigator.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(searchCityProvider);
    final selectedCity = ref.watch(searchLocationProvider);
    final availableSuburbs = ref.watch(availableSuburbsProvider);
    final availableAgencies = ref.watch(agenciesProvider);
    final selectedSuburb = ref.watch(selectedSuburbProvider);
    final selectedAgency = ref.watch(selectedAgencyProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withValues(alpha: 0.13 * 255),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search properties...',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).hintColor,
                ),
                suffixIcon: _isSearching
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _handleSearch('');
                        },
                      )
                    : null,
              ),
              onChanged: _handleSearch,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => _handleSearch(value, dismiss: true),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () =>
                _handleSearch(_searchController.text, dismiss: true),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text('Search'),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.tune),
            tooltip: 'Filter',
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              // City filter
              PopupMenuItem(
                height: 48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<String>(
                      value: selectedCity,
                      hint: const Text("Select City"),
                      isExpanded: true,
                      items: cities.map((city) {
                        return DropdownMenuItem(value: city, child: Text(city));
                      }).toList(),
                      onChanged: (city) {
                        ref.read(searchLocationProvider.notifier).set(city);
                        ref.read(selectedSuburbProvider.notifier).set(null);
                      },
                    ),
                  ],
                ),
              ),
              // Suburb filter
              PopupMenuItem(
                height: 48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Suburb',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<String>(
                      value: selectedSuburb,
                      hint: Text(
                        availableSuburbs.isEmpty
                            ? 'Select a city first'
                            : 'Select Suburb',
                      ),
                      isExpanded: true,
                      items: availableSuburbs.map((suburb) {
                        return DropdownMenuItem(
                          value: suburb,
                          child: Text(suburb),
                        );
                      }).toList(),
                      onChanged: availableSuburbs.isEmpty
                          ? null
                          : (suburb) {
                              ref
                                  .read(selectedSuburbProvider.notifier)
                                  .set(suburb);
                            },
                    ),
                  ],
                ),
              ),
              // Agency filter
              PopupMenuItem(
                height: 48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Agency',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<String>(
                      value: selectedAgency,
                      hint: const Text("Select Agency"),
                      isExpanded: true,
                      items: availableAgencies.map((agency) {
                        return DropdownMenuItem(
                          value: agency.agencyId,
                          child: Text(agency.agencyName),
                        );
                      }).toList(),
                      onChanged: (agencyId) {
                        ref.read(selectedAgencyProvider.notifier).set(agencyId);
                      },
                    ),
                  ],
                ),
              ),
              // Clear filters
              PopupMenuItem(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Clear Filters',
                      style: TextStyle(color: Colors.red),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear_all, color: Colors.red),
                      onPressed: () {
                        ref.read(searchLocationProvider.notifier).set(null);
                        ref.read(selectedSuburbProvider.notifier).set(null);
                        ref.read(selectedAgencyProvider.notifier).set(null);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
