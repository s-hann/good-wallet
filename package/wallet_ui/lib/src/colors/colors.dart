import 'package:flutter/material.dart';

/// Color palette
abstract class GWColors {
  /// primary color
  static const Color primary = Color(0xFF0095D7);

  /// primary color
  static const Color darkBlue = Color(0xFF003B7A);

  /// error/danger color
  static const Color danger = Color(0xFFCB3A31);

  /// warning color
  static const Color warning = Color(0xFFCD7B2E);

  /// info color
  static const Color info = Color(0xFF3267E3);

  /// success color
  static const Color success = Color(0xFF43936C);

  /// transparent
  static const Color transparent = Color(0x00000000);

  /// black
  static const Color white = Color(0xFFFFFFFF);

  /// black
  static const Color black = Color(0xFF252525);

  /// grayscale
  static const MaterialColor grayscale = MaterialColor(
    0xFFC1C5C8,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFECF1F5),
      300: Color(0xFFE6EAEE),
      400: Color(0xFFDBDFE3),
      500: Color(0xFFC1C5C8),
      600: Color(0xFFA3A6A8),
      700: Color(0xFF808284),
      800: Color(0xFF6F7072),
      900: Color(0xFF525454),
      1000: Color(0xFF252525),
    },
  );
}
