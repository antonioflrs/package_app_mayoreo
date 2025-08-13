import 'package:flutter/material.dart';

/// Font configuration for the app_mayoreo package
/// Configuración exclusiva de InterVariable con características OpenType ss01 + cv11
class AppFonts {
  // Private constructor to prevent instantiation
  AppFonts._();

  // Font family name
  static const String interVariable = 'InterVariable';

  /// Get InterVariable font with OpenType features (ss01 + cv11) by default
  /// Obtiene la fuente InterVariable con características OpenType por defecto
  static TextStyle get({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    List<FontFeature>? fontFeatures,
  }) {
    return TextStyle(
      fontFamily: interVariable,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontFeatures: fontFeatures ?? [
        FontFeature.stylisticSet(1), // ss01 - Stylistic Set 01
        FontFeature('cv11'),          // cv11 - Character Variant 11
      ],
    );
  }

  /// Get InterVariable font without OpenType features (for specific cases)
  /// Obtiene la fuente InterVariable sin características OpenType
  static TextStyle getBasic({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: interVariable,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  /// Get InterVariable font with custom OpenType features
  /// Obtiene la fuente InterVariable con características OpenType personalizadas
  static TextStyle getWithFeatures({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    required List<FontFeature> fontFeatures,
  }) {
    return TextStyle(
      fontFamily: interVariable,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontFeatures: fontFeatures,
    );
  }
} 