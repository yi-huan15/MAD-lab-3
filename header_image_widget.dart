import 'package:flutter/material.dart';

/// ImageSection: hero banner with a caption label.
class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final double height;

  const HeaderImageWidget({
    super.key,
    required this.imageUrl,
    required this.caption,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : const Center(child: CircularProgressIndicator()),
            // Fallback if offline / URL fails (or swap for Image.asset)
            errorBuilder: (context, error, stack) => Container(
              color: Colors.indigo.shade200,
              child: const Icon(Icons.directions_boat,
                  size: 72, color: Colors.white),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              color: Colors.black54,
              child: Text(
                caption,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
