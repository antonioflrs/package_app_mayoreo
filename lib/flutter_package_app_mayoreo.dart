import 'package:flutter/material.dart';
import 'src/theme/app_theme.dart';
import 'src/theme/colors/app_colors.dart';
import 'src/theme/typography/app_typography.dart';
import 'src/theme/icons/app_icons.dart';

// Theme exports
export 'src/theme/theme.dart';

// Icons exports
// export 'src/icons/icons.dart'; // Removed - no icons.dart file exists

// Widget exports
export 'src/widgets/widgets.dart';

// Icon exports
export 'src/widgets/custom_svg_icon.dart';

// BLoC exports
export 'src/blocs/blocs.dart';

// Assets exports
export 'src/assets/assets.dart';

// Model exports
export 'src/models/models.dart';

// Data exports
export 'src/data/data.dart';

// Service exports
export 'src/services/services.dart';

/// Main class for the flutter_package_app_mayoreo package
class FlutterPackageAppMayoreo {
  // Private constructor to prevent instantiation
  FlutterPackageAppMayoreo._();

  /// Get the main theme
  static ThemeData get theme => AppTheme.theme;

  /// Legacy getters for backward compatibility
  static ThemeData get lightTheme => AppTheme.theme;
  static ThemeData get darkTheme => AppTheme.theme;

  /// Get the color scheme
  static ColorScheme get colorScheme => AppColors.colorScheme;

  /// Legacy getters for backward compatibility
  static ColorScheme get lightColorScheme => AppColors.colorScheme;
  static ColorScheme get darkColorScheme => AppColors.colorScheme;

  /// Get the text theme
  static TextTheme get textTheme => AppTypography.textTheme;

  /// Get the icon theme
  static IconThemeData get iconTheme => AppIcons.iconTheme;
}
