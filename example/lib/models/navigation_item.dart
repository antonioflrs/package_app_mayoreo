import 'package:flutter/material.dart';

enum NavigationCategory {
  designGuides,
  uiComponents,
}

class NavigationItem {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final NavigationCategory category;
  final Widget? content;
  final String? codeExample;
  final Map<String, dynamic>? properties;

  const NavigationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    this.content,
    this.codeExample,
    this.properties,
  });

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