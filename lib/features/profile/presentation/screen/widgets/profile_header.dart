import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_theme_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).extension<AppThemeColors>()?.textPrimary,
          ),
        ),
        Text(
          email,
          style: const TextStyle(color: AppColors.textBody, fontSize: 16),
        ),
      ],
    );
  }
}
