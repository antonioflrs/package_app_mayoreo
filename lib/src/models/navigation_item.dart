import 'package:flutter/material.dart';

enum NavigationCategory {
  designGuides,
  uiComponents,
}

enum IconType {
  material,  // IconData de Material Icons
  svg,       // String path para iconos SVG
}

class NavigationItem {
  final String id;
  final String title;
  final String description;
  final IconData? icon;           // Icono de Material (opcional)
  final String? svgIcon;          // Path del icono SVG (opcional)
  final IconType iconType;        // Tipo de icono
  final NavigationCategory category;
  final Widget? content;
  final String? codeExample;
  final Map<String, dynamic>? properties;

  const NavigationItem({
    required this.id,
    required this.title,
    required this.description,
    this.icon,
    this.svgIcon,
    required this.iconType,
    required this.category,
    this.content,
    this.codeExample,
    this.properties,
  });

  /// Constructor para iconos de Material
  const NavigationItem.material({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    this.content,
    this.codeExample,
    this.properties,
  }) : svgIcon = null,
       iconType = IconType.material;

  /// Constructor para iconos SVG
  const NavigationItem.svg({
    required this.id,
    required this.title,
    required this.description,
    required this.svgIcon,
    required this.category,
    this.content,
    this.codeExample,
    this.properties,
  }) : icon = null,
       iconType = IconType.svg;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigationItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'NavigationItem(id: $id, title: $title)';
} 