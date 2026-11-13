import 'package:flutter/material.dart';

/// TitleSection: name, location and an interactive star rating counter.
class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;
  final bool isStarred;
  final VoidCallback onStarTap;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
    required this.isStarred,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(location,
                    style: TextStyle(color: colors.onSurfaceVariant)),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onStarTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(isStarred ? Icons.star : Icons.star_border,
                      color: Colors.amber.shade700, size: 20),
                  const SizedBox(width: 4),
                  Text('$starCount',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
