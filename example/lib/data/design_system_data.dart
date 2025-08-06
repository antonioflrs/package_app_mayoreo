import 'package:flutter/material.dart';
import '../models/navigation_item.dart';
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
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class DesignSystemData {
  static const List<NavigationItem> designGuides = [
    NavigationItem.svg(
      id: 'colors',
      title: 'Paleta de colores',
      description: 'Colores del sistema de diseño',
      svgIcon: 'lib/src/icons/stroke/colors.svg',
      category: NavigationCategory.designGuides,
      content: ColorsContent(),
    ),
    NavigationItem.svg(
      id: 'typography',
      title: 'Tipografía',
      description: 'Sistema de tipografía con Inter',
      svgIcon: 'lib/src/icons/stroke/tipography.svg',
      category: NavigationCategory.designGuides,
      content: TypographyContent(),
    ),
    NavigationItem.svg(
      id: 'shadows',
      title: 'Sombras',
      description: 'Sistema de sombras y elevación',
      svgIcon: 'lib/src/icons/stroke/shadow.svg',
      category: NavigationCategory.designGuides,
      content: ShadowsContent(),
    ),
    NavigationItem.svg(
      id: 'spacing',
      title: 'Espaciado',
      description: 'Sistema de espaciado y márgenes',
      svgIcon: 'lib/src/icons/stroke/espaciados.svg',
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
    NavigationItem.svg(
      id: 'breakpoints',
      title: 'Breakpoints',
      description: 'Puntos de quiebre responsivos',
      svgIcon: 'lib/src/icons/stroke/breakpoints.svg',
      category: NavigationCategory.designGuides,
      content: BreakpointsContent(),
    ),
    NavigationItem.svg(
      id: 'z-index',
      title: 'Z Index',
      description: 'Sistema de capas y profundidad',
      svgIcon: 'lib/src/icons/stroke/z index.svg',
      category: NavigationCategory.designGuides,
      content: ZIndexContent(),
    ),
    NavigationItem.svg(
      id: 'icons',
      title: 'Iconos',
      description: 'Biblioteca de iconos del sistema',
      svgIcon: SvgIcons.colors,
      category: NavigationCategory.designGuides,
      content: IconsContent(),
    ),
    NavigationItem.svg(
      id: 'user-profile',
      title: 'Perfil de Usuario',
      description: 'Gestión de perfil de usuario',
      svgIcon: SvgIcons.userActive,
      category: NavigationCategory.designGuides,
    ),
    NavigationItem.svg(
      id: 'orders',
      title: 'Pedidos',
      description: 'Gestión de pedidos',
      svgIcon: SvgIcons.ordersActive,
      category: NavigationCategory.designGuides,
    ),
  ];

  static const List<NavigationItem> uiComponents = [
    NavigationItem.svg(
      id: 'buttons',
      title: 'Botones',
      description: 'Sistema de botones interactivos',
      svgIcon: 'lib/src/icons/stroke/check.svg',
      category: NavigationCategory.uiComponents,
      content: ButtonsContent(),
    ),
    NavigationItem.svg(
      id: 'text-fields',
      title: 'Campos de texto',
      description: 'Campos de entrada de texto',
      svgIcon: 'lib/src/icons/stroke/plus_icon.svg',
      category: NavigationCategory.uiComponents,
      content: TextFieldsContent(),
    ),
    NavigationItem.svg(
      id: 'accordion',
      title: 'Acordeón',
      description: 'Componente de acordeón colapsable',
      svgIcon: 'lib/src/icons/stroke/arrow_down.svg',
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'action-bar',
      title: 'Action bar',
      description: 'Barra de acciones',
      svgIcon: SvgIcons.burgerMenu,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'alert',
      title: 'Alert',
      description: 'Alertas y notificaciones',
      svgIcon: 'lib/src/icons/stroke/alert_icon.svg',
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'autocomplete',
      title: 'Autocomplete search',
      description: 'Búsqueda con autocompletado',
      svgIcon: 'lib/src/icons/stroke/icon.svg',
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'avatar',
      title: 'Avatar',
      description: 'Avatares de usuario',
      svgIcon: 'lib/src/icons/filled/user_activo.svg',
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'badge',
      title: 'Badge',
      description: 'Badges y etiquetas',
      svgIcon: 'lib/src/icons/stroke/close.svg',
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'bulk-actions',
      title: 'Bulk actions',
      description: 'Acciones en lote',
      svgIcon: 'lib/src/icons/stroke/delete.svg',
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem.svg(
      id: 'breadcrumbs',
      title: 'Breadcrumbs',
      description: 'Navegación de migas de pan',
      svgIcon: 'lib/src/icons/stroke/arrow_left.svg',
      category: NavigationCategory.uiComponents,
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