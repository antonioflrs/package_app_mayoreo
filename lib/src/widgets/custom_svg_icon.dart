import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget personalizado para renderizar iconos SVG propios
class CustomSvgIcon extends StatelessWidget {
  final String iconPath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final bool allowDrawingOutsideViewBox;

  const CustomSvgIcon({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.allowDrawingOutsideViewBox = false,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: width,
      height: height,
      colorFilter: color != null 
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      fit: fit,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: (context) => SizedBox(
        width: width,
        height: height,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget para renderizar iconos SVG con manejo de errores
class SafeSvgIcon extends StatelessWidget {
  final String iconPath;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? fallback;
  final BoxFit fit;

  const SafeSvgIcon({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.color,
    this.fallback,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(iconPath),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SvgPicture.string(
            snapshot.data!,
            width: width,
            height: height,
            colorFilter: color != null 
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
            fit: fit,
          );
        } else if (snapshot.hasError) {
          return fallback ?? 
              Icon(
                Icons.error_outline,
                size: width ?? height ?? 24,
                color: color ?? Colors.red,
              );
        } else {
          return SizedBox(
            width: width,
            height: height,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

/// Clase helper para acceder a iconos SVG organizados por categorías
class SvgIconHelper {
  static const String _basePath = 'assets/icons';
  
  // Iconos de navegación
  static const String burgerMenu = '$_basePath/stroke/burguer_icon.svg';
  static const String arrowLeft = '$_basePath/stroke/arrow_left.svg';
  static const String arrowDown = '$_basePath/stroke/arrow_down.svg';
  static const String close = '$_basePath/stroke/close.svg';
  static const String check = '$_basePath/stroke/check.svg';
  static const String plus = '$_basePath/stroke/plus_icon.svg';
  static const String reset = '$_basePath/stroke/rest.svg';
  static const String search = '$_basePath/stroke/search_icon.svg';
  
  // Iconos de usuario
  static const String userActive = '$_basePath/filled/user_activo.svg';
  static const String userInactive = '$_basePath/stroke/user_inactivo.svg';
  
  // Iconos de pedidos y carrito
  static const String ordersActive = '$_basePath/filled/pedidos_active.svg';
  static const String ordersInactive = '$_basePath/filled/pedidos_inactive.svg';
  static const String cartActive = '$_basePath/filled/cart_activo.svg';
  static const String cartInactive = '$_basePath/stroke/cart_inactivo.svg';
  
  // Iconos de categorías
  static const String categoriesActive = '$_basePath/filled/categories_activo.svg';
  static const String categoriesInactive = '$_basePath/stroke/categories_inactive.svg';
  
  // Iconos de favoritos
  static const String favoritesActive = '$_basePath/filled/favorites_activo.svg';
  static const String favoritesInactive = '$_basePath/stroke/favorites_inactivo.svg';
  static const String favActive = '$_basePath/filled/fav_active.svg';
  static const String favInactive = '$_basePath/filled/fav_inactive.svg';
  
  // Iconos de documentos
  static const String documentActive = '$_basePath/filled/document_active.svg';
  static const String documentInactive = '$_basePath/filled/document_inactive.svg';
  
  // Iconos de tarjetas
  static const String cardActive = '$_basePath/filled/card_active.svg';
  static const String cardInactive = '$_basePath/filled/card_inactive.svg';
  
  // Iconos de ayuda
  static const String helpActive = '$_basePath/filled/help_active.svg';
  static const String helpInactive = '$_basePath/filled/help_inactive.svg';
  
  // Iconos de ubicación
  static const String locationActive = '$_basePath/filled/ubication_active.svg';
  static const String locationInactive = '$_basePath/filled/ubication_inactive.svg';
  
  // Iconos de comunicación
  static const String mail = '$_basePath/filled/mail_icon.svg';
  static const String share = '$_basePath/stroke/share_icon.svg';
  
  // Iconos de acciones
  static const String delete = '$_basePath/stroke/delete.svg';
  static const String alert = '$_basePath/stroke/alert_icon.svg';
  
  // Iconos de sistema de diseño
  static const String colors = '$_basePath/stroke/colors.svg';
  static const String typography = '$_basePath/stroke/tipography.svg';
  static const String shadows = '$_basePath/stroke/shadow.svg';
  static const String spacing = '$_basePath/stroke/espaciados.svg';
  static const String breakpoints = '$_basePath/stroke/breakpoints.svg';
  static const String zIndex = '$_basePath/stroke/z_index.svg';
  
  // Iconos de marca
  static const String bToolkit = '$_basePath/blife/b_toolkit.svg';
  static const String logoActive = '$_basePath/blife/logo_activo.svg';
  static const String logoInactive = '$_basePath/blife/logo_inactivo.svg';
  static const String appleLogo = '$_basePath/filled/apple_logo.svg';
  
  // Iconos de redes sociales
  static const String whatsapp = '$_basePath/social_media/whatsapp_logo.svg';
  
  /// Obtiene todos los iconos organizados por categoría
  static Map<String, List<String>> getAllIconsByCategory() {
    return {
      'Navegación': [burgerMenu, arrowLeft, arrowDown, close, check, plus, reset, search],
      'Usuario': [userActive, userInactive],
      'Pedidos y Carrito': [ordersActive, ordersInactive, cartActive, cartInactive],
      'Categorías': [categoriesActive, categoriesInactive],
      'Favoritos': [favoritesActive, favoritesInactive, favActive, favInactive],
      'Documentos': [documentActive, documentInactive],
      'Tarjetas': [cardActive, cardInactive],
      'Ayuda': [helpActive, helpInactive],
      'Ubicación': [locationActive, locationInactive],
      'Comunicación': [mail, share],
      'Acciones': [delete, alert],
      'Sistema de Diseño': [colors, typography, shadows, spacing, breakpoints, zIndex],
      'Marca': [bToolkit, logoActive, logoInactive, appleLogo],
      'Redes Sociales': [whatsapp],
    };
  }
  
  /// Obtiene todos los iconos en una lista plana
  static List<String> getAllIcons() {
    return getAllIconsByCategory().values.expand((icons) => icons).toList();
  }
  
  /// Busca iconos por nombre
  static List<String> searchIcons(String query) {
    if (query.isEmpty) return getAllIcons();
    
    final lowercaseQuery = query.toLowerCase();
    return getAllIcons().where((icon) {
      final fileName = icon.split('/').last.toLowerCase();
      return fileName.contains(lowercaseQuery);
    }).toList();
  }
} 