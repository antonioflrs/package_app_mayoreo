import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../screens/component_detail_screen.dart';
import '../screens/icons_screen.dart';

/// Servicio de navegación para resultados de búsqueda
/// 
/// Este servicio maneja la navegación desde los resultados de búsqueda
/// a las pantallas correspondientes de la aplicación.
/// 
/// Ejemplo de uso:
/// ```dart
/// SearchNavigationService.navigateToSearchResult(searchResult, context);
/// ```
class SearchNavigationService {
  /// Navega al resultado de búsqueda correspondiente
  /// 
  /// [result] - El resultado de búsqueda seleccionado
  /// [context] - El contexto de navegación
  static void navigateToSearchResult(SearchResult result, BuildContext context) {
    try {
      switch (result.navigationType) {
        case 'component':
          _navigateToComponent(result, context);
          break;
        case 'icons':
          _navigateToIcons(context);
          break;
        case 'colors':
          _navigateToColors(context);
          break;
        case 'typography':
          _navigateToTypography(context);
          break;
        default:
          _navigateToDefault(result, context);
          break;
      }
    } catch (e) {
      _showErrorSnackBar(context, 'Error al navegar: $e');
    }
  }

  /// Navega a un componente específico
  static void _navigateToComponent(SearchResult result, BuildContext context) {
    if (result.navigationItem != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ComponentDetailScreen(component: result.navigationItem!),
        ),
      );
    }
  }

  /// Navega a la pantalla de iconos
  static void _navigateToIcons(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const IconsScreen(),
      ),
    );
  }

  /// Navega a la pantalla de colores
  static void _navigateToColors(BuildContext context) {
    final colorItem = _createColorNavigationItem();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ComponentDetailScreen(component: colorItem),
      ),
    );
  }

  /// Navega a la pantalla de tipografía
  static void _navigateToTypography(BuildContext context) {
    final typographyItem = _createTypographyNavigationItem();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ComponentDetailScreen(component: typographyItem),
      ),
    );
  }

  /// Navegación por defecto usando el callback onTap
  static void _navigateToDefault(SearchResult result, BuildContext context) {
    result.onTap?.call();
  }

  /// Crea un NavigationItem para colores
  static NavigationItem _createColorNavigationItem() {
    return NavigationItem(
      id: 'colors_section',
      title: 'Tokens de Color',
      description: 'Paleta de colores del sistema de diseño',
      iconType: IconType.material,
      icon: Icons.palette,
      category: NavigationCategory.designGuides,
    );
  }

  /// Crea un NavigationItem para tipografía
  static NavigationItem _createTypographyNavigationItem() {
    return NavigationItem(
      id: 'typography_section',
      title: 'Tokens de Tipografía',
      description: 'Sistema de tipografía del diseño',
      iconType: IconType.material,
      icon: Icons.text_fields,
      category: NavigationCategory.designGuides,
    );
  }

  /// Muestra un SnackBar de error
  static void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
