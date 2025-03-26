import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/providers/property_ui_providers.dart';

/// A search filter state provider
final searchFiltersProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {};
});

/// A widget to search for properties
class PropertySearch extends ConsumerStatefulWidget {
  final Function(Map<String, dynamic>)? onSearch;
  final bool autoSearch;

  const PropertySearch({
    super.key,
    this.onSearch,
    this.autoSearch = true,
  });

  @override
  ConsumerState<PropertySearch> createState() => _PropertySearchState();
}

class _PropertySearchState extends ConsumerState<PropertySearch> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  
  int _bedrooms = 1;
  int _bathrooms = 1;
  int _guests = 2;
  
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing filter values if any
    final filters = ref.read(searchFiltersProvider);
    if (filters.containsKey('location')) {
      _locationController.text = filters['location'];
    }
    if (filters.containsKey('min_price')) {
      _minPriceController.text = filters['min_price'].toString();
    }
    if (filters.containsKey('max_price')) {
      _maxPriceController.text = filters['max_price'].toString();
    }
    if (filters.containsKey('bedrooms')) {
      _bedrooms = filters['bedrooms'];
    }
    if (filters.containsKey('bathrooms')) {
      _bathrooms = filters['bathrooms'];
    }
    if (filters.containsKey('guests')) {
      _guests = filters['guests'];
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _applySearch() {
    final filters = <String, dynamic>{};
    
    if (_locationController.text.isNotEmpty) {
      filters['location'] = _locationController.text;
    }
    
    if (_minPriceController.text.isNotEmpty) {
      filters['min_price'] = double.tryParse(_minPriceController.text) ?? 0;
    }
    
    if (_maxPriceController.text.isNotEmpty) {
      filters['max_price'] = double.tryParse(_maxPriceController.text) ?? 0;
    }
    
    filters['bedrooms'] = _bedrooms;
    filters['bathrooms'] = _bathrooms;
    filters['guests'] = _guests;
    
    // Update the filters provider
    ref.read(searchFiltersProvider.notifier).state = filters;
    
    // Call the onSearch callback if provided
    if (widget.onSearch != null) {
      widget.onSearch!(filters);
    }
    
    // Auto search if enabled
    if (widget.autoSearch) {
      ref.read(propertyStateProvider.notifier).loadProperties();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find Your Perfect Stay',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            
            // Basic search
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      hintText: 'Where do you want to go?',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _applySearch,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                  ),
                  child: const Text('Search'),
                ),
              ],
            ),
            
            // Advanced search toggle
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_isExpanded ? 'Hide Filters' : 'Show Filters'),
                  Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
            
            // Advanced search options
            if (_isExpanded) ...[
              const SizedBox(height: 16),
              
              // Price range
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minPriceController,
                      decoration: const InputDecoration(
                        labelText: 'Min Price',
                        prefixText: '\$',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _maxPriceController,
                      decoration: const InputDecoration(
                        labelText: 'Max Price',
                        prefixText: '\$',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Bedrooms, bathrooms, guests
              Row(
                children: [
                  Expanded(
                    child: _buildCounter(
                      context,
                      'Bedrooms',
                      Icons.bed,
                      _bedrooms,
                      (value) => setState(() => _bedrooms = value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildCounter(
                      context,
                      'Bathrooms',
                      Icons.bathtub,
                      _bathrooms,
                      (value) => setState(() => _bathrooms = value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildCounter(
                      context,
                      'Guests',
                      Icons.person,
                      _guests,
                      (value) => setState(() => _guests = value),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Apply filters button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _applySearch,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(
    BuildContext context,
    String label,
    IconData icon,
    int value,
    Function(int) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16),
              const SizedBox(width: 4),
              Text(label),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: value > 1 ? () => onChanged(value - 1) : null,
                iconSize: 16,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  value.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => onChanged(value + 1),
                iconSize: 16,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
