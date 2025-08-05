import 'package:flutter/material.dart';

/// Font configuration for the app_mayoreo package
class AppFonts {
  // Private constructor to prevent instantiation
  AppFonts._();

  // Font families
  static const String inter = 'Inter';
  static const String robotoMono = 'RobotoMono';

  // Font weights for Inter
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  /// Get font family with fallback
  static String getFontFamily(String? fontFamily) {
    return fontFamily ?? inter;
  }

  /// Get font weight with fallback
  static FontWeight getFontWeight(FontWeight? fontWeight) {
    return fontWeight ?? regular;
  }

  /// Create TextStyle with Inter font family
  static TextStyle interStyle({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: inter,
      fontSize: fontSize,
      fontWeight: getFontWeight(fontWeight),
      letterSpacing: letterSpacing,
      height: height,
      color: color,
      decoration: decoration,
    );
  }

  /// Create TextStyle with RobotoMono font family
  static TextStyle monoStyle({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: robotoMono,
      fontSize: fontSize,
      fontWeight: getFontWeight(fontWeight),
      letterSpacing: letterSpacing,
      height: height,
      color: color,
      decoration: decoration,
    );
  }

  /// Predefined Inter styles for common use cases
  static TextStyle get interLight => interStyle(fontWeight: light);
  static TextStyle get interRegular => interStyle(fontWeight: regular);
  static TextStyle get interMedium => interStyle(fontWeight: medium);
  static TextStyle get interSemiBold => interStyle(fontWeight: semiBold);
  static TextStyle get interBold => interStyle(fontWeight: bold);

  /// Predefined RobotoMono styles
  static TextStyle get monoRegular => monoStyle(fontWeight: regular);
  static TextStyle get monoMedium => monoStyle(fontWeight: medium);
  static TextStyle get monoBold => monoStyle(fontWeight: bold);
} 