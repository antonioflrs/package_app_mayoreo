import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class TypographyContent extends StatelessWidget {
  const TypographyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Tipografía',
      componentDescription: 'Sistema de tipografía que utiliza la fuente Inter con diferentes pesos y tamaños para crear una jerarquía visual clara',
      examples: [
        ComponentExample(
          id: 'typography-usage',
          title: 'Uso de Tipografía',
          description: 'Los estilos de tipografía se aplican mediante el ThemeData siguiendo esta sintaxis',
          previewWidget: _buildTypographyUsagePreview(),
          codeExample: _getTypographyUsageCode(),
        ),
        ComponentExample(
          id: 'typography-import',
          title: 'Importación',
          description: 'La tipografía se configura automáticamente al usar el tema del paquete',
          previewWidget: _buildTypographyImportPreview(),
          codeExample: _getTypographyImportCode(),
        ),
        ComponentExample(
          id: 'typography-tokens',
          title: 'Tokens de Tipografía',
          description: 'Lista completa de estilos de tipografía disponibles en el sistema',
          previewWidget: _buildTypographyTokensPreview(),
          codeExample: _getTypographyTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'displayLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para títulos principales muy grandes',
          required: false,
        ),
        ComponentProperty(
          name: 'displayMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para títulos principales medianos',
          required: false,
        ),
        ComponentProperty(
          name: 'displaySmall',
          type: 'TextStyle',
          description: 'Estilo de texto para títulos principales pequeños',
          required: false,
        ),
        ComponentProperty(
          name: 'headlineLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para encabezados grandes',
          required: false,
        ),
        ComponentProperty(
          name: 'headlineMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para encabezados medianos',
          required: false,
        ),
        ComponentProperty(
          name: 'headlineSmall',
          type: 'TextStyle',
          description: 'Estilo de texto para encabezados pequeños',
          required: false,
        ),
        ComponentProperty(
          name: 'titleLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para títulos de sección grandes',
          required: false,
        ),
        ComponentProperty(
          name: 'titleMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para títulos de sección medianos',
          required: false,
        ),
        ComponentProperty(
          name: 'titleSmall',
          type: 'TextStyle',
          description: 'Estilo de texto para títulos de sección pequeños',
          required: false,
        ),
        ComponentProperty(
          name: 'bodyLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para contenido principal grande',
          required: false,
        ),
        ComponentProperty(
          name: 'bodyMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para contenido principal mediano',
          required: false,
        ),
        ComponentProperty(
          name: 'bodySmall',
          type: 'TextStyle',
          description: 'Estilo de texto para contenido principal pequeño',
          required: false,
        ),
        ComponentProperty(
          name: 'labelLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para etiquetas grandes',
          required: false,
        ),
        ComponentProperty(
          name: 'labelMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para etiquetas medianas',
          required: false,
        ),
        ComponentProperty(
          name: 'labelSmall',
          type: 'TextStyle',
          description: 'Estilo de texto para etiquetas pequeñas',
          required: false,
        ),
      ],
      usageNotes: 'La tipografía utiliza la fuente Inter con pesos variables (wght) de 100 a 900. Los estilos se organizan en jerarquías: display (títulos principales), headline (encabezados), title (títulos de sección), body (contenido principal) y label (etiquetas). Usa los estilos apropiados para mantener la consistencia visual.',
    );
  }

  Widget _buildTypographyUsagePreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sintaxis:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Theme.of(context).textTheme.[estilo]',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              color: AppColors.orangeBrand,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ejemplo:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Mi texto',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.orangeBrand,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyImportPreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configuración automática:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 12,
              color: AppColors.greenFree,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'El tema incluye la tipografía automáticamente:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'MaterialApp(theme: AppTheme.lightTheme)',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 12,
              color: AppColors.orangeBrand,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyTokensPreview() {
    final sampleStyles = [
      {'name': 'displayLarge', 'style': TextStyle(fontSize: 57, fontWeight: FontWeight.w400)},
      {'name': 'headlineLarge', 'style': TextStyle(fontSize: 32, fontWeight: FontWeight.w400)},
      {'name': 'titleLarge', 'style': TextStyle(fontSize: 22, fontWeight: FontWeight.w400)},
      {'name': 'bodyLarge', 'style': TextStyle(fontSize: 16, fontWeight: FontWeight.w400)},
      {'name': 'labelMedium', 'style': TextStyle(fontSize: 12, fontWeight: FontWeight.w500)},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estilos disponibles:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleStyles.map((style) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Text(
                  style['name'] as String,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Texto de ejemplo',
                    style: (style['style'] as TextStyle).copyWith(
                      color: AppColors.orangeBrand,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  String _getTypographyUsageCode() {
    return '''// Sintaxis
Theme.of(context).textTheme.[estilo]

// Ejemplo
Text(
  'Mi texto',
  style: theme.textTheme.headlineLarge,
)''';
  }

  String _getTypographyImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// El tema incluye la tipografía automáticamente
MaterialApp(
  theme: AppTheme.lightTheme,
  // ...
)''';
  }

  String _getTypographyTokensCode() {
    return '''// Estilos de display (títulos principales)
theme.textTheme.displayLarge    // 57px, w400
theme.textTheme.displayMedium   // 45px, w400
theme.textTheme.displaySmall    // 36px, w400

// Estilos de headline (encabezados)
theme.textTheme.headlineLarge   // 32px, w400
theme.textTheme.headlineMedium  // 28px, w400
theme.textTheme.headlineSmall   // 24px, w400

// Estilos de title (títulos de sección)
theme.textTheme.titleLarge      // 22px, w400
theme.textTheme.titleMedium     // 16px, w500
theme.textTheme.titleSmall      // 14px, w500

// Estilos de body (contenido principal)
theme.textTheme.bodyLarge       // 16px, w400
theme.textTheme.bodyMedium      // 14px, w400
theme.textTheme.bodySmall       // 12px, w400

// Estilos de label (etiquetas)
theme.textTheme.labelLarge      // 14px, w500
theme.textTheme.labelMedium     // 12px, w500
theme.textTheme.labelSmall      // 11px, w500''';
  }
} 