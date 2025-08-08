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

  /// Available Icons (Verified working)
  
  // BLife Icons
  static const String bToolkitCopia = 'assets/icons/blife/b_toolkit_copia.svg';
  static const String colors = 'assets/icons/blife/colors.svg';
  static const String blifeLogoActivo = 'assets/icons/blife/logo_activo.svg';
  static const String blifeLogoInactivo = 'assets/icons/blife/logo_inactivo.svg';
  
  // Filled Icons
  static const String user = 'assets/icons/filled/user.svg';
  static const String userActivo = 'assets/icons/filled/user_activo.svg';
  static const String ubicationActive = 'assets/icons/filled/ubication_active.svg';
  static const String ubicationInactive = 'assets/icons/filled/ubication_inactive.svg';
  static const String pedidosActive = 'assets/icons/filled/pedidos_active.svg';
  static const String pedidosInactive = 'assets/icons/filled/pedidos_inactive.svg';
  static const String ordersActivo = 'assets/icons/filled/orders_activo.svg';
  static const String mailIcon = 'assets/icons/filled/mail_icon.svg';
  static const String listActive = 'assets/icons/filled/list_active.svg';
  static const String listInactive = 'assets/icons/filled/list_inactive.svg';
  static const String helpActive = 'assets/icons/filled/help_active.svg';
  static const String helpInactive = 'assets/icons/filled/help_inactive.svg';
  static const String favoritesActivo = 'assets/icons/filled/favorites_activo.svg';
  static const String favActive = 'assets/icons/filled/fav_active.svg';
  static const String favInactive = 'assets/icons/filled/fav_inactive.svg';
  static const String documentActive = 'assets/icons/filled/document_active.svg';
  static const String documentInactive = 'assets/icons/filled/document_inactive.svg';
  static const String categoriesActivo = 'assets/icons/filled/categories_activo.svg';
  static const String cartActivo = 'assets/icons/filled/cart_activo.svg';
  static const String cardActive = 'assets/icons/filled/card_active.svg';
  static const String cardInactive = 'assets/icons/filled/card_inactive.svg';
  static const String appleLogo = 'assets/icons/filled/apple_logo.svg';
  
  // Stroke Icons
  static const String zIndex = 'assets/icons/stroke/z_index.svg';
  static const String userInactivo = 'assets/icons/stroke/user_inactivo.svg';
  static const String tipography = 'assets/icons/stroke/tipography.svg';
  static const String shareIcon = 'assets/icons/stroke/share_icon.svg';
  static const String shadow = 'assets/icons/stroke/shadow.svg';
  static const String rest = 'assets/icons/stroke/rest.svg';
  static const String plusIcon = 'assets/icons/stroke/plus_icon.svg';
  static const String ordesInactivo = 'assets/icons/stroke/ordes_inactivo.svg';
  static const String icon = 'assets/icons/stroke/icon.svg';
  static const String hugeiconsNoteAdd = 'assets/icons/stroke/hugeicons_note-add.svg';
  static const String favoritesInactivo = 'assets/icons/stroke/favorites_inactivo.svg';
  static const String espaciados = 'assets/icons/stroke/espaciados.svg';
  static const String delete = 'assets/icons/stroke/delete.svg';
  static const String strokeColors = 'assets/icons/stroke/colors.svg';
  static const String close = 'assets/icons/stroke/close.svg';
  static const String check = 'assets/icons/stroke/check.svg';
  static const String categoriesInactive = 'assets/icons/stroke/categories_inactive.svg';
  static const String cartInactivo = 'assets/icons/stroke/cart_inactivo.svg';
  static const String burguerIcon = 'assets/icons/stroke/burguer_icon.svg';
  static const String breakpoints = 'assets/icons/stroke/breakpoints.svg';
  static const String arrowLeft = 'assets/icons/stroke/arrow_left.svg';
  static const String arrowDown = 'assets/icons/stroke/arrow_down.svg';
  static const String alertIcon = 'assets/icons/stroke/alert_icon.svg';
  
  // Social Icons
  static const String whatsappLogo = 'assets/icons/social/whatsapp_logo.svg';
  
  // Custom Icons
  static const String promotions = 'assets/icons/custom/promotions.svg';
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
