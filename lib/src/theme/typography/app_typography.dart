import 'package:flutter/material.dart';
import '../fonts/app_fonts.dart';

/// Typography configuration for the app_mayoreo package
class AppTypography {
  // Private constructor to prevent instantiation
  AppTypography._();

  // Font weights constants (using AppFonts for consistency)
  static const FontWeight _fontWeightRegular = AppFonts.regular;
  static const FontWeight _fontWeightMedium = AppFonts.medium;
  static const FontWeight _fontWeightSemiBold = AppFonts.semiBold;
  static const FontWeight _fontWeightBold = AppFonts.bold;

  // Font family constants (using AppFonts for consistency)
  static const String _fontFamily = AppFonts.inter;
  static const String _fontFamilyMono = AppFonts.robotoMono;

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

  /// Button text styles
  static const TextStyle buttonTextSmall = TextStyle(
    fontSize: 11,
    fontWeight: _fontWeightMedium,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle buttonTextMedium = TextStyle(
    fontSize: 12,
    fontWeight: _fontWeightSemiBold,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle buttonTextLarge = TextStyle(
    fontSize: 14,
    fontWeight: _fontWeightSemiBold,
    letterSpacing: 0.1,
    height: 1.43,
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

  /// Monospace text styles for code, numbers, etc.
  static const TextStyle code = TextStyle(
    fontFamily: _fontFamilyMono,
    fontSize: 14,
    fontWeight: _fontWeightRegular,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle codeSmall = TextStyle(
    fontFamily: _fontFamilyMono,
    fontSize: 12,
    fontWeight: _fontWeightRegular,
    letterSpacing: 0.25,
    height: 1.33,
  );

  /// Specialized text styles
  static const TextStyle price = TextStyle(
    fontSize: 18,
    fontWeight: _fontWeightSemiBold,
    letterSpacing: 0.1,
    height: 1.33,
  );

  static const TextStyle priceLarge = TextStyle(
    fontSize: 24,
    fontWeight: _fontWeightBold,
    letterSpacing: 0.1,
    height: 1.25,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 10,
    fontWeight: _fontWeightMedium,
    letterSpacing: 0.5,
    height: 1.4,
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

  /// Helper methods for button text styles
  static TextStyle getButtonTextStyle(dynamic size) {
    // Handle both enum values and string values for flexibility
    if (size.toString().contains('small')) {
      return buttonTextSmall;
    } else if (size.toString().contains('medium')) {
      return buttonTextMedium;
    } else if (size.toString().contains('large')) {
      return buttonTextLarge;
    }
    return buttonTextMedium; // default
  }

  /// Helper method to create custom text style with specific properties
  static TextStyle custom({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    String? fontFamily,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? _fontWeightRegular,
      letterSpacing: letterSpacing,
      height: height,
      fontFamily: fontFamily ?? _fontFamily,
      color: color,
      decoration: decoration,
    );
  }

  /// Helper method to create text style with specific weight
  static TextStyle withWeight(TextStyle baseStyle, FontWeight weight) {
    return baseStyle.copyWith(fontWeight: weight);
  }

  /// Helper method to create text style with specific color
  static TextStyle withColor(TextStyle baseStyle, Color color) {
    return baseStyle.copyWith(color: color);
  }

  /// Helper method to create text style with specific size
  static TextStyle withSize(TextStyle baseStyle, double size) {
    return baseStyle.copyWith(fontSize: size);
  }
} 