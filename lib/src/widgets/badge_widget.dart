import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Widget de badge reutilizable con paddings optimizados y diferentes variantes
class BadgeWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final BadgeSize size;
  final BadgeVariant variant;
  final IconData? icon;
  final bool showDot;
  final EdgeInsets? margin;
  final VoidCallback? onTap;

  const BadgeWidget({
    super.key,
    required this.text,
    this.color,
    this.size = BadgeSize.medium,
    this.variant = BadgeVariant.filled,
    this.icon,
    this.showDot = false,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final badgeContent = Container(
      margin: margin,
      padding: _getPadding(),
      decoration: _getDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            _buildDot(),
            const SizedBox(width: 8),
          ],
          if (icon != null) ...[
            Icon(
              icon,
              color: _getIconColor(),
              size: _getIconSize(),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: _getTextStyle(),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: badgeContent,
      );
    }

    return badgeContent;
  }

  /// Calcula el padding óptimo basado en el tamaño del badge
  EdgeInsets _getPadding() {
    switch (size) {
      case BadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case BadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case BadgeSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case BadgeSize.extraLarge:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    }
  }

  /// Calcula el tamaño del badge
  Size _getBadgeSize() {
    switch (size) {
      case BadgeSize.small:
        return const Size(20, 20);
      case BadgeSize.medium:
        return const Size(24, 24);
      case BadgeSize.large:
        return const Size(28, 28);
      case BadgeSize.extraLarge:
        return const Size(32, 32);
    }
  }



  /// Calcula el tamaño del icono
  double _getIconSize() {
    switch (size) {
      case BadgeSize.small:
        return 12;
      case BadgeSize.medium:
        return 14;
      case BadgeSize.large:
        return 16;
      case BadgeSize.extraLarge:
        return 18;
    }
  }

  /// Construye la decoración del badge
  BoxDecoration _getDecoration() {
    final badgeColor = color ?? AppColors.orangeBrand;
    
    switch (variant) {
      case BadgeVariant.filled:
        return BoxDecoration(
          color: badgeColor,
          borderRadius: _getBorderRadius(),
        );
      case BadgeVariant.outlined:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: _getBorderRadius(),
          border: Border.all(
            color: badgeColor,
            width: 1.5,
          ),
        );
      case BadgeVariant.soft:
        return BoxDecoration(
          color: badgeColor.withValues(alpha: 0.1),
          borderRadius: _getBorderRadius(),
          border: Border.all(
            color: badgeColor.withValues(alpha: 0.3),
            width: 1,
          ),
        );
    }
  }

  /// Calcula el radio de los bordes
  BorderRadius _getBorderRadius() {
    final badgeSize = _getBadgeSize();
    final radius = badgeSize.height / 2;
    return BorderRadius.circular(radius);
  }

  /// Construye el dot indicador
  Widget _buildDot() {
    final dotSize = size == BadgeSize.small ? 6.0 : 8.0;
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: _getDotColor(),
        borderRadius: BorderRadius.circular(dotSize / 2),
      ),
    );
  }

  /// Obtiene el color del dot
  Color _getDotColor() {
    if (variant == BadgeVariant.outlined) {
      return color ?? AppColors.orangeBrand;
    }
    return AppColors.white;
  }

  /// Obtiene el color del icono
  Color _getIconColor() {
    switch (variant) {
      case BadgeVariant.filled:
        return AppColors.white;
      case BadgeVariant.outlined:
      case BadgeVariant.soft:
        return color ?? AppColors.orangeBrand;
    }
  }

  /// Obtiene el estilo del texto
  TextStyle _getTextStyle() {
    final textColor = variant == BadgeVariant.filled 
        ? AppColors.white 
        : (color ?? AppColors.orangeBrand);
    
    final fontSize = size == BadgeSize.small ? 10.0 : 
                    size == BadgeSize.medium ? 12.0 :
                    size == BadgeSize.large ? 14.0 : 16.0;

    return AppTypography.bodySmall?.copyWith(
      color: textColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.2,
    ) ?? TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.2,
    );
  }
}

/// Tamaños disponibles para los badges
enum BadgeSize {
  small,      // 20x20
  medium,     // 24x24
  large,      // 28x28
  extraLarge, // 32x32
}

/// Variantes de estilo para los badges
enum BadgeVariant {
  filled,   // Color sólido
  outlined, // Solo borde
  soft,     // Color suave con borde
}

/// Widget de badge con icono (alias para BadgeWidget con icon)
class BadgeWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final BadgeSize size;
  final BadgeVariant variant;
  final VoidCallback? onTap;

  const BadgeWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.color,
    this.size = BadgeSize.medium,
    this.variant = BadgeVariant.filled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BadgeWidget(
      text: text,
      icon: icon,
      color: color,
      size: size,
      variant: variant,
      onTap: onTap,
    );
  }
}

/// Widget de badge de notificación (pequeño y circular)
class NotificationBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onTap;

  const NotificationBadge({
    super.key,
    required this.text,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BadgeWidget(
      text: text,
      color: color ?? AppColors.digitalRed,
      size: BadgeSize.small,
      variant: BadgeVariant.filled,
      onTap: onTap,
    );
  }
}

/// Widget de badge específico para navegación móvil (más pequeño y optimizado)
class NavigationBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onTap;

  const NavigationBadge({
    super.key,
    required this.text,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      constraints: const BoxConstraints(
        minWidth: 14,
        minHeight: 14,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.digitalRed,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: -0.2,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

/// Widget de badge de estado
class StatusBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final BadgeSize size;
  final VoidCallback? onTap;

  const StatusBadge({
    super.key,
    required this.text,
    this.color,
    this.size = BadgeSize.medium,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BadgeWidget(
      text: text,
      color: color,
      size: size,
      variant: BadgeVariant.outlined,
      onTap: onTap,
    );
  }
}

/// Widget de badge de categoría
class CategoryBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final BadgeSize size;
  final VoidCallback? onTap;

  const CategoryBadge({
    super.key,
    required this.text,
    this.color,
    this.size = BadgeSize.medium,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BadgeWidget(
      text: text,
      color: color,
      size: size,
      variant: BadgeVariant.soft,
      onTap: onTap,
    );
  }
}
