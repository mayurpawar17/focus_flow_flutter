import 'package:flutter/material.dart';

class AppRefresh extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  // Your custom color
  static const Color primary = Color(0xFF5D5FEF);

  const AppRefresh({super.key, required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: Colors.white,
      // Color of the spinning arrow
      backgroundColor: primary,
      // Your custom brand color
      strokeWidth: 1.8,
      // Thinner line for a minimal look
      displacement: 10,
      // Distance from the top
      edgeOffset: 0,
      child: child,
    );
  }
}
