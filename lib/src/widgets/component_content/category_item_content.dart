import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../category_item.dart';

/// Contenido de documentación para el widget CategoryItem
class CategoryItemContent extends StatelessWidget {
  const CategoryItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Category Item',
      componentDescription: 'Widget de elemento de categoría con tres variantes: básico, con icono y colorido',
      examples: [
        ComponentExample(
          id: 'category-basica',
          title: 'Variante básica',
          description: 'Solo texto, sin iconos ni colores especiales',
          previewWidget: CategoryItem(
            title: 'Mi Categoría',
            variant: CategoryItemVariant.basic,
            onTap: () {},
          ),
          codeExample: '''
CategoryItem(
  title: 'Mi Categoría',
  variant: CategoryItemVariant.basic,
  onTap: () {},
)
          ''',
        ),
        ComponentExample(
          id: 'category-con-icono',
          title: 'Variante con icono',
          description: 'Incluye iconos SVG activo/inactivo',
          previewWidget: CategoryItem(
            title: 'Con Icono',
            activeIconPath: 'assets/icons/active.svg',
            inactiveIconPath: 'assets/icons/inactive.svg',
            variant: CategoryItemVariant.withIcon,
            onTap: () {},
          ),
          codeExample: '''
CategoryItem(
  title: 'Con Icono',
  activeIconPath: 'assets/icons/active.svg',
  inactiveIconPath: 'assets/icons/inactive.svg',
  variant: CategoryItemVariant.withIcon,
  onTap: () {},
)
          ''',
        ),
        ComponentExample(
          id: 'category-colorida',
          title: 'Variante colorida',
          description: 'Cambia colores entre estados, incluye iconos y flecha',
          previewWidget: CategoryItem(
            title: 'Colorida',
            activeIconPath: 'assets/icons/active.svg',
            inactiveIconPath: 'assets/icons/inactive.svg',
            variant: CategoryItemVariant.colorful,
            initialSelected: true,
            onTap: () {},
          ),
          codeExample: '''
CategoryItem(
  title: 'Colorida',
  activeIconPath: 'assets/icons/active.svg',
  inactiveIconPath: 'assets/icons/inactive.svg',
  variant: CategoryItemVariant.colorful,
  initialSelected: true,
  onTap: () {},
)
          ''',
        ),
      ],
    );
  }
}
