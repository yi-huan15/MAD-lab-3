import 'package:flutter/material.dart';

/// TextSection: padded container with a descriptive paragraph.
class DescriptionWidget extends StatelessWidget {
  final String text;

  const DescriptionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(text, softWrap: true, style: const TextStyle(height: 1.4)),
    );
  }
}
