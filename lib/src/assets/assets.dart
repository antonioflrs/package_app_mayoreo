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

/// Icon assets organized by category
class IconAssets {
  IconAssets._();

  /// BLife brand icons
  static const String blifeToolkit = 'assets/icons/blife/b_toolkit.svg';
  static const String blifeLogoActivo = 'assets/icons/blife/logo_activo.svg';
  static const String blifeLogoInactivo = 'assets/icons/blife/logo_inactivo.svg';
  static const String blifeLogoMayoreo = 'assets/icons/blife/logo_mayoreo.svg';

  /// Filled icons
  static const String filledAppleLogo = 'assets/icons/filled/apple_logo.svg';
  static const String filledCardActive = 'assets/icons/filled/card_active.svg';
  static const String filledCardInactive = 'assets/icons/filled/card_inactive.svg';
  static const String filledCartActivo = 'assets/icons/filled/cart_activo.svg';
  static const String filledCategoriesActivo = 'assets/icons/filled/categories_activo.svg';
  static const String filledDocumentActive = 'assets/icons/filled/document_active.svg';
  static const String filledDocumentInactive = 'assets/icons/filled/document_inactive.svg';
  static const String filledFavActive = 'assets/icons/filled/fav_active.svg';
  static const String filledFavInactive = 'assets/icons/filled/fav_inactive.svg';
  static const String filledFavoritesActivo = 'assets/icons/filled/favorites_activo.svg';
  static const String filledHelpActive = 'assets/icons/filled/help_active.svg';
  static const String filledHelpInactive = 'assets/icons/filled/help_inactive.svg';
  static const String filledListActive = 'assets/icons/filled/list_active.svg';
  static const String filledListInactive = 'assets/icons/filled/list_inactive.svg';
  static const String filledMailIcon = 'assets/icons/filled/mail_icon.svg';
  static const String filledNoteAddList = 'assets/icons/filled/note_add_list.svg';
  static const String filledOrdersActivo = 'assets/icons/filled/orders_activo.svg';
  static const String filledPedidosActive = 'assets/icons/filled/pedidos_active.svg';
  static const String filledPedidosInactive = 'assets/icons/filled/pedidos_inactive.svg';
  static const String filledUbicationActive = 'assets/icons/filled/ubication_active.svg';
  static const String filledUbicationInactive = 'assets/icons/filled/ubication_inactive.svg';
  static const String filledUserActivo = 'assets/icons/filled/user_activo.svg';

  /// Stroke icons
  static const String strokeAlertIcon = 'assets/icons/stroke/alert_icon.svg';
  static const String strokeArrowDown = 'assets/icons/stroke/arrow_down.svg';
  static const String strokeArrowLeft = 'assets/icons/stroke/arrow_left.svg';
  static const String strokeBreakpoints = 'assets/icons/stroke/breakpoints.svg';
  static const String strokeBurguerIcon = 'assets/icons/stroke/burguer_icon.svg';
  static const String strokeCartInactivo = 'assets/icons/stroke/cart_inactivo.svg';
  static const String strokeCategoriesInactive = 'assets/icons/stroke/categories_inactive.svg';
  static const String strokeCheck = 'assets/icons/stroke/check.svg';
  static const String strokeClose = 'assets/icons/stroke/close.svg';
  static const String strokeColors = 'assets/icons/stroke/colors.svg';
  static const String strokeDelete = 'assets/icons/stroke/delete.svg';
  static const String strokeEspaciados = 'assets/icons/stroke/espaciados.svg';
  static const String strokeFavoritesInactivo = 'assets/icons/stroke/favorites_inactivo.svg';
  static const String strokeHugeiconsNoteAdd = 'assets/icons/stroke/hugeicons_note-add.svg';
  static const String strokeIcon = 'assets/icons/stroke/icon.svg';
  static const String strokeOrdesInactivo = 'assets/icons/stroke/ordes_inactivo.svg';
  static const String strokePlusIcon = 'assets/icons/stroke/plus_icon.svg';
  static const String strokeRest = 'assets/icons/stroke/rest.svg';
  static const String strokeSearchIcon = 'assets/icons/stroke/search_icon.svg';
  static const String strokeShadow = 'assets/icons/stroke/shadow.svg';
  static const String strokeShareIcon = 'assets/icons/stroke/share_icon.svg';
  static const String strokeTipography = 'assets/icons/stroke/tipography.svg';
  static const String strokeUserInactivo = 'assets/icons/stroke/user_inactivo.svg';
  static const String strokeZIndex = 'assets/icons/stroke/z_index.svg';

  /// Symbolic icons
  static const String simbolicosPromotions = 'assets/icons/simbolicos/promotions.svg';

  /// Social media icons
  static const String socialMediaWhatsappLogo = 'assets/icons/social_media/whatsapp_logo.svg';

  /// Payment icons (from pagos directory)
  // Add specific payment icons as needed
  static const String pagosDirectory = 'assets/icons/pagos/';

  /// Order status icons (from status_pedidos directory)
  // Add specific order status icons as needed
  static const String statusPedidosDirectory = 'assets/icons/status_pedidos/';
}

/// Asset categories for easy access
class AssetCategories {
  AssetCategories._();

  /// All font assets
  static const List<String> fonts = [
    FontAssets.interLight,
    FontAssets.interRegular,
    FontAssets.interMedium,
    FontAssets.interSemiBold,
    FontAssets.interBold,
  ];

  /// All BLife brand icons
  static const List<String> blifeIcons = [
    IconAssets.blifeToolkit,
    IconAssets.blifeLogoActivo,
    IconAssets.blifeLogoInactivo,
    IconAssets.blifeLogoMayoreo,
  ];

  /// All filled icons
  static const List<String> filledIcons = [
    IconAssets.filledAppleLogo,
    IconAssets.filledCardActive,
    IconAssets.filledCardInactive,
    IconAssets.filledCartActivo,
    IconAssets.filledCategoriesActivo,
    IconAssets.filledDocumentActive,
    IconAssets.filledDocumentInactive,
    IconAssets.filledFavActive,
    IconAssets.filledFavInactive,
    IconAssets.filledFavoritesActivo,
    IconAssets.filledHelpActive,
    IconAssets.filledHelpInactive,
    IconAssets.filledListActive,
    IconAssets.filledListInactive,
    IconAssets.filledMailIcon,
    IconAssets.filledNoteAddList,
    IconAssets.filledOrdersActivo,
    IconAssets.filledPedidosActive,
    IconAssets.filledPedidosInactive,
    IconAssets.filledUbicationActive,
    IconAssets.filledUbicationInactive,
    IconAssets.filledUserActivo,
  ];

  /// All stroke icons
  static const List<String> strokeIcons = [
    IconAssets.strokeAlertIcon,
    IconAssets.strokeArrowDown,
    IconAssets.strokeArrowLeft,
    IconAssets.strokeBreakpoints,
    IconAssets.strokeBurguerIcon,
    IconAssets.strokeCartInactivo,
    IconAssets.strokeCategoriesInactive,
    IconAssets.strokeCheck,
    IconAssets.strokeClose,
    IconAssets.strokeColors,
    IconAssets.strokeDelete,
    IconAssets.strokeEspaciados,
    IconAssets.strokeFavoritesInactivo,
    IconAssets.strokeHugeiconsNoteAdd,
    IconAssets.strokeIcon,
    IconAssets.strokeOrdesInactivo,
    IconAssets.strokePlusIcon,
    IconAssets.strokeRest,
    IconAssets.strokeSearchIcon,
    IconAssets.strokeShadow,
    IconAssets.strokeShareIcon,
    IconAssets.strokeTipography,
    IconAssets.strokeUserInactivo,
    IconAssets.strokeZIndex,
  ];

  /// All symbolic icons
  static const List<String> symbolicIcons = [
    IconAssets.simbolicosPromotions,
  ];

  /// All social media icons
  static const List<String> socialMediaIcons = [
    IconAssets.socialMediaWhatsappLogo,
  ];

  /// All icon assets combined
  static const List<String> allIcons = [
    ...blifeIcons,
    ...filledIcons,
    ...strokeIcons,
    ...symbolicIcons,
    ...socialMediaIcons,
  ];

  /// All assets combined
  static const List<String> allAssets = [
    ...fonts,
    ...allIcons,
  ];
}

/// Utility class for asset operations
class AssetUtils {
  AssetUtils._();

  /// Check if an asset exists (for runtime validation)
  static bool isValidAsset(String assetPath) {
    return AssetCategories.allAssets.contains(assetPath);
  }

  /// Get all assets by category
  static List<String> getAssetsByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'fonts':
        return AssetCategories.fonts;
      case 'blife':
        return AssetCategories.blifeIcons;
      case 'filled':
        return AssetCategories.filledIcons;
      case 'stroke':
        return AssetCategories.strokeIcons;
      case 'symbolic':
        return AssetCategories.symbolicIcons;
      case 'social':
        return AssetCategories.socialMediaIcons;
      case 'all':
        return AssetCategories.allAssets;
      default:
        return [];
    }
  }

  /// Get asset count by category
  static int getAssetCount(String category) {
    return getAssetsByCategory(category).length;
  }

  /// Get total asset count
  static int get totalAssetCount => AssetCategories.allAssets.length;
}
