import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../expandable_menu_item.dart';

/// Contenido de documentación para el widget ExpandableMenuItem
class ExpandableMenuItemContent extends StatelessWidget {
  const ExpandableMenuItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Expandable Menu Item',
      componentDescription: 'Widget de menú expandible personalizable con subcategorías, colores editables, iconos Material opcionales y dimensiones ajustables',
      examples: [
        ComponentExample(
          id: 'menu-basico',
          title: 'Menú básico',
          description: 'Menú simple sin iconos, con subcategorías básicas',
          previewWidget: ExpandableMenuItem(
            title: 'Categoría Principal',
            children: [
              SubcategoryItem(text: 'Subcategoría 1', onTap: () {}, isSelected: false, title: Text('Subcategoría 1')),
              SubcategoryItem(text: 'Subcategoría 2', onTap: () {}, isSelected: false, title: Text('Subcategoría 2')),
              SubcategoryItem(text: 'Subcategoría 3', onTap: () {}, isSelected: false, title: Text('Subcategoría 3')),
            ],
          ),
          codeExample: '''
ExpandableMenuItem(
  title: 'Categoría Principal',
  children: [
    SubcategoryItem(text: 'Subcategoría 1', onTap: () {}, title: Text('Subcategoría 1')),
    SubcategoryItem(text: 'Subcategoría 2', onTap: () {}, title: Text('Subcategoría 2')),
    SubcategoryItem(text: 'Subcategoría 3', onTap: () {}, title: Text('Subcategoría 3')),
  ],
)
          ''',
        ),
        ComponentExample(
          id: 'menu-con-iconos',
          title: 'Menú con iconos',
          description: 'Menú con iconos Material activo/inactivo y flechas de expansión',
          previewWidget: ExpandableMenuItem(
            title: 'Productos',
            activeIcon: Icons.category,
            inactiveIcon: Icons.category_outlined,
            children: [
              SubcategoryItem(text: 'Vitaminas', onTap: () {}, isSelected: false, title: Text('Vitaminas')),
              SubcategoryItem(text: 'Suplementos', onTap: () {}, isSelected: false, title: Text('Suplementos')),
              SubcategoryItem(text: 'Bienestar', onTap: () {}, isSelected: false, title: Text('Bienestar')),
            ],
          ),
          codeExample: '''
ExpandableMenuItem(
  title: 'Productos',
  activeIcon: Icons.category,
  inactiveIcon: Icons.category_outlined,
  children: [
    SubcategoryItem(text: 'Vitaminas', onTap: () {}, title: Text('Vitaminas')),
    SubcategoryItem(text: 'Suplementos', onTap: () {}, title: Text('Suplementos')),
    SubcategoryItem(text: 'Bienestar', onTap: () {}, title: Text('Bienestar')),
  ],
)
          ''',
        ),
        ComponentExample(
          id: 'menu-personalizado',
          title: 'Menú personalizado',
          description: 'Menú con colores personalizados, dimensiones específicas y callbacks',
          previewWidget: ExpandableMenuItem(
            title: 'Servicios Premium',
            activeIcon: Icons.star,
            inactiveIcon: Icons.star_outline,
            width: 300,
            mainHeight: 45,
            subcategoryHeight: 38,
            mainPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            subcategoryLeftPadding: 35,
            subcategorySpacing: 8,
            colors: ExpandableMenuItemColors.brandTheme(
              primaryColor: Colors.blue,
              secondaryColor: Colors.orange,
            ),
            onExpansionChanged: (isExpanded) => print('Menú ${isExpanded ? 'expandido' : 'colapsado'}'),
            onSubcategorySelected: (index, item) => print('Seleccionada: ${item.text}'),
            children: [
              SubcategoryItem(text: 'Consultoría', onTap: () {}, isSelected: false, title: Text('Consultoría')),
              SubcategoryItem(text: 'Capacitación', onTap: () {}, isSelected: false, title: Text('Capacitación')),
              SubcategoryItem(text: 'Soporte 24/7', onTap: () {}, isSelected: false, title: Text('Soporte 24/7')),
            ],
          ),
          codeExample: '''
ExpandableMenuItem(
  title: 'Servicios Premium',
  activeIcon: Icons.star,
  inactiveIcon: Icons.star_outline,
  width: 300,
  mainHeight: 45,
  subcategoryHeight: 38,
  mainPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  subcategoryLeftPadding: 35,
  subcategorySpacing: 8,
  colors: ExpandableMenuItemColors.brandTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.orange,
  ),
  onExpansionChanged: (isExpanded) => print('Menú expandido: \$isExpanded'),
  onSubcategorySelected: (index, item) => print('Seleccionada: \${item.text}'),
  children: [
    SubcategoryItem(text: 'Consultoría', onTap: () {}, title: Text('Consultoría')),
    SubcategoryItem(text: 'Capacitación', onTap: () {}, title: Text('Capacitación')),
    SubcategoryItem(text: 'Soporte 24/7', onTap: () {}, title: Text('Soporte 24/7')),
  ],
)
          ''',
        ),
        ComponentExample(
          id: 'menu-tema-oscuro',
          title: 'Menú con tema oscuro',
          description: 'Menú usando el esquema de colores oscuro predefinido',
          previewWidget: Container(
            color: AppColors.black,
            padding: EdgeInsets.all(16),
            child: ExpandableMenuItem(
              title: 'Configuración',
              colors: ExpandableMenuItemColors.darkTheme(),
              children: [
                SubcategoryItem(text: 'Perfil', onTap: () {}, isSelected: false, title: Text('Perfil')),
                SubcategoryItem(text: 'Notificaciones', onTap: () {}, isSelected: false, title: Text('Notificaciones')),
                SubcategoryItem(text: 'Privacidad', onTap: () {}, isSelected: false, title: Text('Privacidad')),
                SubcategoryItem(text: 'Seguridad', onTap: () {}, isSelected: false, title: Text('Seguridad')),
              ],
            ),
          ),
          codeExample: '''
ExpandableMenuItem(
  title: 'Configuración',
  colors: ExpandableMenuItemColors.darkTheme(),
  children: [
    SubcategoryItem(text: 'Perfil', onTap: () {}, title: Text('Perfil')),
    SubcategoryItem(text: 'Notificaciones', onTap: () {}, title: Text('Notificaciones')),
    SubcategoryItem(text: 'Privacidad', onTap: () {}, title: Text('Privacidad')),
    SubcategoryItem(text: 'Seguridad', onTap: () {}, title: Text('Seguridad')),
  ],
)
          ''',
        ),
      ],
    );
  }
}
