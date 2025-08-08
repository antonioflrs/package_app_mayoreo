import 'package:flutter/material.dart';
import 'navigation_item.dart';

enum SearchResultType {
  component,
  token,
  icon,
  color,
  typography,
}

class SearchResult {
  final String id;
  final String title;
  final String description;
  final SearchResultType type;
  final IconData? icon;
  final String? iconPath;
  final VoidCallback? onTap;
  final String? category;
  final String? subcategory;
  
  // Campos adicionales para navegación
  final NavigationItem? navigationItem;
  final String? navigationType; // 'component', 'icons', 'colors', 'typography'

  const SearchResult({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.icon,
    this.iconPath,
    this.onTap,
    this.category,
    this.subcategory,
    this.navigationItem,
    this.navigationType,
  });

  factory SearchResult.fromNavigationItem(NavigationItem item, VoidCallback onTap) {
    return SearchResult(
      id: item.id,
      title: item.title,
      description: item.description,
      type: item.category == NavigationCategory.designGuides 
          ? SearchResultType.token 
          : SearchResultType.component,
      icon: item.icon,
      iconPath: item.svgIcon,
      onTap: onTap,
      category: item.category.name,
      navigationItem: item,
      navigationType: 'component',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchResult && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'SearchResult(id: $id, title: $title, type: $type)';
}
