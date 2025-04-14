import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/core/providers/repository_providers.dart';
import 'package:imba/data/models/property.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailScreen extends ConsumerStatefulWidget {
  final String propertyId;

  const PropertyDetailScreen({super.key, required this.propertyId});

  @override
  ConsumerState<PropertyDetailScreen> createState() =>
      _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends ConsumerState<PropertyDetailScreen> {
  late Future<Property> _propertyFuture;
  final _currencyFormat = NumberFormat.currency(symbol: '\$');
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadProperty();
  }

  void _loadProperty() {
    _propertyFuture = ref
        .read(propertyRepositoryProvider)
        .getProperty(widget.propertyId);
  }

  void _showFullScreenImage(
    BuildContext context,
    String imageUrl,
    int initialIndex,
    List<String> images,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => _FullScreenImageView(
              images: images,
              initialIndex: initialIndex,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Property>(
        future: _propertyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _loadProperty();
                      });
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Property not found'));
          }

          final property = snapshot.data!;

          return Stack(
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 300,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              GestureDetector(
                                onTap:
                                    () => _showFullScreenImage(
                                      context,
                                      property.images[_currentImageIndex],
                                      _currentImageIndex,
                                      property.images,
                                    ),
                                child: Image.network(
                                  property.images[_currentImageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center, // Center the dots horizontally
                                  children: [
                                    for (
                                      int i = 0;
                                      i < property.images.length;
                                      i++
                                    )
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              _currentImageIndex == i
                                                  ? Colors.white
                                                  : Colors.white.withOpacity(
                                                    0.5,
                                                  ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              if (property.images.length > 1) ...[
                                Positioned(
                                  left: 16,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _currentImageIndex =
                                              (_currentImageIndex -
                                                  1 +
                                                  property.images.length) %
                                              property.images.length;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 16,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _currentImageIndex =
                                              (_currentImageIndex + 1) %
                                              property.images.length;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {
                              // ref
                              //     .read(propertyProvider.notifier)
                              //     .toggleFavorite(property);
                            },
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                property.title,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                property.location,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _currencyFormat.format(property.price),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                property.description,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              // const SizedBox(height: 16),
                              // Row(
                              //   children: [
                              //     _PropertyFeature(
                              //       icon: Icons.bed,
                              //       label: '${property.bedrooms} Bedrooms',
                              //     ),
                              //     const SizedBox(width: 16),
                              //     _PropertyFeature(
                              //       icon: Icons.bathtub,
                              //       label: '${property.bathrooms} Bathrooms',
                              //     ),
                              //     const SizedBox(width: 16),
                              //     _PropertyFeature(
                              //       icon: Icons.area_chart,
                              //       label: '${property.area} sqft',
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(height: 16),
                              Text(
                                'Amenities',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children:
                                    property.amenities
                                        .map(
                                          (amenity) =>
                                              Chip(label: Text(amenity)),
                                        )
                                        .toList(),
                              ),
                              const SizedBox(height: 16),
                              FilledButton(
                                onPressed: () async {
                                  final url = Uri.parse(
                                    'https://www.google.com/maps/search/?api=1&query=${property.latitude},${property.longitude}',
                                  );
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: const Text('View on Map'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PropertyFeature extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PropertyFeature({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon), const SizedBox(width: 8), Text(label)]);
  }
}

class _FullScreenImageView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullScreenImageView({
    required this.images,
    required this.initialIndex,
  });

  @override
  State<_FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<_FullScreenImageView> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${currentIndex + 1} / ${widget.images.length}',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.images.length,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return PhotoView(
                imageProvider: NetworkImage(widget.images[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
          ),
          if (widget.images.length > 1) ...[
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
