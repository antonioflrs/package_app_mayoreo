import 'package:flutter/material.dart';
import '../models/navigation_item.dart';
import '../widgets/component_content/component_card_content.dart';
import '../widgets/component_content/colors_content.dart';
import '../widgets/component_content/typography_content.dart';
import '../widgets/component_content/buttons_content.dart';
import '../widgets/component_content/text_fields_content.dart';
import '../widgets/component_content/shadows_content.dart';
import '../widgets/component_content/spacing_content.dart';
import '../widgets/component_content/radii_content.dart';
import '../widgets/component_content/breakpoints_content.dart';
import '../widgets/component_content/z_index_content.dart';
import '../widgets/component_content/icons_content.dart';
import '../widgets/component_content/accordion_content.dart';
import '../widgets/component_content/alert_content.dart';
import '../widgets/component_content/avatar_content.dart';
import '../widgets/component_content/badge_content.dart';
import '../widgets/component_content/breadcrumbs_content.dart';
import '../widgets/component_content/search_bar_content.dart';
import '../widgets/component_content/bottom_navigation_content.dart';
import '../widgets/component_content/tabs_content.dart';
import '../widgets/component_content/content_app_bar_content.dart';
import '../widgets/component_content/product_card_content.dart';
import '../widgets/component_content/bienestar_banner_content.dart';
import '../widgets/component_content/promotions_carousel_content.dart';
import '../widgets/component_content/category_item_content.dart';
import '../widgets/component_content/product_tabs_widget_content.dart';
import '../widgets/component_content/expandable_menu_item_content.dart';
import '../widgets/component_content/home_header_content.dart';
import '../widgets/component_content/menu_lateral_content.dart';
import '../widgets/component_content/presentation_selector_content.dart';
import '../widgets/component_content/featured_reviews_widget_content.dart';
import '../widgets/component_content/product_info_widget_content.dart';
import '../widgets/component_content/rating_stars_content.dart';
import '../widgets/component_content/favorite_icon_content.dart';
import '../widgets/component_content/stacked_cards_widget_content.dart';
import '../widgets/component_content/options_menu_content.dart';
import '../widgets/component_content/list_card_content.dart';
import '../widgets/component_content/product_card_horizontal_content.dart';
import '../widgets/component_content/discount_tiers_widget_content.dart';
import '../widgets/component_content/discount_tiers_widget_logout_content.dart';
import '../widgets/component_content/product_card_horizontal_v2_content.dart';

class DesignSystemData {
  static const List<NavigationItem> designGuides = [
    NavigationItem.material(
      id: 'colors',
      title: 'Paleta de colores',
      description: 'Colores del sistema de diseño',
      icon: Icons.palette,
      category: NavigationCategory.designGuides,
      content: ColorsContent(),
    ),
    NavigationItem.material(
      id: 'typography',
      title: 'Tipografía',
      description: 'Sistema de tipografía que utiliza la fuente Inter con diferentes pesos y tamaños para crear una jerarquía visual clara. Incluye font features avanzadas para control tipográfico preciso.',
      icon: Icons.text_fields,
      category: NavigationCategory.designGuides,
      content: TypographyContent(),
    ),
    NavigationItem.material(
      id: 'shadows',
      title: 'Sombras',
      description: 'Sistema de sombras y elevación',
      icon: Icons.layers,
      category: NavigationCategory.designGuides,
      content: ShadowsContent(),
    ),
    NavigationItem.material(
      id: 'spacing',
      title: 'Espaciado',
      description: 'Sistema de espaciado y márgenes',
      icon: Icons.space_bar,
      category: NavigationCategory.designGuides,
      content: SpacingContent(),
    ),
    NavigationItem.material(
      id: 'radii',
      title: 'Radios',
      description: 'Sistema de bordes redondeados',
      icon: Icons.rounded_corner,
      category: NavigationCategory.designGuides,
      content: RadiiContent(),
    ),
    NavigationItem.material(
      id: 'breakpoints',
      title: 'Breakpoints',
      description: 'Puntos de quiebre responsivos',
      icon: Icons.view_week,
      category: NavigationCategory.designGuides,
      content: BreakpointsContent(),
    ),
    NavigationItem.material(
      id: 'z-index',
      title: 'Z Index',
      description: 'Sistema de capas y profundidad',
      icon: Icons.layers_outlined,
      category: NavigationCategory.designGuides,
      content: ZIndexContent(),
    ),
    NavigationItem.material(
      id: 'icons',
      title: 'Iconos',
      description: 'Biblioteca de iconos del sistema',
      icon: Icons.style,
      category: NavigationCategory.designGuides,
      content: IconsContent(),
    ),
    NavigationItem.material(
      id: 'user-profile',
      title: 'Perfil de Usuario',
      description: 'Gestión de perfil de usuario',
      icon: Icons.person_outline,
      category: NavigationCategory.designGuides,
    ),
    NavigationItem.material(
      id: 'orders',
      title: 'Pedidos',
      description: 'Gestión de pedidos',
      icon: Icons.shopping_cart,
      category: NavigationCategory.designGuides,
    ),
  ];

  static const List<NavigationItem> uiComponents = [
    NavigationItem.material(
      id: 'content-app-bar',
      title: 'Content App Bar',
      description: 'App bar unificado con back, título y sugerencia UX',
      icon: Icons.arrow_back,
      category: NavigationCategory.uiComponents,
      content: ContentAppBarContent(),
    ),
    NavigationItem.material(
      id: 'component-card',
      title: 'Component Card',
      description: 'Card reutilizable para listar componentes',
      icon: Icons.view_agenda,
      category: NavigationCategory.uiComponents,
      content: ComponentCardContent(),
    ),
    NavigationItem.material(
      id: 'buttons',
      title: 'Botones',
      description: 'Sistema de botones interactivos',
      icon: Icons.touch_app,
      category: NavigationCategory.uiComponents,
      content: ButtonsContent(),
    ),
    NavigationItem.material(
      id: 'text-fields',
      title: 'Campos de texto',
      description: 'Campos de entrada de texto',
      icon: Icons.input,
      category: NavigationCategory.uiComponents,
      content: TextFieldsContent(),
    ),
    NavigationItem.material(
      id: 'accordion',
      title: 'Acordeón',
      description: 'Componente de acordeón colapsable',
      icon: Icons.expand_more,
      category: NavigationCategory.uiComponents,
      content: AccordionContent(),
    ),
    NavigationItem.material(
      id: 'action-bar',
      title: 'Action bar',
      description: 'Barra de acciones',
      icon: Icons.more_vert,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.material(
      id: 'alert',
      title: 'Alert',
      description: 'Alertas y notificaciones',
      icon: Icons.warning,
      category: NavigationCategory.uiComponents,
      content: AlertContent(),
    ),
    NavigationItem.material(
      id: 'autocomplete',
      title: 'Autocomplete search',
      description: 'Búsqueda con autocompletado',
      icon: Icons.search,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.material(
      id: 'avatar',
      title: 'Avatar',
      description: 'Avatares de usuario',
      icon: Icons.person,
      category: NavigationCategory.uiComponents,
      content: AvatarContent(),
    ),
    NavigationItem.material(
      id: 'badge',
      title: 'Badge',
      description: 'Badges y etiquetas',
      icon: Icons.label,
      category: NavigationCategory.uiComponents,
      content: BadgeContent(),
    ),
    NavigationItem.material(
      id: 'bulk-actions',
      title: 'Bulk actions',
      description: 'Acciones en lote',
      icon: Icons.delete_sweep,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.material(
      id: 'breadcrumbs',
      title: 'Breadcrumbs',
      description: 'Navegación de migas de pan',
      icon: Icons.navigation,
      category: NavigationCategory.uiComponents,
      content: BreadcrumbsContent(),
    ),
    NavigationItem.material(
      id: 'search-bar',
      title: 'Barra de Búsqueda',
      description: 'Widget de búsqueda con autocompletado',
      icon: Icons.search,
      category: NavigationCategory.uiComponents,
      content: SearchBarContent(),
    ),
    NavigationItem.material(
      id: 'bottom-navigation',
      title: 'Bottom Navigation',
      description: 'Barra de navegación inferior personalizada',
      icon: Icons.navigation,
      category: NavigationCategory.uiComponents,
      content: BottomNavigationContent(),
    ),
    NavigationItem.material(
      id: 'tabs',
      title: 'Tabs',
      description: 'Widget de tabs personalizable con estados activo/inactivo',
      icon: Icons.tab,
      category: NavigationCategory.uiComponents,
      content: TabsContent(),
    ),
    NavigationItem.material(
      id: 'product-card',
      title: 'Product Card',
      description: 'Tarjeta de producto para mostrar información básica de productos',
      icon: Icons.shopping_bag,
      category: NavigationCategory.uiComponents,
      content: ProductCardContent(),
    ),
    NavigationItem.material(
      id: 'bienestar-banner',
      title: 'Bienestar Banner',
      description: 'Banner promocional con contador regresivo para ofertas',
      icon: Icons.local_offer,
      category: NavigationCategory.uiComponents,
      content: BienestarBannerContent(),
    ),
    NavigationItem.material(
      id: 'promotions-carousel',
      title: 'Promotions Carousel',
      description: 'Carrusel de promociones con autoplay y controles personalizables',
      icon: Icons.view_carousel,
      category: NavigationCategory.uiComponents,
      content: PromotionsCarouselContent(),
    ),
    NavigationItem.material(
      id: 'category-item',
      title: 'Category Item',
      description: 'Elemento de categoría con tres variantes: básico, con icono y colorido',
      icon: Icons.category,
      category: NavigationCategory.uiComponents,
      content: CategoryItemContent(),
    ),
    NavigationItem.material(
      id: 'product-tabs-widget',
      title: 'Product Tabs Widget',
      description: 'Widget de pestañas de producto dinámico y personalizable',
      icon: Icons.tab,
      category: NavigationCategory.uiComponents,
      content: ProductTabsWidgetContent(),
    ),
    NavigationItem.material(
      id: 'expandable-menu-item',
      title: 'Expandable Menu Item',
      description: 'Widget de menú expandible personalizable con subcategorías, colores editables e iconos Material',
      icon: Icons.expand_more,
      category: NavigationCategory.uiComponents,
      content: ExpandableMenuItemContent(),
    ),
    NavigationItem.material(
      id: 'home-header',
      title: 'Home Header',
      description: 'Widget de header personalizable para la pantalla de inicio con opciones de colores, iconos y acciones',
      icon: Icons.view_headline,
      category: NavigationCategory.uiComponents,
      content: HomeHeaderContent(),
    ),
    NavigationItem.material(
      id: 'menu-lateral',
      title: 'Menu Lateral',
      description: 'Widget de menú lateral personalizable con elementos expandibles, categorías y perfil de usuario',
      icon: Icons.menu_open,
      category: NavigationCategory.uiComponents,
      content: MenuLateralContent(),
    ),
    NavigationItem.material(
      id: 'presentation-selector',
      title: 'Presentation Selector',
      description: 'Widget personalizable para seleccionar tipo de presentación de producto con imagen, precios, descuentos y cápsulas',
      icon: Icons.view_module,
      category: NavigationCategory.uiComponents,
      content: PresentationSelectorContent(),
    ),
    NavigationItem.material(
      id: 'featured-reviews-widget',
      title: 'Featured Reviews Widget',
      description: 'Widget personalizable de reseñas destacadas con carrusel automático, estrellas y indicadores de página',
      icon: Icons.star_rate,
      category: NavigationCategory.uiComponents,
      content: FeaturedReviewsWidgetContent(),
    ),
    NavigationItem.material(
      id: 'product-info-widget',
      title: 'Product Info Widget',
      description: 'Widget personalizable de información de producto con texto expandible, formato rico y efecto de gradiente',
      icon: Icons.info_outline,
      category: NavigationCategory.uiComponents,
      content: ProductInfoWidgetContent(),
    ),
    NavigationItem.material(
      id: 'rating-stars',
      title: 'Rating Stars',
      description: 'Widget personalizable de estrellas de calificación con soporte para estrellas completas, medias y vacías',
      icon: Icons.star,
      category: NavigationCategory.uiComponents,
      content: RatingStarsContent(),
    ),
    NavigationItem.material(
      id: 'favorite-icon',
      title: 'Favorite Icon',
      description: 'Widget personalizable de icono de favorito con animación de escala y temas predefinidos',
      icon: Icons.favorite,
      category: NavigationCategory.uiComponents,
      content: FavoriteIconContent(),
    ),
    NavigationItem.material(
      id: 'stacked-cards-widget',
      title: 'Stacked Cards Widget',
      description: 'Widget personalizable para mostrar tarjetas apiladas con efecto de rotación. Soporta dimensiones personalizadas, imágenes múltiples, textos personalizados y estilos completos',
      icon: Icons.view_agenda,
      category: NavigationCategory.uiComponents,
      content: StackedCardsWidgetContent(),
    ),
    NavigationItem.material(
      id: 'options-menu',
      title: 'Options Menu',
      description: 'Widget personalizable de menú de opciones con overlay para acciones contextuales',
      icon: Icons.more_vert,
      category: NavigationCategory.uiComponents,
      content: OptionsMenuContent(),
    ),
    NavigationItem.material(
      id: 'list-card',
      title: 'List Card',
      description: 'Widget para mostrar cards de listas de favoritos con opciones de menú y tarjetas apiladas',
      icon: Icons.list_alt,
      category: NavigationCategory.uiComponents,
      content: ListCardContent(),
    ),
    NavigationItem.material(
      id: 'product-card-horizontal',
      title: 'Product Card Horizontal',
      description: 'Widget para mostrar tarjetas de productos en formato horizontal con opciones de menú, precios y botón de agregar',
      icon: Icons.shopping_cart,
      category: NavigationCategory.uiComponents,
      content: ProductCardHorizontalContent(),
    ),
    NavigationItem.material(
      id: 'discount-tiers-widget',
      title: 'Discount Tiers Widget',
      description: 'Widget personalizable para mostrar niveles de descuento con barra de progreso y selección interactiva',
      icon: Icons.local_offer,
      category: NavigationCategory.uiComponents,
      content: DiscountTiersWidgetContent(),
    ),
    NavigationItem.material(
      id: 'discount-tiers-widget-logout',
      title: 'Discount Tiers Widget Logout',
      description: 'Widget personalizable para mostrar niveles de descuento con banner de aplicación para usuarios no autenticados',
      icon: Icons.logout,
      category: NavigationCategory.uiComponents,
      content: DiscountTiersWidgetLogoutContent(),
    ),
    NavigationItem.material(
      id: 'product-card-horizontal-v2',
      title: 'Product Card Horizontal V2',
      description: 'Widget personalizable para mostrar tarjetas de productos en formato horizontal con controles de cantidad, precios y diferentes estados',
      icon: Icons.shopping_cart_outlined,
      category: NavigationCategory.uiComponents,
      content: ProductCardHorizontalV2Content(),
    ),
  ];

  static List<NavigationItem> getAllItems() {
    return [...designGuides, ...uiComponents];
  }

  static List<NavigationItem> searchItems(String query) {
    if (query.isEmpty) return getAllItems();
    
    final lowercaseQuery = query.toLowerCase();
    return getAllItems().where((item) {
      return item.title.toLowerCase().contains(lowercaseQuery) ||
             item.description.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
} 