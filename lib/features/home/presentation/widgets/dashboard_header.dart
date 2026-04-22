import 'package:flutter/material.dart';
import 'package:focus_flow_flutter/core/constants/app_spacing.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/date_helper.dart';
import 'header_chip.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.vmd,
        Text(
          'WORKSPACE',
          style: GoogleFonts.outfit(
            letterSpacing: 2,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF5D5FEF),
          ),
        ),
        AppSpacing.vxs,
        Text(
          'Today',
          style: GoogleFonts.outfit(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        AppSpacing.vlg,

        Row(
          children: [
            HeaderChip(
              icon: Icons.calendar_today,
              label: DateHelper.getCurrentFormatted(),
            ),
            // AppSpacing.hmd,
            // const HeaderChip(icon: Icons.timer_outlined, label: '4h 12m spent'),
          ],
        ),
      ],
    );
  }
}
