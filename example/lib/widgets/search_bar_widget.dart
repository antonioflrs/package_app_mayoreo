import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SearchBarWidget extends StatelessWidget {
  // Funcionalidad básica
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool enabled;
  
  // Diseño básico
  final double? width;
  final double height;
  final double cornerRadius;
  final EdgeInsetsGeometry? margin;
  
  // Colores básicos
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;
  
  // Icono
  final String? iconPath;
  final Widget? customIcon;
  final bool showIcon;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Buscar en componentes',
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.width,
    this.height = 48,
    this.cornerRadius = 24,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.iconPath,
    this.customIcon,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    // Valores por defecto
    final bgColor = backgroundColor ?? AppColors.backCards;
    final borderColor = this.borderColor ?? AppColors.silverGrayMedium;
    final textColor = this.textColor ?? AppColors.black;
    final hintColor = this.hintColor ?? AppColors.darkGray;
    final iconColor = this.iconColor ?? AppColors.grayMedium;
    final margin = this.margin ?? const EdgeInsets.symmetric(horizontal: 16);

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          suffixIcon: _buildIcon(iconColor),
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 8,
            top: 12,
            bottom: 12,
          ),
        ),
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget? _buildIcon(Color iconColor) {
    if (!showIcon) return null;
    
    if (customIcon != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: customIcon,
      );
    }

    if (iconPath != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Builder(
          builder: (context) => FutureBuilder<String>(
            future: DefaultAssetBundle.of(context).loadString(iconPath!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeSvgIcon(
                  iconPath: iconPath!,
                  width: 20,
                  height: 20,
                  color: iconColor,
                );
              } else {
                return _buildDefaultSearchIcon(iconColor);
              }
            },
          ),
        ),
      );
    }

    return _buildDefaultSearchIcon(iconColor);
  }

  Widget _buildDefaultSearchIcon(Color iconColor) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Icon(
        Icons.search,
        size: 20,
        color: iconColor,
      ),
    );
  }
} 