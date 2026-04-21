import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'header_chip.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'WORKSPACE',
          style: GoogleFonts.outfit(
            letterSpacing: 2,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF5D5FEF),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Today',
          style: GoogleFonts.outfit(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            HeaderChip(icon: Icons.calendar_today, label: 'October 24'),
            SizedBox(width: 12),
            HeaderChip(icon: Icons.timer_outlined, label: '4h 12m spent'),
          ],
        ),
      ],
    );
  }
}
