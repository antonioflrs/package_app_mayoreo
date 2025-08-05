import 'package:flutter/material.dart';
import '../../theme/colors/app_colors.dart';

/// Base button widget for the app_mayoreo package
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.isDisabled = false,
    this.size = AppButtonSize.medium,
    this.variant = AppButtonVariant.primary,
    this.width,
    this.height,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final bool isDisabled;
  final AppButtonSize size;
  final AppButtonVariant variant;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final buttonStyle = _getButtonStyle(theme);
    final buttonSize = _getButtonSize();
    
    Widget buttonWidget;
    
    switch (variant) {
      case AppButtonVariant.primary:
        buttonWidget = ElevatedButton(
          onPressed: _getOnPressed(),
          style: buttonStyle,
          child: _buildChild(),
        );
        break;
      case AppButtonVariant.secondary:
        buttonWidget = OutlinedButton(
          onPressed: _getOnPressed(),
          style: buttonStyle,
          child: _buildChild(),
        );
        break;
      case AppButtonVariant.text:
        buttonWidget = TextButton(
          onPressed: _getOnPressed(),
          style: buttonStyle,
          child: _buildChild(),
        );
        break;
    }

    return SizedBox(
      width: width,
      height: height ?? buttonSize.height,
      child: buttonWidget,
    );
  }

  VoidCallback? _getOnPressed() {
    if (isDisabled || isLoading) return null;
    return onPressed;
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getLoadingColor(),
          ),
        ),
      );
    }
    return child;
  }

  Color _getLoadingColor() {
    switch (variant) {
      case AppButtonVariant.primary:
        return AppColors.white;
      case AppButtonVariant.secondary:
      case AppButtonVariant.text:
        return AppColors.grayMedium;
    }
  }

  ButtonStyle _getButtonStyle(ThemeData theme) {
    final buttonSize = _getButtonSize();
    
    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton.styleFrom(
          padding: buttonSize.padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: isDisabled 
              ? AppColors.softGray
              : AppColors.orangeBrand,
          foregroundColor: isDisabled 
              ? AppColors.grayMedium
              : AppColors.white,
        );
      case AppButtonVariant.secondary:
        return OutlinedButton.styleFrom(
          padding: buttonSize.padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: isDisabled 
                ? AppColors.silverGrayMedium
                : AppColors.orangeBrand,
          ),
          foregroundColor: isDisabled 
              ? AppColors.grayMedium
              : AppColors.orangeBrand,
        );
      case AppButtonVariant.text:
        return TextButton.styleFrom(
          padding: buttonSize.padding,
          foregroundColor: isDisabled 
              ? AppColors.grayMedium
              : AppColors.orangeBrand,
        );
    }
  }

  AppButtonSizeData _getButtonSize() {
    switch (size) {
      case AppButtonSize.small:
        return const AppButtonSizeData(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        );
      case AppButtonSize.medium:
        return const AppButtonSizeData(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      case AppButtonSize.large:
        return const AppButtonSizeData(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        );
    }
  }
}

/// Button size options
enum AppButtonSize { small, medium, large }

/// Button variant options
enum AppButtonVariant { primary, secondary, text }

/// Button size data
class AppButtonSizeData {
  const AppButtonSizeData({
    required this.height,
    required this.padding,
  });

  final double height;
  final EdgeInsets padding;
} 