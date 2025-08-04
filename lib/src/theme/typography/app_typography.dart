import 'package:flutter/material.dart';

/// Typography configuration for the app_mayoreo package
class AppTypography {
  // Private constructor to prevent instantiation
  AppTypography._();

  static const FontWeight _fontWeightRegular = FontWeight.w400;
  static const FontWeight _fontWeightMedium = FontWeight.w500;

  /// Main text theme
  static const TextTheme textTheme = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: _fontWeightRegular,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0,
      height: 1.22,
    ),

    // Headline styles
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0,
      height: 1.33,
    ),

    // Title styles
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: _fontWeightMedium,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: _fontWeightMedium,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: _fontWeightMedium,
      letterSpacing: 0.1,
      height: 1.43,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: _fontWeightMedium,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: _fontWeightMedium,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: _fontWeightMedium,
      letterSpacing: 0.5,
      height: 1.45,
    ),

    // Body styles
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: _fontWeightRegular,
      letterSpacing: 0.4,
      height: 1.33,
    ),
  );

  /// Custom text styles for specific use cases
  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: _fontWeightMedium,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: _fontWeightRegular,
    letterSpacing: 0.4,
    height: 1.33,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: _fontWeightMedium,
    letterSpacing: 1.5,
    height: 1.6,
  );

  /// Helper methods for common text styles
  static TextStyle? get displayLarge => textTheme.displayLarge;
  static TextStyle? get displayMedium => textTheme.displayMedium;
  static TextStyle? get displaySmall => textTheme.displaySmall;
  static TextStyle? get headlineLarge => textTheme.headlineLarge;
  static TextStyle? get headlineMedium => textTheme.headlineMedium;
  static TextStyle? get headlineSmall => textTheme.headlineSmall;
  static TextStyle? get titleLarge => textTheme.titleLarge;
  static TextStyle? get titleMedium => textTheme.titleMedium;
  static TextStyle? get titleSmall => textTheme.titleSmall;
  static TextStyle? get labelLarge => textTheme.labelLarge;
  static TextStyle? get labelMedium => textTheme.labelMedium;
  static TextStyle? get labelSmall => textTheme.labelSmall;
  static TextStyle? get bodyLarge => textTheme.bodyLarge;
  static TextStyle? get bodyMedium => textTheme.bodyMedium;
  static TextStyle? get bodySmall => textTheme.bodySmall;
} 