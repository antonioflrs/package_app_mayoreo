import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Material Design-style icon system for the package
/// This emulates how Material Design handles icons with a robust, predictable API
class PackageIcons {
  PackageIcons._();

  // Base path for package assets - using the optimized test structure
  static const String _packagePath = 'packages/flutter_package_app_mayoreo/assets/icons';

  /// B Toolkit Copia icon
  static const String bToolkitCopia = '$_packagePath/blife/b_toolkit_copia.svg';
  
  /// Colors icon (BLife)
  static const String colors = '$_packagePath/blife/colors.svg';
  
  /// BLife Logos
  static const String blifeLogoActivo = '$_packagePath/blife/logo_activo.svg';
  static const String blifeLogoInactivo = '$_packagePath/blife/logo_inactivo.svg';
  
  /// Filled Icons
  static const String userActivo = '$_packagePath/filled/user_activo.svg';
  static const String ubicationActive = '$_packagePath/filled/ubication_active.svg';
  static const String ubicationInactive = '$_packagePath/filled/ubication_inactive.svg';
  static const String pedidosActive = '$_packagePath/filled/pedidos_active.svg';
  static const String pedidosInactive = '$_packagePath/filled/pedidos_inactive.svg';
  static const String ordersActivo = '$_packagePath/filled/orders_activo.svg';
  static const String mailIcon = '$_packagePath/filled/mail_icon.svg';
  static const String listActive = '$_packagePath/filled/list_active.svg';
  static const String listInactive = '$_packagePath/filled/list_inactive.svg';
  static const String helpActive = '$_packagePath/filled/help_active.svg';
  static const String helpInactive = '$_packagePath/filled/help_inactive.svg';
  static const String favoritesActivo = '$_packagePath/filled/favorites_activo.svg';
  static const String favActive = '$_packagePath/filled/fav_active.svg';
  static const String favInactive = '$_packagePath/filled/fav_inactive.svg';
  static const String documentActive = '$_packagePath/filled/document_active.svg';
  static const String documentInactive = '$_packagePath/filled/document_inactive.svg';
  static const String categoriesActivo = '$_packagePath/filled/categories_activo.svg';
  static const String cartActivo = '$_packagePath/filled/cart_activo.svg';
  static const String cardActive = '$_packagePath/filled/card_active.svg';
  static const String cardInactive = '$_packagePath/filled/card_inactive.svg';
  static const String appleLogo = '$_packagePath/filled/apple_logo.svg';
  
  /// Stroke Icons
  static const String zIndex = '$_packagePath/stroke/z_index.svg';
  static const String userInactivo = '$_packagePath/stroke/user_inactivo.svg';
  static const String tipography = '$_packagePath/stroke/tipography.svg';
  static const String shareIcon = '$_packagePath/stroke/share_icon.svg';
  static const String shadow = '$_packagePath/stroke/shadow.svg';
  static const String rest = '$_packagePath/stroke/rest.svg';
  static const String plusIcon = '$_packagePath/stroke/plus_icon.svg';
  static const String ordesInactivo = '$_packagePath/stroke/ordes_inactivo.svg';
  static const String icon = '$_packagePath/stroke/icon.svg';
  static const String hugeiconsNoteAdd = '$_packagePath/stroke/hugeicons_note-add.svg';
  static const String favoritesInactivo = '$_packagePath/stroke/favorites_inactivo.svg';
  static const String espaciados = '$_packagePath/stroke/espaciados.svg';
  static const String delete = '$_packagePath/stroke/delete.svg';
  static const String strokeColors = '$_packagePath/stroke/colors.svg';
  static const String close = '$_packagePath/stroke/close.svg';
  static const String check = '$_packagePath/stroke/check.svg';
  static const String categoriesInactive = '$_packagePath/stroke/categories_inactive.svg';
  static const String cartInactivo = '$_packagePath/stroke/cart_inactivo.svg';
  static const String burguerIcon = '$_packagePath/stroke/burguer_icon.svg';
  static const String breakpoints = '$_packagePath/stroke/breakpoints.svg';
  static const String arrowLeft = '$_packagePath/stroke/arrow_left.svg';
  static const String arrowDown = '$_packagePath/stroke/arrow_down.svg';
  static const String alertIcon = '$_packagePath/stroke/alert_icon.svg';
  
  /// Social Icons
  static const String whatsappLogo = '$_packagePath/social/whatsapp_logo.svg';
  
  /// Custom Icons
  static const String promotions = '$_packagePath/custom/promotions.svg';
  
  /// Flutter Icon (for technology tags)
  static const String iconFlutter = '$_packagePath/others/icon_flutter.svg';

  /// Get all available icons
  static const List<String> allIcons = [
    bToolkitCopia,
    colors,
    blifeLogoActivo,
    blifeLogoInactivo,
    userActivo,
    ubicationActive,
    ubicationInactive,
    pedidosActive,
    pedidosInactive,
    ordersActivo,
    mailIcon,
    listActive,
    listInactive,
    helpActive,
    helpInactive,
    favoritesActivo,
    favActive,
    favInactive,
    documentActive,
    documentInactive,
    categoriesActivo,
    cartActivo,
    cardActive,
    cardInactive,
    appleLogo,
    zIndex,
    userInactivo,
    tipography,
    shareIcon,
    shadow,
    rest,
    plusIcon,
    ordesInactivo,
    icon,
    hugeiconsNoteAdd,
    favoritesInactivo,
    espaciados,
    delete,
    strokeColors,
    close,
    check,
    categoriesInactive,
    cartInactivo,
    burguerIcon,
    breakpoints,
    arrowLeft,
    arrowDown,
    alertIcon,
    whatsappLogo,
    promotions,
    iconFlutter,
  ];

  /// Check if an icon exists
  static bool hasIcon(String iconPath) {
    return allIcons.contains(iconPath);
  }

  /// Get icon name from path
  static String getIconName(String iconPath) {
    switch (iconPath) {
      // BLife Icons
      case bToolkitCopia:
        return 'B Toolkit Copia';
      case colors:
        return 'BLife Colors';
      case blifeLogoActivo:
        return 'BLife Logo Activo';
      case blifeLogoInactivo:
        return 'BLife Logo Inactivo';
      
      // Filled Icons
      case userActivo:
        return 'User Activo';
      case ubicationActive:
        return 'Ubication Active';
      case ubicationInactive:
        return 'Ubication Inactive';
      case pedidosActive:
        return 'Pedidos Active';
      case pedidosInactive:
        return 'Pedidos Inactive';
      case ordersActivo:
        return 'Orders Activo';
      case mailIcon:
        return 'Mail Icon';
      case listActive:
        return 'List Active';
      case listInactive:
        return 'List Inactive';
      case helpActive:
        return 'Help Active';
      case helpInactive:
        return 'Help Inactive';
      case favoritesActivo:
        return 'Favorites Activo';
      case favActive:
        return 'Fav Active';
      case favInactive:
        return 'Fav Inactive';
      case documentActive:
        return 'Document Active';
      case documentInactive:
        return 'Document Inactive';
      case categoriesActivo:
        return 'Categories Activo';
      case cartActivo:
        return 'Cart Activo';
      case cardActive:
        return 'Card Active';
      case cardInactive:
        return 'Card Inactive';
      case appleLogo:
        return 'Apple Logo';
      
      // Stroke Icons
      case zIndex:
        return 'Z Index';
      case userInactivo:
        return 'User Inactivo';
      case tipography:
        return 'Typography';
      case shareIcon:
        return 'Share Icon';
      case shadow:
        return 'Shadow';
      case rest:
        return 'Rest';
      case plusIcon:
        return 'Plus Icon';
      case ordesInactivo:
        return 'Orders Inactivo';
      case icon:
        return 'Icon';
      case hugeiconsNoteAdd:
        return 'Note Add';
      case favoritesInactivo:
        return 'Favorites Inactivo';
      case espaciados:
        return 'Espaciados';
      case delete:
        return 'Delete';
      case strokeColors:
        return 'Stroke Colors';
      case close:
        return 'Close';
      case check:
        return 'Check';
      case categoriesInactive:
        return 'Categories Inactive';
      case cartInactivo:
        return 'Cart Inactivo';
      case burguerIcon:
        return 'Burger Icon';
      case breakpoints:
        return 'Breakpoints';
      case arrowLeft:
        return 'Arrow Left';
      case arrowDown:
        return 'Arrow Down';
      case alertIcon:
        return 'Alert Icon';
      
      // Social Icons
      case whatsappLogo:
        return 'WhatsApp Logo';
      
      // Custom Icons
      case promotions:
        return 'Promotions';
      case iconFlutter:
        return 'Flutter Icon';
      
      default:
        return 'Unknown Icon';
    }
  }
}

/// Material Design-style icon widget
/// Similar to Icon widget but for SVG assets from the package
class PackageIcon extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  final Widget? fallback;

  const PackageIcon({
    super.key,
    required this.iconPath,
    this.size,
    this.color,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    // Validate that the icon exists
    if (!PackageIcons.hasIcon(iconPath)) {
      debugPrint('PackageIcon: Icon not found: $iconPath');
      return fallback ?? _buildErrorIcon(context);
    }

    return SvgPicture.asset(
      iconPath,
      width: size,
      height: size,
      colorFilter: color != null 
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) => _buildPlaceholder(context),
      errorBuilder: (context, error, stackTrace) {
        debugPrint('PackageIcon: Error loading $iconPath: $error');
        return fallback ?? _buildErrorIcon(context);
      },
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
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

  Widget _buildErrorIcon(BuildContext context) {
    return Icon(
      Icons.error_outline,
      size: size,
      color: color ?? Colors.red,
    );
  }
}

/// Safe SVG Icon with error handling (legacy support)
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
    try {
      return SvgPicture.asset(
        iconPath,
        width: width,
        height: height,
        colorFilter: color != null 
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: fit,
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
        errorBuilder: (context, error, stackTrace) {
          debugPrint('SVG Error loading $iconPath: $error');
          return fallback ?? 
              SizedBox(
                width: width,
                height: height,
                child: Icon(
                  Icons.error_outline,
                  size: (width ?? height ?? 24) * 0.6,
                  color: color ?? Colors.red,
                ),
              );
        },
      );
    } catch (e) {
      debugPrint('SVG Exception loading $iconPath: $e');
      return fallback ?? 
          SizedBox(
            width: width,
            height: height,
            child: Icon(
              Icons.error_outline,
              size: (width ?? height ?? 24) * 0.6,
              color: color ?? Colors.red,
            ),
          );
    }
  }
}

/// Centralized Icon Registry - Simplified with only remaining icons
class SvgIconRegistry {
  // Base path for all icons - Using the optimized test structure
  static const String _basePath = 'assets/icons';
  
  // Remaining Icons
  static const String bToolkitCopia = '$_basePath/b_toolkit_copia.svg';
  static const String colors = '$_basePath/colors.svg';
  
  /// Get all icons organized by category - Simplified version
  static Map<String, List<SvgIconData>> getAllIconsByCategory() {
    return {
      'Remaining Icons': [
        SvgIconData('B Toolkit Copia', bToolkitCopia),
        SvgIconData('Colors', colors),
      ],
    };
  }
  
  /// Get all icons in a flat list
  static List<SvgIconData> getAllIcons() {
    return getAllIconsByCategory().values.expand((icons) => icons).toList();
  }
  
  /// Search icons by name
  static List<SvgIconData> searchIcons(String query) {
    if (query.isEmpty) return getAllIcons();
    
    final lowercaseQuery = query.toLowerCase();
    return getAllIcons().where((icon) {
      return icon.name.toLowerCase().contains(lowercaseQuery) ||
             icon.path.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
}

/// Icon data class
class SvgIconData {
  final String name;
  final String path;
  
  const SvgIconData(this.name, this.path);
  
  @override
  String toString() => 'SvgIconData(name: $name, path: $path)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SvgIconData && other.path == path;
  }
  
  @override
  int get hashCode => path.hashCode;
} 