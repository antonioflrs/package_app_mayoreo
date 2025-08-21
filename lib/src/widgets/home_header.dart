import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Widget de header personalizable para la pantalla de inicio
class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  /// Título/logo del header (opcional)
  final String? title;
  
  /// Widget personalizado para el logo (opcional)
  final Widget? logoWidget;
  
  /// Icono para el botón del menú (hamburguesa)
  final IconData? menuIcon;
  
  /// Icono para el botón del carrito
  final IconData? cartIcon;
  
  /// Color de fondo del header
  final Color? backgroundColor;
  
  /// Color de los iconos
  final Color? iconColor;
  
  /// Color del texto del título
  final Color? titleColor;
  
  /// Padding vertical del header
  final double verticalPadding;
  
  /// Altura del header
  final double height;
  
  /// Tamaño de los iconos
  final double iconSize;
  
  /// Callback cuando se presiona el botón del menú
  final VoidCallback? onMenuPressed;
  
  /// Callback cuando se presiona el botón del carrito
  final VoidCallback? onCartPressed;
  
  /// Callback cuando se presiona el logo/título
  final VoidCallback? onLogoPressed;
  
  /// Elevación del header (sombra)
  final double elevation;
  
  /// Bordes redondeados del header
  final BorderRadius? borderRadius;
  
  /// Estilo del texto del título
  final TextStyle? titleStyle;

  const HomeHeader({
    super.key,
    this.title,
    this.logoWidget,
    this.menuIcon,
    this.cartIcon,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
    this.verticalPadding = 5.0,
    this.height = kToolbarHeight + 16.0,
    this.iconSize = 24.0,
    this.onMenuPressed,
    this.onCartPressed,
    this.onLogoPressed,
    this.elevation = 0.0,
    this.borderRadius,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _getColors(context);
    
    return SafeArea(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: borderRadius,
          boxShadow: elevation > 0 ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: elevation,
              offset: Offset(0, elevation / 2),
            ),
          ] : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botón del menú (hamburguesa)
              GestureDetector(
                onTap: onMenuPressed ?? () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    menuIcon ?? Icons.menu,
                    size: iconSize,
                    color: colors.iconColor,
                  ),
                ),
              ),
              
              // Logo o título (centro)
              GestureDetector(
                onTap: onLogoPressed,
                child: logoWidget ?? _buildTitle(colors),
              ),
              
              // Botón del carrito
              GestureDetector(
                onTap: onCartPressed ?? () {
                  // TODO: Implementar acción para abrir el carrito
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Carrito en desarrollo')),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    cartIcon ?? Icons.shopping_cart,
                    size: iconSize,
                    color: colors.iconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(_HomeHeaderColors colors) {
    if (title == null) return const SizedBox.shrink();
    
    return Text(
      title!,
      style: titleStyle?.copyWith(
        color: colors.titleColor,
      ) ?? TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: colors.titleColor,
        fontFamily: 'InterVariable',
      ),
    );
  }

  _HomeHeaderColors _getColors(BuildContext context) {
    return _HomeHeaderColors(
      backgroundColor: backgroundColor ?? AppColors.white,
      iconColor: iconColor ?? AppColors.black,
      titleColor: titleColor ?? AppColors.black,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

/// Clase para personalizar colores del HomeHeader
class _HomeHeaderColors {
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;

  const _HomeHeaderColors({
    required this.backgroundColor,
    required this.iconColor,
    required this.titleColor,
  });
}

/// Widget de header con tema oscuro predefinido
class HomeHeaderDark extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? logoWidget;
  final IconData? menuIcon;
  final IconData? cartIcon;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onCartPressed;
  final VoidCallback? onLogoPressed;
  final double height;

  const HomeHeaderDark({
    super.key,
    this.title,
    this.logoWidget,
    this.menuIcon,
    this.cartIcon,
    this.onMenuPressed,
    this.onCartPressed,
    this.onLogoPressed,
    this.height = kToolbarHeight + 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return HomeHeader(
      title: title,
      logoWidget: logoWidget,
      menuIcon: menuIcon ?? Icons.menu,
      cartIcon: cartIcon ?? Icons.shopping_cart,
      backgroundColor: const Color(0xFF1E1E1E),
      iconColor: Colors.white,
      titleColor: Colors.white,
      elevation: 2.0,
      onMenuPressed: onMenuPressed,
      onCartPressed: onCartPressed,
      onLogoPressed: onLogoPressed,
      height: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

/// Widget de header con tema de marca personalizable
class HomeHeaderBrand extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? logoWidget;
  final IconData? menuIcon;
  final IconData? cartIcon;
  final Color primaryColor;
  final Color secondaryColor;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onCartPressed;
  final VoidCallback? onLogoPressed;
  final double height;

  const HomeHeaderBrand({
    super.key,
    this.title,
    this.logoWidget,
    this.menuIcon,
    this.cartIcon,
    required this.primaryColor,
    required this.secondaryColor,
    this.onMenuPressed,
    this.onCartPressed,
    this.onLogoPressed,
    this.height = kToolbarHeight + 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return HomeHeader(
      title: title,
      logoWidget: logoWidget,
      menuIcon: menuIcon ?? Icons.menu,
      cartIcon: cartIcon ?? Icons.shopping_cart,
      backgroundColor: primaryColor,
      iconColor: secondaryColor,
      titleColor: secondaryColor,
      elevation: 3.0,
      borderRadius: BorderRadius.circular(12.0),
      onMenuPressed: onMenuPressed,
      onCartPressed: onCartPressed,
      onLogoPressed: onLogoPressed,
      height: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
