import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Colores personalizables para el FavoriteIcon
class FavoriteIconColors {
  final Color activeColor;
  final Color inactiveColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const FavoriteIconColors({
    this.activeColor = AppColors.orangeBrand,
    this.inactiveColor = AppColors.grayMedium,
    this.backgroundColor,
    this.borderColor,
  });

  /// Tema oscuro predefinido
  factory FavoriteIconColors.darkTheme() {
    return const FavoriteIconColors(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      backgroundColor: Color(0xFF2C2C2C),
      borderColor: Colors.grey,
    );
  }

  /// Tema de marca predefinido
  factory FavoriteIconColors.brandTheme() {
    return const FavoriteIconColors(
      activeColor: Colors.green,
      inactiveColor: Colors.grey,
      backgroundColor: Colors.white,
      borderColor: Colors.green,
    );
  }

  /// Tema premium predefinido
  factory FavoriteIconColors.premiumTheme() {
    return FavoriteIconColors(
      activeColor: Colors.purple,
      inactiveColor: Colors.grey[400]!,
      backgroundColor: Colors.white,
      borderColor: Colors.purple,
    );
  }
}

/// Widget simplificado de icono de favorito
class FavoriteIcon extends StatefulWidget {
  final bool isFavorite;
  final FavoriteIconColors? colors;
  final double? size;
  final double? iconSize;
  final double? padding;
  final double? margin;
  final VoidCallback? onPressed;
  final bool enableTap;
  final bool showBackground;
  final bool showBorder;
  final double? borderRadius;
  final double? borderWidth;
  final IconData? activeIcon;
  final IconData? inactiveIcon;

  const FavoriteIcon({
    super.key,
    this.isFavorite = false,
    this.colors,
    this.size,
    this.iconSize,
    this.padding,
    this.margin,
    this.onPressed,
    this.enableTap = true,
    this.showBackground = false,
    this.showBorder = false,
    this.borderRadius,
    this.borderWidth,
    this.activeIcon,
    this.inactiveIcon,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(FavoriteIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      _isFavorite = widget.isFavorite;
    }
  }

  void _toggleFavorite() {
    if (!widget.enableTap) return;

    setState(() {
      _isFavorite = !_isFavorite;
    });

    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveColors = widget.colors ?? const FavoriteIconColors();
    final effectiveSize = widget.size ?? 48.0;
    final effectiveIconSize = widget.iconSize ?? 24.0;
    final effectivePadding = widget.padding ?? 12.0;
    final effectiveMargin = widget.margin ?? 0.0;
    final effectiveBorderRadius = widget.borderRadius ?? 8.0;
    final effectiveBorderWidth = widget.borderWidth ?? 1.0;
    final effectiveActiveIcon = widget.activeIcon ?? Icons.favorite;
    final effectiveInactiveIcon = widget.inactiveIcon ?? Icons.favorite_border;

    Widget iconWidget = Icon(
      _isFavorite ? effectiveActiveIcon : effectiveInactiveIcon,
      color: _isFavorite
          ? effectiveColors.activeColor
          : effectiveColors.inactiveColor,
      size: effectiveIconSize,
    );

    // Agregar fondo si está habilitado
    if (widget.showBackground) {
      iconWidget = Container(
        padding: EdgeInsets.all(effectivePadding),
        decoration: BoxDecoration(
          color: effectiveColors.backgroundColor,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          border: widget.showBorder
              ? Border.all(
                  color:
                      effectiveColors.borderColor ??
                      effectiveColors.activeColor,
                  width: effectiveBorderWidth,
                )
              : null,
        ),
        child: iconWidget,
      );
    }

    // Agregar margen si está especificado
    if (effectiveMargin > 0) {
      iconWidget = Container(
        margin: EdgeInsets.all(effectiveMargin),
        child: iconWidget,
      );
    }

    // Envolver en GestureDetector si está habilitado el tap
    if (widget.enableTap) {
      iconWidget = GestureDetector(onTap: _toggleFavorite, child: iconWidget);
    }

    return SizedBox(
      width: effectiveSize,
      height: effectiveSize,
      child: iconWidget,
    );
  }
}

/// Widget predefinido con tema oscuro
class FavoriteIconDark extends StatelessWidget {
  final bool isFavorite;
  final double? size;
  final double? iconSize;
  final VoidCallback? onPressed;
  final bool enableTap;
  final bool showBackground;
  final bool showBorder;

  const FavoriteIconDark({
    super.key,
    this.isFavorite = false,
    this.size,
    this.iconSize,
    this.onPressed,
    this.enableTap = true,
    this.showBackground = false,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return FavoriteIcon(
      isFavorite: isFavorite,
      colors: FavoriteIconColors.darkTheme(),
      size: size,
      iconSize: iconSize,
      onPressed: onPressed,
      enableTap: enableTap,
      showBackground: showBackground,
      showBorder: showBorder,
    );
  }
}

/// Widget predefinido con tema de marca
class FavoriteIconBrand extends StatelessWidget {
  final bool isFavorite;
  final double? size;
  final double? iconSize;
  final VoidCallback? onPressed;
  final bool enableTap;
  final bool showBackground;
  final bool showBorder;

  const FavoriteIconBrand({
    super.key,
    this.isFavorite = false,
    this.size,
    this.iconSize,
    this.onPressed,
    this.enableTap = true,
    this.showBackground = false,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return FavoriteIcon(
      isFavorite: isFavorite,
      colors: FavoriteIconColors.brandTheme(),
      size: size,
      iconSize: iconSize,
      onPressed: onPressed,
      enableTap: enableTap,
      showBackground: showBackground,
      showBorder: showBorder,
    );
  }
}

/// Widget predefinido con tema premium
class FavoriteIconPremium extends StatelessWidget {
  final bool isFavorite;
  final double? size;
  final double? iconSize;
  final VoidCallback? onPressed;
  final bool enableTap;
  final bool showBackground;
  final bool showBorder;

  const FavoriteIconPremium({
    super.key,
    this.isFavorite = false,
    this.size,
    this.iconSize,
    this.onPressed,
    this.enableTap = true,
    this.showBackground = false,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return FavoriteIcon(
      isFavorite: isFavorite,
      colors: FavoriteIconColors.premiumTheme(),
      size: size,
      iconSize: iconSize,
      onPressed: onPressed,
      enableTap: enableTap,
      showBackground: showBackground,
      showBorder: showBorder,
    );
  }
}
