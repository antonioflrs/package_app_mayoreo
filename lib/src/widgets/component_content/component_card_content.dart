import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ComponentCardContent extends StatelessWidget {
  const ComponentCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      examples: [
        ComponentExample(
          id: 'basic_card',
          title: 'Uso básico',
          description: 'Card con título, descripción, icono y badge de categoría. Incluye CTA.',
          previewWidget: _PreviewBasic(),
          codeExample: '''ComponentCard(
  component: NavigationItem.material(
    id: 'buttons',
    title: 'Botones',
    description: 'Sistema de botones interactivos',
    icon: Icons.touch_app,
    category: NavigationCategory.uiComponents,
  ),
  onTap: () {},
  ctaText: 'Ver Detalles',
  showCtaButton: true,
)''',
        ),
        ComponentExample(
          id: 'without_cta',
          title: 'Card sin botón CTA',
          description: 'Para listados donde el tap en toda el área ya navega.',
          previewWidget: _PreviewWithoutCta(),
          codeExample: '''ComponentCard(
  component: NavigationItem.material(
    id: 'typography',
    title: 'Tipografía',
    description: 'Sistema de tipografía que utiliza la fuente Inter con diferentes pesos y tamaños para crear una jerarquía visual clara',
    icon: Icons.text_fields,
    category: NavigationCategory.designGuides,
  ),
  onTap: () {},
  showCtaButton: false,
)''',
        ),
      ],
      properties: const [
        ComponentProperty(
          name: 'component',
          type: 'NavigationItem',
          description: 'Modelo del componente a representar (título, descripción, icono, categoría).',
          required: true,
        ),
        ComponentProperty(
          name: 'onTap',
          type: 'VoidCallback?',
          description: 'Callback al tocar la card o el botón CTA.',
        ),
        ComponentProperty(
          name: 'ctaText',
          type: 'String',
          description: 'Texto del botón de llamada a la acción.',
          defaultValue: 'Ver Detalles',
        ),
        ComponentProperty(
          name: 'showCtaButton',
          type: 'bool',
          description: 'Si muestra o no el botón CTA inferior.',
          defaultValue: 'true',
        ),
      ],
      methods: const [],
      usageNotes: 'Use ComponentCard en grillas (childAspectRatio ≈ 0.85) o listas. Para iconos SVG, configure NavigationItem.svg y se renderiza con SafeSvgIcon.',
    );
  }
}

class _PreviewBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 220,
      child: ComponentCard(
        component: const NavigationItem.material(
          id: 'buttons',
          title: 'Botones',
          description: 'Sistema de botones interactivos',
          icon: Icons.touch_app,
          category: NavigationCategory.uiComponents,
        ),
        onTap: () {},
      ),
    );
  }
}

class _PreviewWithoutCta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 200,
      child: ComponentCard(
        component: const NavigationItem.material(
          id: 'typography',
          title: 'Tipografía',
          description: 'Sistema de tipografía que utiliza la fuente Inter con diferentes pesos y tamaños para crear una jerarquía visual clara',
          icon: Icons.text_fields,
          category: NavigationCategory.designGuides,
        ),
        onTap: () {},
        showCtaButton: false,
      ),
    );
  }
}


