import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class FocusFlowLogo extends StatelessWidget {
  final double fontSize;
  final double iconSize;
  final Color? color;

  const FocusFlowLogo({
    super.key,
    this.fontSize = 20,
    this.iconSize = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final brandColor = color ?? AppColors.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.blur_on, color: brandColor, size: iconSize),
        const SizedBox(width: 8),
        Text(
          'FocusFlow',
          style: GoogleFonts.outfit(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: brandColor,
          ),
        ),
      ],
    );
  }
}
