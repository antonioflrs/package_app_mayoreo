import 'package:flutter/material.dart';
import 'colors/app_colors.dart';
import 'typography/app_typography.dart';
import 'icons/app_icons.dart';

/// Main theme configuration for the app_mayoreo package
class AppTheme {
  static const String _fontFamily = 'Inter';

  /// Main theme configuration (single theme)
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: _fontFamily,
      colorScheme: AppColors.colorScheme,
      textTheme: AppTypography.textTheme,
      iconTheme: AppIcons.iconTheme,
      appBarTheme: _buildAppBarTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      outlinedButtonTheme: _buildOutlinedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      cardTheme: _buildCardTheme(),
      dividerTheme: _buildDividerTheme(),
    );
  }

  /// Legacy getters for backward compatibility
  static ThemeData get light => theme;
  static ThemeData get dark => theme;

  /// AppBar theme configuration
  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.colorScheme.surface,
      foregroundColor: AppColors.colorScheme.onSurface,
      titleTextStyle: AppTypography.headlineSmall?.copyWith(
        color: AppColors.colorScheme.onSurface,
      ),
    );
  }

  /// ElevatedButton theme configuration
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.colorScheme.primary,
        foregroundColor: AppColors.colorScheme.onPrimary,
      ),
    );
  }

  /// OutlinedButton theme configuration
  static OutlinedButtonThemeData _buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: AppColors.colorScheme.outline,
        ),
        foregroundColor: AppColors.colorScheme.primary,
      ),
    );
  }

  /// TextButton theme configuration
  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        foregroundColor: AppColors.colorScheme.primary,
      ),
    );
  }

  /// InputDecoration theme configuration
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.colorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.colorScheme.outline,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.colorScheme.outline,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.colorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.colorScheme.error,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  /// Card theme configuration
  static CardThemeData _buildCardTheme() {
    return CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.colorScheme.surface,
    );
  }

  /// Divider theme configuration
  static DividerThemeData _buildDividerTheme() {
    return DividerThemeData(
      color: AppColors.colorScheme.outline,
      thickness: 1,
      space: 1,
    );
  }
} 