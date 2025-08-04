import 'package:flutter/material.dart';
import 'colors/app_colors.dart';
import 'typography/app_typography.dart';
import 'icons/app_icons.dart';

/// Main theme configuration for the app_mayoreo package
class AppTheme {
  static const String _fontFamily = 'Inter';

  /// Light theme configuration
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: _fontFamily,
      colorScheme: AppColors.lightColorScheme,
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

  /// Dark theme configuration
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: _fontFamily,
      colorScheme: AppColors.darkColorScheme,
      textTheme: AppTypography.textTheme,
      iconTheme: AppIcons.iconTheme,
      appBarTheme: _buildAppBarTheme(isDark: true),
      elevatedButtonTheme: _buildElevatedButtonTheme(isDark: true),
      outlinedButtonTheme: _buildOutlinedButtonTheme(isDark: true),
      textButtonTheme: _buildTextButtonTheme(isDark: true),
      inputDecorationTheme: _buildInputDecorationTheme(isDark: true),
      cardTheme: _buildCardTheme(isDark: true),
      dividerTheme: _buildDividerTheme(isDark: true),
    );
  }

  /// AppBar theme configuration
  static AppBarTheme _buildAppBarTheme({bool isDark = false}) {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: isDark 
          ? AppColors.darkColorScheme.surface 
          : AppColors.lightColorScheme.surface,
      foregroundColor: isDark 
          ? AppColors.darkColorScheme.onSurface 
          : AppColors.lightColorScheme.onSurface,
      titleTextStyle: AppTypography.headlineSmall?.copyWith(
        color: isDark 
            ? AppColors.darkColorScheme.onSurface 
            : AppColors.lightColorScheme.onSurface,
      ),
    );
  }

  /// ElevatedButton theme configuration
  static ElevatedButtonThemeData _buildElevatedButtonTheme({bool isDark = false}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: isDark 
            ? AppColors.darkColorScheme.primary 
            : AppColors.lightColorScheme.primary,
        foregroundColor: isDark 
            ? AppColors.darkColorScheme.onPrimary 
            : AppColors.lightColorScheme.onPrimary,
      ),
    );
  }

  /// OutlinedButton theme configuration
  static OutlinedButtonThemeData _buildOutlinedButtonTheme({bool isDark = false}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(
          color: isDark 
              ? AppColors.darkColorScheme.outline 
              : AppColors.lightColorScheme.outline,
        ),
        foregroundColor: isDark 
            ? AppColors.darkColorScheme.primary 
            : AppColors.lightColorScheme.primary,
      ),
    );
  }

  /// TextButton theme configuration
  static TextButtonThemeData _buildTextButtonTheme({bool isDark = false}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        foregroundColor: isDark 
            ? AppColors.darkColorScheme.primary 
            : AppColors.lightColorScheme.primary,
      ),
    );
  }

  /// InputDecoration theme configuration
  static InputDecorationTheme _buildInputDecorationTheme({bool isDark = false}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: isDark 
          ? AppColors.darkColorScheme.surfaceContainerHighest 
          : AppColors.lightColorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isDark 
              ? AppColors.darkColorScheme.outline 
              : AppColors.lightColorScheme.outline,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isDark 
              ? AppColors.darkColorScheme.outline 
              : AppColors.lightColorScheme.outline,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isDark 
              ? AppColors.darkColorScheme.primary 
              : AppColors.lightColorScheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isDark 
              ? AppColors.darkColorScheme.error 
              : AppColors.lightColorScheme.error,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  /// Card theme configuration
  static CardThemeData _buildCardTheme({bool isDark = false}) {
    return CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: isDark 
          ? AppColors.darkColorScheme.surface 
          : AppColors.lightColorScheme.surface,
    );
  }

  /// Divider theme configuration
  static DividerThemeData _buildDividerTheme({bool isDark = false}) {
    return DividerThemeData(
      color: isDark 
          ? AppColors.darkColorScheme.outline 
          : AppColors.lightColorScheme.outline,
      thickness: 1,
      space: 1,
    );
  }
} 