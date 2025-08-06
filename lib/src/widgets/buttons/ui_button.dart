import 'package:flutter/material.dart';
import '../../theme/colors/app_colors.dart';
import '../../theme/typography/app_typography.dart';

/// Estandarized button widget for the design system
class UiButton extends StatelessWidget {
  const UiButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.type = UiButtonType.primary,
    this.size = UiButtonSize.medium,
    this.width,
    this.height,
    this.borderRadius,
    this.icon,
    this.iconPosition = UiButtonIconPosition.start,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final UiButtonType type;
  final UiButtonSize size;
  final double? width;
  final double? height;
  final double? borderRadius;
  final IconData? icon;
  final UiButtonIconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    final buttonSize = _getButtonSize();
    final radius = borderRadius ?? buttonSize.borderRadius;
    final isDisabled = onPressed == null || isLoading;

    Widget buttonWidget;
    
    switch (type) {
      case UiButtonType.primary:
        buttonWidget = ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: buttonSize.padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            backgroundColor: isDisabled 
                ? AppColors.softGray
                : AppColors.mysticGray,
            foregroundColor: isDisabled 
                ? AppColors.grayMedium
                : AppColors.white,
          ),
          child: _buildContent(),
        );
        break;
      case UiButtonType.secondary:
        buttonWidget = OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: buttonSize.padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            side: BorderSide(
              color: isDisabled 
                  ? AppColors.silverGrayMedium
                  : AppColors.orangeBrand,
            ),
            foregroundColor: isDisabled 
                ? AppColors.grayMedium
                : AppColors.orangeBrand,
          ),
          child: _buildContent(),
        );
        break;
      case UiButtonType.text:
        buttonWidget = TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: buttonSize.padding,
            foregroundColor: isDisabled 
                ? AppColors.grayMedium
                : AppColors.orangeBrand,
          ),
          child: _buildContent(),
        );
        break;
      case UiButtonType.destructive:
        buttonWidget = ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: buttonSize.padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            backgroundColor: isDisabled 
                ? AppColors.softGray
                : AppColors.digitalRed,
            foregroundColor: isDisabled 
                ? AppColors.grayMedium
                : AppColors.white,
          ),
          child: _buildContent(),
        );
        break;
    }

    return SizedBox(
      width: width,
      height: height ?? buttonSize.height,
      child: buttonWidget,
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getLoadingColor(),
          ),
        ),
      );
    }

    if (icon != null) {
      final iconWidget = Icon(icon, size: _getIconSize());
      final textWidget = Text(label, style: _getTextStyle());
      
      if (iconPosition == UiButtonIconPosition.start) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [iconWidget, const SizedBox(width: 8), textWidget],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [textWidget, const SizedBox(width: 8), iconWidget],
        );
      }
    }

    return Text(label, style: _getTextStyle());
  }

  Color _getLoadingColor() {
    switch (type) {
      case UiButtonType.primary:
      case UiButtonType.destructive:
        return AppColors.softGray;
      case UiButtonType.secondary:
      case UiButtonType.text:
        return AppColors.grayMedium;
    }
  }

  TextStyle _getTextStyle() {
    return AppTypography.getButtonTextStyle(size);
  }

  double _getIconSize() {
    switch (size) {
      case UiButtonSize.small:
        return 14;
      case UiButtonSize.medium:
        return 16;
      case UiButtonSize.large:
        return 18;
    }
  }

  UiButtonSizeData _getButtonSize() {
    switch (size) {
      case UiButtonSize.small:
        return const UiButtonSizeData(
          height: 28,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          borderRadius: 14,
        );
      case UiButtonSize.medium:
        return const UiButtonSizeData(
          height: 36,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: 18,
        );
      case UiButtonSize.large:
        return const UiButtonSizeData(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          borderRadius: 20,
        );
    }
  }
}

/// Button type options
enum UiButtonType { primary, secondary, text, destructive }

/// Button size options
enum UiButtonSize { small, medium, large }

/// Button icon position options
enum UiButtonIconPosition { start, end }

/// Button size data
class UiButtonSizeData {
  const UiButtonSizeData({
    required this.height,
    required this.padding,
    required this.borderRadius,
  });

  final double height;
  final EdgeInsets padding;
  final double borderRadius;
} 