import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../product_tabs_widget.dart';

/// Contenido de documentación para el widget ProductTabsWidget
class ProductTabsWidgetContent extends StatelessWidget {
  const ProductTabsWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Product Tabs Widget',
      componentDescription:
          'Widget de pestañas de producto dinámico y personalizable con múltiples configuraciones',
      examples: [
        ComponentExample(
          id: 'tabs-basico',
          title: 'Widget básico',
          description:
              'Widget completamente personalizable con pestañas personalizadas',
          previewWidget: ProductTabsWidget(
            tabs: [
              ProductTab(
                title: 'PESTAÑA 1',
                content: 'Contenido de la primera pestaña',
              ),
              ProductTab(
                title: 'PESTAÑA 2',
                content: 'Contenido de la segunda pestaña',
              ),
            ],
          ),
          codeExample: '''
ProductTabsWidget(
  tabs: [
    ProductTab(title: 'PESTAÑA 1', content: 'Contenido de la primera pestaña'),
    ProductTab(title: 'PESTAÑA 2', content: 'Contenido de la segunda pestaña'),
  ],
)
          ''',
        ),

        ComponentExample(
          id: 'tabs-wellness',
          title: 'Widget 3 options',
          description: 'Widget con tres pestañas de opciones',
          previewWidget: ProductTabsWidgetWellness(
            descripcion: 'Producto natural para el bienestar',
            beneficios: 'Mejora la salud y vitalidad',
            contraindicaciones: 'Consultar con médico si está embarazada',
          ),
          codeExample: '''
ProductTabsWidgetWellness(
  descripcion: 'Producto natural para el bienestar',
  beneficios: 'Mejora la salud y vitalidad',
  contraindicaciones: 'Consultar con médico si está embarazada',
)
          ''',
        ),

        ComponentExample(
          id: 'tabs-cosmetic-personalizado',
          title: 'Widget Cosmetic Personalizado',
          description:
              'Producto cosmético con colores y estilos personalizados',
          previewWidget: ProductTabsWidgetCosmetic(
            aplicacion:
                'Aplicar sobre la piel limpia y seca. Usar por la mañana y noche.',
            ingredientes:
                'Agua purificada, glicerina vegetal, extracto de aloe vera, vitamina E, aceite de jojoba.',
            precauciones:
                'Evitar contacto con los ojos. No usar en piel irritada o con heridas abiertas.',
            backgroundColor: const Color(0xFFF8F9FA),
            activeTabBorderColor: const Color(0xFFE91E63),
            activeTabTextColor: const Color(0xFFE91E63),
            inactiveTabBackgroundColor: Colors.white,
            inactiveTabBorderColor: const Color(0xFFE0E0E0),
            inactiveTabTextColor: const Color(0xFF757575),
            contentTextColor: const Color(0xFF424242),
            disclaimerTextColor: const Color(0xFF9E9E9E),
            borderRadius: 16.0,
            tabPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            contentPadding: const EdgeInsets.all(24),
            tabFontSize: 13.0,
            contentFontSize: 14.0,
            disclaimerFontSize: 12.0,
          ),
          codeExample: '''
ProductTabsWidgetCosmetic(
  aplicacion: 'Aplicar sobre la piel limpia y seca. Usar por la mañana y noche.',
  ingredientes: 'Agua purificada, glicerina vegetal, extracto de aloe vera, vitamina E, aceite de jojoba.',
  precauciones: 'Evitar contacto con los ojos. No usar en piel irritada o con heridas abiertas.',
  backgroundColor: const Color(0xFFF8F9FA),
  activeTabBorderColor: const Color(0xFFE91E63),
  activeTabTextColor: const Color(0xFFE91E63),
  inactiveTabBackgroundColor: Colors.white,
  inactiveTabBorderColor: const Color(0xFFE0E0E0),
  inactiveTabTextColor: const Color(0xFF757575),
  contentTextColor: const Color(0xFF424242),
  disclaimerTextColor: const Color(0xFF9E9E9E),
  borderRadius: 16.0,
  tabPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
  contentPadding: const EdgeInsets.all(24),
  tabFontSize: 15.0,
  contentFontSize: 14.0,
  disclaimerFontSize: 12.0,
)
          ''',
        ),
      ],
    );
  }
}
