import 'package:flutter/material.dart';
import '../models/search_result.dart';
import '../models/navigation_item.dart';
import '../data/design_system_data.dart';

class SearchService {
  static List<SearchResult> search(String query, BuildContext context) {
    if (query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    final results = <SearchResult>[];

    // Buscar en componentes de navegación
    final navigationItems = DesignSystemData.getAllItems();
    for (final item in navigationItems) {
      if (_matchesQuery(item.title, lowercaseQuery) || 
          _matchesQuery(item.description, lowercaseQuery)) {
        
        results.add(SearchResult.fromNavigationItem(
          item,
          () => _navigateToItem(item, context),
        ));
      }
    }

    // Buscar en tokens de colores
    _addColorTokens(results, lowercaseQuery, context);

    // Buscar en tokens de tipografía
    _addTypographyTokens(results, lowercaseQuery, context);

    // Buscar en iconos del package
    _addIconTokens(results, lowercaseQuery, context);

    // Ordenar resultados por relevancia
    results.sort((a, b) {
      final aScore = _calculateRelevanceScore(a, lowercaseQuery);
      final bScore = _calculateRelevanceScore(b, lowercaseQuery);
      return bScore.compareTo(aScore);
    });

    return results;
  }

  static bool _matchesQuery(String text, String query) {
    return text.toLowerCase().contains(query);
  }

  static int _calculateRelevanceScore(SearchResult result, String query) {
    int score = 0;
    
    // Priorizar coincidencias en el título
    if (result.title.toLowerCase().contains(query)) {
      score += 10;
      // Bonus si coincide al inicio
      if (result.title.toLowerCase().startsWith(query)) {
        score += 5;
      }
    }
    
    // Coincidencias en descripción
    if (result.description.toLowerCase().contains(query)) {
      score += 5;
    }
    
    // Priorizar componentes sobre tokens
    if (result.type == SearchResultType.component) {
      score += 2;
    }
    
    return score;
  }

  static void _addColorTokens(List<SearchResult> results, String query, BuildContext context) {
    final colorTokens = [
      'AppColors.black',
      'AppColors.white',
      'AppColors.orangeBrand',
      'AppColors.backCards',
      'AppColors.silverGrayMedium',
      'AppColors.grayMedium',
      'AppColors.darkGray',
      'AppColors.warmGray',
    ];

    for (final colorToken in colorTokens) {
      if (_matchesQuery(colorToken, query)) {
        results.add(SearchResult(
          id: 'color_$colorToken',
          title: colorToken,
          description: 'Token de color del sistema de diseño',
          type: SearchResultType.color,
          icon: Icons.palette,
          onTap: () => _navigateToColors(context),
          category: 'Tokens',
          subcategory: 'Colores',
          navigationType: 'colors',
        ));
      }
    }
  }

  static void _addTypographyTokens(List<SearchResult> results, String query, BuildContext context) {
    final typographyTokens = [
      'AppTypography.headlineLarge',
      'AppTypography.headlineMedium',
      'AppTypography.headlineSmall',
      'AppTypography.titleLarge',
      'AppTypography.titleMedium',
      'AppTypography.titleSmall',
      'AppTypography.bodyLarge',
      'AppTypography.bodyMedium',
      'AppTypography.bodySmall',
      'AppTypography.labelLarge',
      'AppTypography.labelMedium',
      'AppTypography.labelSmall',
    ];

    for (final typographyToken in typographyTokens) {
      if (_matchesQuery(typographyToken, query)) {
        results.add(SearchResult(
          id: 'typography_$typographyToken',
          title: typographyToken,
          description: 'Token de tipografía del sistema de diseño',
          type: SearchResultType.typography,
          icon: Icons.text_fields,
          onTap: () => _navigateToTypography(context),
          category: 'Tokens',
          subcategory: 'Tipografía',
          navigationType: 'typography',
        ));
      }
    }
  }

  static void _addIconTokens(List<SearchResult> results, String query, BuildContext context) {
    final iconTokens = [
      'PackageIcons.bToolkitCopia',
      'PackageIcons.iconFlutter',
      'PackageIcons.searchIcon',
    ];

    for (final iconToken in iconTokens) {
      if (_matchesQuery(iconToken, query)) {
        results.add(SearchResult(
          id: 'icon_$iconToken',
          title: iconToken,
          description: 'Icono del package',
          type: SearchResultType.icon,
          icon: Icons.style,
          onTap: () => _navigateToIcons(context),
          category: 'Tokens',
          subcategory: 'Iconos',
          navigationType: 'icons',
        ));
      }
    }
  }

  static void _navigateToItem(NavigationItem item, BuildContext context) {
    // La navegación se maneja en el SearchResultsWidget
    // Aquí solo creamos el SearchResult con la información necesaria
  }

  static void _navigateToColors(BuildContext context) {
    // La navegación se maneja en el SearchResultsWidget
    // Aquí solo creamos el SearchResult con la información necesaria
  }

  static void _navigateToTypography(BuildContext context) {
    // La navegación se maneja en el SearchResultsWidget
    // Aquí solo creamos el SearchResult con la información necesaria
  }

  static void _navigateToIcons(BuildContext context) {
    // La navegación se maneja en el SearchResultsWidget
    // Aquí solo creamos el SearchResult con la información necesaria
  }
}
