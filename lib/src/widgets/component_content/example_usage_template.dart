import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Ejemplo de uso del ComponentScreenTemplate
/// Muestra cómo implementar el template para cualquier componente
class ExampleUsageTemplate extends StatelessWidget {
  const ExampleUsageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      // Ejemplos del componente
      examples: [
        ComponentExample(
          id: 'basic_usage',
          title: 'Uso Básico',
          description: 'Implementación básica del componente con configuración mínima.',
          previewWidget: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Vista previa del componente'),
          ),
          codeExample: '''// Ejemplo de código básico
ExampleComponent(
  title: 'Mi Componente',
  onTap: () => print('Componente tocado'),
)''',
        ),
        
        ComponentExample(
          id: 'advanced_usage',
          title: 'Uso Avanzado',
          description: 'Implementación avanzada con todas las opciones disponibles.',
          previewWidget: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.orangeBrand.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.orangeBrand),
            ),
            child: const Text('Vista previa avanzada'),
          ),
          codeExample: '''// Ejemplo de código avanzado
ExampleComponent(
  title: 'Mi Componente Avanzado',
  subtitle: 'Con subtítulo',
  icon: Icons.star,
  onTap: () => print('Componente avanzado tocado'),
  style: ExampleComponentStyle.elevated,
)''',
        ),
      ],
      
      // Propiedades del componente
      properties: [
        ComponentProperty(
          name: 'title',
          type: 'String',
          description: 'Título principal del componente que se mostrará al usuario.',
          required: true,
        ),
        ComponentProperty(
          name: 'subtitle',
          type: 'String?',
          description: 'Subtítulo opcional que proporciona información adicional.',
          required: false,
        ),
        ComponentProperty(
          name: 'icon',
          type: 'IconData?',
          description: 'Icono opcional que se mostrará junto al título.',
          required: false,
        ),
        ComponentProperty(
          name: 'onTap',
          type: 'VoidCallback?',
          description: 'Función callback que se ejecuta cuando se toca el componente.',
          required: false,
        ),
        ComponentProperty(
          name: 'style',
          type: 'ExampleComponentStyle',
          description: 'Estilo visual del componente que determina su apariencia.',
          required: false,
          defaultValue: 'ExampleComponentStyle.flat',
        ),
      ],
      
      // Métodos del componente
      methods: [
        ComponentMethod(
          name: 'build',
          returnType: 'Widget',
          description: 'Construye y retorna el widget del componente.',
          parameters: ['BuildContext context'],
        ),
        ComponentMethod(
          name: 'dispose',
          returnType: 'void',
          description: 'Limpia los recursos utilizados por el componente.',
          parameters: [],
        ),
        ComponentMethod(
          name: 'setState',
          returnType: 'void',
          description: 'Marca el widget para reconstruirse y notifica al framework.',
          parameters: ['VoidCallback fn'],
        ),
      ],
      
      // Notas de uso
      usageNotes: '''
• Este componente debe usarse dentro de un Scaffold o similar para funcionar correctamente.
• El callback onTap es opcional pero recomendado para interactividad.
• El estilo por defecto es 'flat', pero puede cambiarse según las necesidades del diseño.
• Asegúrate de que el título no sea muy largo para evitar problemas de layout.
• Para casos de uso avanzados, considera usar el estilo 'elevated' con sombras.
      ''',
    );
  }
}

/// Enum de ejemplo para mostrar tipos
enum ExampleComponentStyle {
  flat,
  elevated,
  outlined,
}
