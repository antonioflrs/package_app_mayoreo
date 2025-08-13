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
      description: 'Sistema de tipografía con Inter',
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