import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/listings/presentation/providers/location_provider.dart';
import 'package:imba/core/utils/locations.dart';
import 'package:imba/ui/listings/presentation/providers/agency_provider.dart';
import 'package:imba/ui/auth/presentation/providers/auth_providers.dart';

class CreateListing extends ConsumerStatefulWidget {
  const CreateListing({super.key});

  @override
  ConsumerState<CreateListing> createState() => _CreateListingState();
}

class _CreateListingState extends ConsumerState<CreateListing> {
  late final TextEditingController titleController;
  late final TextEditingController priceController;
  late final TextEditingController descriptionController;
  late final TextEditingController cityController;
  late final TextEditingController surburbController;
  String? selectedAgencyId;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    cityController = TextEditingController();
    surburbController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    cityController.dispose();
    surburbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    if (user == null || user.role != 'agent') {
      return Scaffold(
        appBar: AppBar(title: Text('Add New House to Listings')),
        body: Center(child: Text('Only agents can create listings.')),
      );
    }
    final agencies = ref.watch(agenciesProvider);
    final selectedCity = ref.watch(formLocationProvider);
    final availableSuburbs = formSuburbsByCity[selectedCity] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Add New House to Listings')),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add New House Listing',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Listing Title',
                    hintText: 'Name that appears on your listing',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownMenu<String>(
                        controller: cityController,
                        label: const Text('City'),
                        expandedInsets: EdgeInsets.zero,
                        dropdownMenuEntries: suburbsByCity.keys.map((
                          String city,
                        ) {
                          return DropdownMenuEntry<String>(
                            value: city,
                            label: city,
                          );
                        }).toList(),
                        onSelected: (String? city) {
                          if (city != null) {
                            ref.read(formLocationProvider.notifier).state =
                                city;
                            surburbController.clear();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: DropdownMenu<String>(
                        controller: surburbController,
                        enabled: availableSuburbs.isNotEmpty,
                        label: Text(
                          availableSuburbs.isNotEmpty
                              ? 'Suburb'
                              : 'Select a city first',
                        ),
                        expandedInsets: EdgeInsets.zero,
                        dropdownMenuEntries: availableSuburbs.map((
                          String suburb,
                        ) {
                          return DropdownMenuEntry<String>(
                            value: suburb,
                            label: suburb,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price (USD)'),
                ),
                const SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 16),
                // Agency selection dropdown
                DropdownButtonFormField<String>(
                  value: selectedAgencyId,
                  decoration: const InputDecoration(
                    labelText: 'Agency (optional)',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    const DropdownMenuItem<String>(
                      value: null,
                      child: Text('No Agency'),
                    ),
                    ...agencies.map(
                      (agency) => DropdownMenuItem<String>(
                        value: agency.agencyId,
                        child: Text(agency.agencyName),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedAgencyId = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
