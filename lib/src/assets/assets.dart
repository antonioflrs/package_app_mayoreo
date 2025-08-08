// Assets export file for flutter_package_app_mayoreo
// This file provides easy access to all assets included in the package

/// Font assets
class FontAssets {
  FontAssets._();

  /// Inter font family assets
  static const String interLight = 'assets/fonts/Inter-Light.ttf';
  static const String interRegular = 'assets/fonts/Inter-Regular.ttf';
  static const String interMedium = 'assets/fonts/Inter-Medium.ttf';
  static const String interSemiBold = 'assets/fonts/Inter-SemiBold.ttf';
  static const String interBold = 'assets/fonts/Inter-Bold.ttf';

  /// Font family name
  static const String interFamily = 'Inter';
}

/// Icon assets organized by category - Cleaned version
class IconAssets {
  IconAssets._();

  // Base path for package assets
  static const String _packagePath = 'packages/flutter_package_app_mayoreo/assets/icons';

  /// Available Icons (Verified working)
  
  // BLife Icons
  static const String bToolkitCopia = '$_packagePath/blife/b_toolkit_copia.svg';
  static const String colors = '$_packagePath/blife/colors.svg';
  static const String blifeLogoActivo = '$_packagePath/blife/logo_activo.svg';
  static const String blifeLogoInactivo = '$_packagePath/blife/logo_inactivo.svg';
  
  // Filled Icons
  static const String user = '$_packagePath/filled/user.svg';
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
  
  // Stroke Icons
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
  
  // Social Icons
  static const String whatsappLogo = '$_packagePath/social/whatsapp_logo.svg';
  
  // Custom Icons
  static const String promotions = '$_packagePath/custom/promotions.svg';
  static const String iconFlutter = '$_packagePath/others/icon_flutter.svg';
}

/// Asset categories for easy access - Cleaned version
class AssetCategories {
  AssetCategories._();

  /// All available icons
  static const List<String> allIcons = [
    // BLife Icons
    IconAssets.bToolkitCopia,
    IconAssets.colors,
    IconAssets.blifeLogoActivo,
    IconAssets.blifeLogoInactivo,
    
    // Filled Icons
    IconAssets.user,
    IconAssets.userActivo,
    IconAssets.ubicationActive,
    IconAssets.ubicationInactive,
    IconAssets.pedidosActive,
    IconAssets.pedidosInactive,
    IconAssets.ordersActivo,
    IconAssets.mailIcon,
    IconAssets.listActive,
    IconAssets.listInactive,
    IconAssets.helpActive,
    IconAssets.helpInactive,
    IconAssets.favoritesActivo,
    IconAssets.favActive,
    IconAssets.favInactive,
    IconAssets.documentActive,
    IconAssets.documentInactive,
    IconAssets.categoriesActivo,
    IconAssets.cartActivo,
    IconAssets.cardActive,
    IconAssets.cardInactive,
    IconAssets.appleLogo,
    
    // Stroke Icons
    IconAssets.zIndex,
    IconAssets.userInactivo,
    IconAssets.tipography,
    IconAssets.shareIcon,
    IconAssets.shadow,
    IconAssets.rest,
    IconAssets.plusIcon,
    IconAssets.ordesInactivo,
    IconAssets.icon,
    IconAssets.hugeiconsNoteAdd,
    IconAssets.favoritesInactivo,
    IconAssets.espaciados,
    IconAssets.delete,
    IconAssets.strokeColors,
    IconAssets.close,
    IconAssets.check,
    IconAssets.categoriesInactive,
    IconAssets.cartInactivo,
    IconAssets.burguerIcon,
    IconAssets.breakpoints,
    IconAssets.arrowLeft,
    IconAssets.arrowDown,
    IconAssets.alertIcon,
    
    // Social Icons
    IconAssets.whatsappLogo,
    
    // Custom Icons
    IconAssets.promotions,
    IconAssets.iconFlutter,
  ];

  /// Icons by category
  static const Map<String, List<String>> iconsByCategory = {
    'BLife Icons': [
      IconAssets.bToolkitCopia,
      IconAssets.colors,
      IconAssets.blifeLogoActivo,
      IconAssets.blifeLogoInactivo,
    ],
    'Filled Icons': [
      IconAssets.user,
      IconAssets.userActivo,
      IconAssets.ubicationActive,
      IconAssets.ubicationInactive,
      IconAssets.pedidosActive,
      IconAssets.pedidosInactive,
      IconAssets.ordersActivo,
      IconAssets.mailIcon,
      IconAssets.listActive,
      IconAssets.listInactive,
      IconAssets.helpActive,
      IconAssets.helpInactive,
      IconAssets.favoritesActivo,
      IconAssets.favActive,
      IconAssets.favInactive,
      IconAssets.documentActive,
      IconAssets.documentInactive,
      IconAssets.categoriesActivo,
      IconAssets.cartActivo,
      IconAssets.cardActive,
      IconAssets.cardInactive,
      IconAssets.appleLogo,
    ],
    'Stroke Icons': [
      IconAssets.zIndex,
      IconAssets.userInactivo,
      IconAssets.tipography,
      IconAssets.shareIcon,
      IconAssets.shadow,
      IconAssets.rest,
      IconAssets.plusIcon,
      IconAssets.ordesInactivo,
      IconAssets.icon,
      IconAssets.hugeiconsNoteAdd,
      IconAssets.favoritesInactivo,
      IconAssets.espaciados,
      IconAssets.delete,
      IconAssets.strokeColors,
      IconAssets.close,
      IconAssets.check,
      IconAssets.categoriesInactive,
      IconAssets.cartInactivo,
      IconAssets.burguerIcon,
      IconAssets.breakpoints,
      IconAssets.arrowLeft,
      IconAssets.arrowDown,
      IconAssets.alertIcon,
    ],
    'Social Icons': [
      IconAssets.whatsappLogo,
    ],
    'Custom Icons': [
      IconAssets.promotions,
      IconAssets.iconFlutter,
    ],
  };

  /// All font assets
  static const List<String> allFonts = [
    FontAssets.interLight,
    FontAssets.interRegular,
    FontAssets.interMedium,
    FontAssets.interSemiBold,
    FontAssets.interBold,
  ];
}

/// Asset utilities
class AssetUtils {
  AssetUtils._();

  /// Get all available assets
  static List<String> getAllAssets() {
    return [
      ...AssetCategories.allIcons,
      ...AssetCategories.allFonts,
    ];
  }

  /// Check if an asset exists (basic validation)
  static bool isValidAsset(String assetPath) {
    return AssetCategories.allIcons.contains(assetPath) ||
           AssetCategories.allFonts.contains(assetPath);
  }

  /// Get asset category
  static String? getAssetCategory(String assetPath) {
    for (final entry in AssetCategories.iconsByCategory.entries) {
      if (entry.value.contains(assetPath)) {
        return entry.key;
      }
    }
    return null;
  }
}
