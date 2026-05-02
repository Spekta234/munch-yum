import 'package:flutter/material.dart';

class MColors {
  MColors._();

  // App Basic Colors
  static const Color primary = Color(0xFFE80C30);
  static const Color secondary = Color(0xFFfef4f5);
  static const Color accent = Color(0xFFb0c7ff);

  // Gradient Color
  static const Gradient lightGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xffff9a9e), Color(0xfffad0c4), Color(0xfffad0c4)],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFFe90a2f);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color categoryBackground = Color(0xFFfff2ea);
  static const Color categoryBackground2 = Color(0xFFf2fefc);
  static const Color categoryBackground3 = Color(0xFFffebea);
  static const Color categoryBackground4 = Color(0xFFe9f2f1);
  static const Color categoryBackground5 = Color(0xFFffe1c9);

  // Background Containers Button
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFFE80C30);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDisable = Color(0xFFC4C4C4);

  // Border Color
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
