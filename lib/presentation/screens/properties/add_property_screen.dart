import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/auth_provider.dart';
import 'package:imba/core/providers/property_provider.dart';
import 'package:imba/data/models/property.dart';
import 'package:imba/data/models/user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:imba/presentation/widgets/form/input_text_field.dart';

class AddPropertyScreen extends ConsumerStatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  ConsumerState<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends ConsumerState<AddPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  final _bedroomsController = TextEditingController();
  final _bathroomsController = TextEditingController();
  final _areaController = TextEditingController();
  final _typeController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  List<String> _amenities = [];
  List<String> _images = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    _bedroomsController.dispose();
    _bathroomsController.dispose();
    _areaController.dispose();
    _typeController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showMessage('Location services are disabled.');
        setState(() => _isLoading = false);
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showMessage('Location permissions are denied.');
          setState(() => _isLoading = false);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showMessage('Location permissions are permanently denied.');
        setState(() => _isLoading = false);
        return;
      }

      late LocationSettings locationSettings;

      if (defaultTargetPlatform == TargetPlatform.android) {
        locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 1,
          forceLocationManager: true,
        );
      } else if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS) {
        locationSettings = AppleSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 1,
          showBackgroundLocationIndicator: false,
        );
      } else if (kIsWeb) {
        locationSettings = WebSettings(
          accuracy: LocationAccuracy.best,
          distanceFilter: 1,
          maximumAge: Duration(minutes: 5),
        );
      } else {
        locationSettings = LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 1,
        );
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      _latitudeController.text = position.latitude.toString();
      _longitudeController.text = position.longitude.toString();
      _locationController.text = '${position.latitude}, ${position.longitude}';
    } catch (e) {
      _showMessage('Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _submitForm({bool isComplete = false}) async {
    if (_formKey.currentState?.validate() ?? false) {
      final user = ref.read(authProvider).user;
      if (user == null) return;

      final property = Property(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        location:
            _locationController.text.isNotEmpty
                ? _locationController.text
                : null,
        price:
            _priceController.text.isNotEmpty
                ? double.parse(_priceController.text)
                : null,
        images: _images,
        bedrooms:
            _bedroomsController.text.isNotEmpty
                ? int.parse(_bedroomsController.text)
                : null,
        bathrooms:
            _bathroomsController.text.isNotEmpty
                ? int.parse(_bathroomsController.text)
                : null,
        area:
            _areaController.text.isNotEmpty
                ? double.parse(_areaController.text)
                : null,
        type: _typeController.text.isNotEmpty ? _typeController.text : null,
        amenities: _amenities,
        latitude:
            _latitudeController.text.isNotEmpty
                ? double.parse(_latitudeController.text)
                : null,
        longitude:
            _longitudeController.text.isNotEmpty
                ? double.parse(_longitudeController.text)
                : null,
        isFavorite: false,
        ownerId: user.role == UserRole.landlord ? user.id : null,
        agentId: user.role == UserRole.agent ? user.id : null,
        isComplete: isComplete,
      );

      try {
        await ref.read(propertyProvider.notifier).createProperty(property);
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error creating property: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Property')),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputTextField(
                      controller: _titleController,
                      label: 'Title *',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(label: Text('Description *')),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: _locationController,
                      label: 'Location *',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _getCurrentLocation,
                      icon:
                          _isLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                              : const Icon(Icons.my_location),
                      label: Text(
                        _isLoading
                            ? 'Getting Location...'
                            : 'Use Current Location',
                      ),
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: _priceController,
                      label: 'Price *',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            double.tryParse(value) == null) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                            controller: _bedroomsController,
                            label: 'Bedrooms (Optional)',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value != null &&
                                  value.isNotEmpty &&
                                  int.tryParse(value) == null) {
                                return 'Invalid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InputTextField(
                            controller: _bathroomsController,
                            label: 'Bathrooms (Optional)',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value != null &&
                                  value.isNotEmpty &&
                                  int.tryParse(value) == null) {
                                return 'Invalid number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: _areaController,
                      label: 'Area (sq ft) (Optional)',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            double.tryParse(value) == null) {
                          return 'Please enter a valid area';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      controller: _typeController,
                      label: 'Type (Optional)',
                    ),
                    const SizedBox(height: 16),

                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _submitForm(isComplete: true),
                            child: const Text('Complete & Save'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
