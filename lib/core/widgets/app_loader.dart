import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const AppLoader({
    super.key,
    this.size = 24.0, // Small default size
    this.strokeWidth = 3.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          // Uses primary color if none is provided
          valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
          strokeCap: StrokeCap.round, // Makes it look modern/minimal
        ),
      ),
    );
  }
}
