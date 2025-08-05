import 'package:flutter/material.dart';

/// Icon theme configuration for the app_mayoreo package
class AppIcons {
  // Private constructor to prevent instantiation
  AppIcons._();

  /// Default icon theme
  static const IconThemeData iconTheme = IconThemeData(
    size: 24.0,
    color: null, // Will use theme's onSurface color
  );

  /// Small icon theme
  static const IconThemeData iconThemeSmall = IconThemeData(
    size: 16.0,
    color: null,
  );

  /// Large icon theme
  static const IconThemeData iconThemeLarge = IconThemeData(
    size: 32.0,
    color: null,
  );

  /// Extra large icon theme
  static const IconThemeData iconThemeExtraLarge = IconThemeData(
    size: 48.0,
    color: null,
  );
} 