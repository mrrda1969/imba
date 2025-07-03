import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullscreenImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullscreenImageViewer({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: images.length,
            loadingBuilder:
                (context, event) =>
                    const Center(child: CircularProgressIndicator()),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(images[index]),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
                heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
              );
            },
            pageController: PageController(initialPage: initialIndex),
            onPageChanged: (index) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder:
                      (context) => FullscreenImageViewer(
                        images: images,
                        initialIndex: index,
                      ),
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
