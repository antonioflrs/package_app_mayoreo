import 'package:flutter/material.dart';

/// Biblioteca principal de iconos SVG de la aplicación
/// 
/// Esta clase organiza todos los iconos SVG personalizados de la aplicación
/// agrupándolos por categorías y funcionalidad.
class SvgIcons {
  SvgIcons._();

  // ============================================================================
  // ICONOS RESTANTES
  // ============================================================================
  
  /// B Toolkit Copia
  static const String bToolkitCopia = 'assets/icons/blife/b_toolkit_copia.svg';
  
  /// Icono de colores (BLife)
  static const String colors = 'assets/icons/blife/colors.svg';
  
  /// Icono de Flutter
  static const String iconFlutter = 'assets/icons/others/icon_flutter.svg';

  // ============================================================================
  // MAPEO A MATERIAL ICONS
  // ============================================================================
  
  /// Mapeo de iconos SVG a Material Icons equivalentes
  static const Map<String, IconData> _svgToMaterialIcons = {
    bToolkitCopia: Icons.widgets,
    colors: Icons.palette,
    iconFlutter: Icons.flutter_dash,
  };

  // ============================================================================
  // MÉTODOS DE UTILIDAD
  // ============================================================================
  
  /// Obtiene el Material Icon equivalente para un icono SVG
  static IconData? getMaterialIcon(String svgPath) {
    // Buscar por el nombre del archivo sin extensión
    final fileName = svgPath.split('/').last.replaceAll('.svg', '');
    
    // Buscar coincidencias en el mapeo
    for (final entry in _svgToMaterialIcons.entries) {
      final svgFileName = entry.key.split('/').last.replaceAll('.svg', '');
      if (svgFileName == fileName) {
        return entry.value;
      }
    }
    
    // Si no se encuentra, buscar por el path completo
    return _svgToMaterialIcons[svgPath];
  }
  
  /// Obtiene todos los iconos organizados por categoría
  static Map<String, List<String>> getAllIconsByCategory() {
    return {
      'Iconos Restantes': [bToolkitCopia, colors, iconFlutter],
      'BLife Icons': [colors],
      'Otros': [iconFlutter],
    };
  }
  
  /// Obtiene todos los iconos en una lista plana
  static List<String> getAllIcons() {
    return getAllIconsByCategory().values.expand((icons) => icons).toList();
  }
  
  /// Busca iconos por nombre
  static List<String> searchIcons(String query) {
    if (query.isEmpty) return getAllIcons();
    
    final lowercaseQuery = query.toLowerCase();
    final allIcons = getAllIconsByCategory();
    final results = <String>[];
    
    for (final entry in allIcons.entries) {
      if (entry.key.toLowerCase().contains(lowercaseQuery)) {
        results.addAll(entry.value);
      }
    }
    
    return results;
  }
  
  /// Obtiene iconos por tipo (filled, stroke, etc.)
  static List<String> getIconsByType(String type) {
    final allIcons = getAllIcons();
    return allIcons.where((icon) => icon.contains('/$type/')).toList();
  }
  
  /// Obtiene todos los Material Icons equivalentes organizados por categoría
  static Map<String, List<IconData>> getMaterialIconsByCategory() {
    final categories = getAllIconsByCategory();
    final materialCategories = <String, List<IconData>>{};
    
    for (final entry in categories.entries) {
      final materialIcons = <IconData>[];
      for (final svgPath in entry.value) {
        final materialIcon = getMaterialIcon(svgPath);
        if (materialIcon != null) {
          materialIcons.add(materialIcon);
        }
      }
      if (materialIcons.isNotEmpty) {
        materialCategories[entry.key] = materialIcons;
      }
    }
    
    return materialCategories;
  }
} 