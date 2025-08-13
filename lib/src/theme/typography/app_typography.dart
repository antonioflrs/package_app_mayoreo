import 'package:flutter/material.dart';
import '../fonts/app_fonts.dart';

/// Typography configuration for the app_mayoreo package
/// Configuración exclusiva con InterVariable + ss01 + cv11 por defecto
class AppTypography {
  // Private constructor to prevent instantiation
  AppTypography._();

  /// Main text theme with InterVariable + ss01 + cv11 applied by default
  /// Configuración usando AppFonts.get() que aplica OpenType automáticamente
  static TextTheme get textTheme => TextTheme(
    // Display styles
    displayLarge: AppFonts.get(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: AppFonts.get(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: AppFonts.get(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    ),
    
    // Headline styles
    headlineLarge: AppFonts.get(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.25,
    ),
    headlineMedium: AppFonts.get(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.29,
    ),
    headlineSmall: AppFonts.get(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.33,
    ),
    
    // Title styles
    titleLarge: AppFonts.get(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: AppFonts.get(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    titleSmall: AppFonts.get(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    
    // Body styles
    bodyLarge: AppFonts.get(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: AppFonts.get(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: AppFonts.get(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    ),
    
    // Label styles
    labelLarge: AppFonts.get(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: AppFonts.get(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: AppFonts.get(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );

  /// Legacy getters for backward compatibility
  static TextStyle? get displayLarge => textTheme.displayLarge;
  static TextStyle? get displayMedium => textTheme.displayMedium;
  static TextStyle? get displaySmall => textTheme.displaySmall;
  static TextStyle? get headlineLarge => textTheme.headlineLarge;
  static TextStyle? get headlineMedium => textTheme.headlineMedium;
  static TextStyle? get headlineSmall => textTheme.headlineSmall;
  static TextStyle? get titleLarge => textTheme.titleLarge;
  static TextStyle? get titleMedium => textTheme.titleMedium;
  static TextStyle? get titleSmall => textTheme.titleSmall;
  static TextStyle? get bodyLarge => textTheme.bodyLarge;
  static TextStyle? get bodyMedium => textTheme.bodyMedium;
  static TextStyle? get bodySmall => textTheme.bodySmall;
  static TextStyle? get labelLarge => textTheme.labelLarge;
  static TextStyle? get labelMedium => textTheme.labelMedium;
  static TextStyle? get labelSmall => textTheme.labelSmall;
} 