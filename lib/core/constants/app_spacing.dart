import 'package:flutter/material.dart';

class AppSpacing {
  // Private constructor to prevent instantiation
  AppSpacing._();

  // Core dimensions
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 32.0;
  static const double huge = 48.0;

  // Vertical Spacing (Height)
  static const vxs = SizedBox(height: xs);
  static const vsm = SizedBox(height: sm);
  static const vmd = SizedBox(height: md);
  static const vlg = SizedBox(height: lg);
  static const vxl = SizedBox(height: xl);
  static const vxxl = SizedBox(height: xxl);
  static const vhuge = SizedBox(height: huge);

  // Horizontal Spacing (Width)
  static const hxs = SizedBox(width: xs);
  static const hsm = SizedBox(width: sm);
  static const hmd = SizedBox(width: md);
  static const hlg = SizedBox(width: lg);
  static const hxl = SizedBox(width: xl);
  static const hxxl = SizedBox(width: xxl);

  // Standard Page Padding
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: xl);
}
