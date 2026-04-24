import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const HeaderChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onActionPressed;

  const SectionHeader({super.key, required this.title, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        if (onActionPressed != null)
          TextButton(
            onPressed: onActionPressed,
            child: const Text(
              'View All',
              style: TextStyle(color: Color(0xFF5D5FEF)),
            ),
          ),
      ],
    );
  }
}
