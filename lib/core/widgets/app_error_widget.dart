import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_button.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final String? title;
  final IconData? icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool isFullScreen;

  const AppErrorWidget({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.actionLabel,
    this.onAction,
    this.isFullScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? Icons.error_outline, size: 64, color: Colors.grey),

          const SizedBox(height: 16),

          Text(
            title ?? "Something went wrong",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textHeadline,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: AppColors.textBody),
          ),

          if (onAction != null && actionLabel != null) ...[
            const SizedBox(height: 24),
            SizedBox(
              width: 160,
              child: AppButton(
                label: actionLabel!,
                icon: Icons.refresh,
                onPressed: onAction!,
              ),
            ),
          ],
        ],
      ),
    );

    // Full screen OR inline usage
    return isFullScreen ? Center(child: content) : content;
  }
}
