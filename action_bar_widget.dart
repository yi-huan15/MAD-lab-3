import 'package:flutter/material.dart';

/// ButtonSection: CALL / ROUTE / SHARE, evenly spaced.
class ActionBarWidget extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onRoute;
  final VoidCallback onShare;

  const ActionBarWidget({
    super.key,
    required this.onCall,
    required this.onRoute,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(icon: Icons.call, label: 'CALL', onTap: onCall),
          _ActionButton(icon: Icons.directions, label: 'ROUTE', onTap: onRoute),
          _ActionButton(icon: Icons.share, label: 'SHARE', onTap: onShare),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
