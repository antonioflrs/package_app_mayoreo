import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SearchBarContent extends StatelessWidget {
  const SearchBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      examples: [
        ComponentExample(
          id: 'basic_usage',
          title: 'Uso Básico',
          description: 'Barra de búsqueda con funcionalidad básica y controlador de texto.',
          previewWidget: SearchBarWidget(
            onChanged: (query) {
              // Handle search query
            },
          ),
          codeExample: '''SearchBarWidget(
  controller: _searchController,
  onChanged: (query) {
    // Handle search query
    print('Searching for: \$query');
  },
)''',
        ),
        
        ComponentExample(
          id: 'custom_hint',
          title: 'Con Texto de Ayuda Personalizado',
          description: 'Barra de búsqueda con texto de ayuda específico para el contexto de la aplicación.',
          previewWidget: SearchBarWidget(
            hintText: 'Buscar productos, categorías...',
            onChanged: (query) {
              // Handle search query
            },
          ),
          codeExample: '''SearchBarWidget(
  hintText: 'Buscar productos, categorías...',
  onChanged: (query) {
    print('Searching with custom hint: \$query');
  },
)''',
        ),
        
        ComponentExample(
          id: 'disabled_state',
          title: 'Estado Deshabilitado',
          description: 'Barra de búsqueda en estado deshabilitado para cuando la funcionalidad no está disponible.',
          previewWidget: SearchBarWidget(
            hintText: 'Búsqueda deshabilitada',
            enabled: false,
            onChanged: (query) {
              // This won't be called when disabled
            },
          ),
          codeExample: '''SearchBarWidget(
  hintText: 'Búsqueda deshabilitada',
  enabled: false,
  onChanged: (query) {
    // This won't be called when disabled
  },
)''',
        ),
        
        ComponentExample(
          id: 'custom_margin',
          title: 'Con Márgenes Personalizados',
          description: 'Barra de búsqueda con márgenes específicos para ajustar el espaciado según el diseño.',
          previewWidget: SearchBarWidget(
            hintText: 'Buscar con márgenes...',
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            onChanged: (query) {
              // Handle search query
            },
          ),
          codeExample: '''SearchBarWidget(
  hintText: 'Buscar con márgenes...',
  margin: EdgeInsets.symmetric(
    horizontal: 8.0, 
    vertical: 4.0
  ),
  onChanged: (query) {
    print('Searching with custom margin: \$query');
  },
)''',
        ),
      ],
      
      properties: [
        ComponentProperty(
          name: 'controller',
          type: 'TextEditingController?',
          description: 'Controlador de texto para manejar el estado del campo de búsqueda.',
          required: false,
        ),
        ComponentProperty(
          name: 'hintText',
          type: 'String?',
          description: 'Texto de ayuda que se muestra cuando el campo está vacío.',
          required: false,
          defaultValue: 'Buscar...',
        ),
        ComponentProperty(
          name: 'onChanged',
          type: 'ValueChanged<String>?',
          description: 'Callback que se ejecuta cuando cambia el texto de búsqueda.',
          required: false,
        ),
        ComponentProperty(
          name: 'enabled',
          type: 'bool',
          description: 'Determina si la barra de búsqueda está habilitada para interacción.',
          required: false,
          defaultValue: 'true',
        ),
        ComponentProperty(
          name: 'margin',
          type: 'EdgeInsets?',
          description: 'Márgenes externos de la barra de búsqueda.',
          required: false,
        ),
        ComponentProperty(
          name: 'decoration',
          type: 'InputDecoration?',
          description: 'Decoración personalizada para el campo de entrada.',
          required: false,
        ),
      ],
      
      methods: [
        ComponentMethod(
          name: 'build',
          returnType: 'Widget',
          description: 'Construye y retorna el widget de la barra de búsqueda.',
          parameters: ['BuildContext context'],
        ),
        ComponentMethod(
          name: 'dispose',
          returnType: 'void',
          description: 'Limpia los recursos del controlador de texto.',
          parameters: [],
        ),
        ComponentMethod(
          name: 'setState',
          returnType: 'void',
          description: 'Marca el widget para reconstruirse cuando cambia el estado.',
          parameters: ['VoidCallback fn'],
        ),
      ],
      
      usageNotes: '''
• **Controlador**: Usar un TextEditingController para manejar el estado del campo de búsqueda.
• **Callback onChanged**: Implementar lógica de búsqueda en tiempo real o con debounce.
• **Hint Text**: Proporcionar texto de ayuda contextual para mejorar la UX.
• **Estado Deshabilitado**: Usar cuando la funcionalidad de búsqueda no esté disponible.
• **Márgenes**: Ajustar según el diseño y espaciado de la interfaz.
• **Decoración**: Personalizar la apariencia visual según las necesidades del diseño.
• **Responsive**: El widget se adapta automáticamente a diferentes tamaños de pantalla.
      ''',
    );
  }
}
