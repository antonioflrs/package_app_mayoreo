import 'package:flutter/material.dart';
import 'src/theme/app_theme.dart';
import 'src/theme/colors/app_colors.dart';
import 'src/theme/typography/app_typography.dart';
import 'src/theme/icons/app_icons.dart';

// Theme exports
export 'src/theme/theme.dart';

// Widget exports
export 'src/widgets/widgets.dart';

// BLoC exports
export 'src/blocs/blocs.dart';

/// Main class for the flutter_package_app_mayoreo package
class FlutterPackageAppMayoreo {
  // Private constructor to prevent instantiation
  FlutterPackageAppMayoreo._();

  /// Get the light theme
  static ThemeData get lightTheme => AppTheme.light;

  /// Get the dark theme
  static ThemeData get darkTheme => AppTheme.dark;

  /// Get the light color scheme
  static ColorScheme get lightColorScheme => AppColors.lightColorScheme;

  /// Get the dark color scheme
  static ColorScheme get darkColorScheme => AppColors.darkColorScheme;

  /// Get the text theme
  static TextTheme get textTheme => AppTypography.textTheme;

  /// Get the icon theme
  static IconThemeData get iconTheme => AppIcons.iconTheme;
}
