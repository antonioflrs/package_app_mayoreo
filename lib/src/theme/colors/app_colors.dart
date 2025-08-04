import 'package:flutter/material.dart';

/// Color scheme configuration for the app_mayoreo package
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary colors
  static const Color _primaryLight = Color(0xffe1a141);
  static const Color _primaryDark = Color(0xffffffff);
  
  // Secondary colors
  static const Color _secondaryLight = Color(0xFF424242);
  static const Color _secondaryDark = Color(0xFFBDBDBD);
  
  // Tertiary colors
  static const Color _tertiaryLight = Color(0xFF2E7D32);
  static const Color _tertiaryDark = Color(0xFF81C784);
  
  // Error colors
  static const Color _errorLight = Color(0xFFD32F2F);
  static const Color _errorDark = Color(0xFFEF5350);
  
  // Neutral colors
  static const Color _neutral0 = Color(0xFFFFFFFF);
  static const Color _neutral50 = Color(0xFFF0F0F0);
  static const Color _neutral200 = Color(0xFFC2C2C2);
  static const Color _neutral300 = Color(0xFFA3A3A3);
  static const Color _neutral600 = Color(0xFF474747);
  static const Color _neutral700 = Color(0xFF292929);
  static const Color _neutral800 = Color(0xFF141414);
  static const Color _neutral900 = Color(0xFF000000);

  // Surface colors
  static const Color _surfaceLight = _neutral0;
  static const Color _surfaceDark = _neutral900;
  static const Color _surfaceVariantLight = _neutral50;
  static const Color _surfaceVariantDark = _neutral800;

  /// Light color scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _primaryLight,
    onPrimary: _neutral0,
    primaryContainer: Color(0xFFBBDEFB),
    onPrimaryContainer: Color(0xFF0D47A1),
    secondary: _secondaryLight,
    onSecondary: _neutral0,
    secondaryContainer: Color(0xFFE0E0E0),
    onSecondaryContainer: Color(0xFF212121),
    tertiary: _tertiaryLight,
    onTertiary: _neutral0,
    tertiaryContainer: Color(0xFFC8E6C9),
    onTertiaryContainer: Color(0xFF1B5E20),
    error: _errorLight,
    onError: _neutral0,
    errorContainer: Color(0xFFFFCDD2),
    onErrorContainer: Color(0xFFB71C1C),
    surface: _surfaceLight,
    onSurface: _neutral900,
    surfaceContainerHighest: _surfaceVariantLight,
    onSurfaceVariant: _neutral700,
    outline: _neutral300,
    outlineVariant: _neutral200,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: _neutral900,
    onInverseSurface: _neutral0,
    inversePrimary: Color(0xFF90CAF9),
    surfaceTint: _primaryLight,
  );

  /// Dark color scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _primaryDark,
    onPrimary: _neutral900,
    primaryContainer: Color(0xFF1976D2),
    onPrimaryContainer: Color(0xFFE3F2FD),
    secondary: _secondaryDark,
    onSecondary: _neutral900,
    secondaryContainer: Color(0xFF424242),
    onSecondaryContainer: Color(0xFFE0E0E0),
    tertiary: _tertiaryDark,
    onTertiary: _neutral900,
    tertiaryContainer: Color(0xFF2E7D32),
    onTertiaryContainer: Color(0xFFC8E6C9),
    error: _errorDark,
    onError: _neutral900,
    errorContainer: Color(0xFFD32F2F),
    onErrorContainer: Color(0xFFFFCDD2),
    surface: _surfaceDark,
    onSurface: _neutral0,
    surfaceContainerHighest: _surfaceVariantDark,
    onSurfaceVariant: _neutral300,
    outline: _neutral600,
    outlineVariant: _neutral700,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: _neutral0,
    onInverseSurface: _neutral900,
    inversePrimary: Color(0xFF1976D2),
    surfaceTint: _primaryDark,
  );

  /// Semantic colors for business logic
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  
  /// Brand colors (customize according to your brand)
  static const Color brandPrimary = _primaryLight;
  static const Color brandSecondary = Color(0xFFFF6B35);
  static const Color brandAccent = Color(0xFF00BCD4);
} 