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

class DesignSystemData {
  static const List<NavigationItem> designGuides = [
    NavigationItem(
      id: 'colors',
      title: 'Paleta de colores',
      description: 'Colores del sistema de diseño',
      icon: Icons.palette,
      category: NavigationCategory.designGuides,
      content: ColorsContent(),
    ),
    NavigationItem(
      id: 'typography',
      title: 'Tipografía',
      description: 'Sistema de tipografía con Inter',
      icon: Icons.text_fields,
      category: NavigationCategory.designGuides,
      content: TypographyContent(),
    ),
    NavigationItem(
      id: 'shadows',
      title: 'Sombras',
      description: 'Sistema de sombras y elevación',
      icon: Icons.visibility,
      category: NavigationCategory.designGuides,
      content: ShadowsContent(),
    ),
    NavigationItem(
      id: 'spacing',
      title: 'Espaciado',
      description: 'Sistema de espaciado y márgenes',
      icon: Icons.space_bar,
      category: NavigationCategory.designGuides,
      content: SpacingContent(),
    ),
    NavigationItem(
      id: 'radii',
      title: 'Radios',
      description: 'Sistema de bordes redondeados',
      icon: Icons.rounded_corner,
      category: NavigationCategory.designGuides,
      content: RadiiContent(),
    ),
    NavigationItem(
      id: 'breakpoints',
      title: 'Breakpoints',
      description: 'Puntos de quiebre responsivos',
      icon: Icons.view_week,
      category: NavigationCategory.designGuides,
      content: BreakpointsContent(),
    ),
    NavigationItem(
      id: 'z-index',
      title: 'Z Index',
      description: 'Sistema de capas y profundidad',
      icon: Icons.layers,
      category: NavigationCategory.designGuides,
      content: ZIndexContent(),
    ),
  ];

  static const List<NavigationItem> uiComponents = [
    NavigationItem(
      id: 'buttons',
      title: 'Botones',
      description: 'Sistema de botones interactivos',
      icon: Icons.smart_button,
      category: NavigationCategory.uiComponents,
      content: ButtonsContent(),
    ),
    NavigationItem(
      id: 'text-fields',
      title: 'Campos de texto',
      description: 'Campos de entrada de texto',
      icon: Icons.input,
      category: NavigationCategory.uiComponents,
      content: TextFieldsContent(),
    ),
    NavigationItem(
      id: 'accordion',
      title: 'Acordeón',
      description: 'Componente de acordeón colapsable',
      icon: Icons.expand_more,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'action-bar',
      title: 'Action bar',
      description: 'Barra de acciones',
      icon: Icons.menu,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'alert',
      title: 'Alert',
      description: 'Alertas y notificaciones',
      icon: Icons.warning,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'autocomplete',
      title: 'Autocomplete search',
      description: 'Búsqueda con autocompletado',
      icon: Icons.search,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'avatar',
      title: 'Avatar',
      description: 'Avatares de usuario',
      icon: Icons.person,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'badge',
      title: 'Badge',
      description: 'Badges y etiquetas',
      icon: Icons.label,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'bulk-actions',
      title: 'Bulk actions',
      description: 'Acciones en lote',
      icon: Icons.select_all,
      category: NavigationCategory.uiComponents,
    ),
    NavigationItem(
      id: 'breadcrumbs',
      title: 'Breadcrumbs',
      description: 'Navegación de migas de pan',
      icon: Icons.navigation,
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