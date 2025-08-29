import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class TypographyContent extends StatelessWidget {
  const TypographyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Tipografía',
      componentDescription:
          'Sistema de tipografía que utiliza la fuente Inter con diferentes pesos y tamaños para crear una jerarquía visual clara. Incluye font features avanzadas para control tipográfico preciso.',
      examples: [
        ComponentExample(
          id: 'typography-basic',
          title: 'Tipografía Básica',
          description: 'Estilos estándar: Sistema Material Design 3',
          previewWidget: _buildBasicTypographyPreview(),
          codeExample: _getBasicTypographyCode(),
        ),
        ComponentExample(
          id: 'typography-font-features',
          title: 'Font Features Avanzadas',
          description:
              'Control avanzado de características tipográficas como ligaduras, kerning y alternativas de caracteres',
          previewWidget: _buildFontFeaturesPreview(),
          codeExample: _getFontFeaturesCode(),
        ),
        ComponentExample(
          id: 'typography-custom',
          title: 'Tipografía Personalizada',
          description:
              'Creación de estilos de texto personalizados con font features específicas',
          previewWidget: _buildCustomTypographyPreview(),
          codeExample: _getCustomTypographyCode(),
        ),
        ComponentExample(
          id: 'typography-tokens',
          title: 'Tokens del Sistema',
          description:
              'Lista completa de estilos de tipografía disponibles en el sistema',
          previewWidget: _buildTypographyTokensPreview(),
          codeExample: _getTypographyTokensCode(),
        ),
      ],

      properties: [
        ComponentProperty(
          name: 'displayLarge',
          type: 'TextStyle',
          description:
              'Estilo de texto para títulos principales muy grandes (57px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'displayMedium',
          type: 'TextStyle',
          description:
              'Estilo de texto para títulos principales medianos (45px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'displaySmall',
          type: 'TextStyle',
          description:
              'Estilo de texto para títulos principales pequeños (36px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'headlineLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para encabezados grandes (32px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'headlineMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para encabezados medianos (28px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'headlineSmall',
          type: 'TextStyle',
          description: 'Estilo de texto para encabezados pequeños (24px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'titleLarge',
          type: 'TextStyle',
          description:
              'Estilo de texto para títulos de sección grandes (22px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'titleMedium',
          type: 'TextStyle',
          description:
              'Estilo de texto para títulos de sección medianos (16px, w500)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'titleSmall',
          type: 'TextStyle',
          description:
              'Estilo de texto para títulos de sección pequeños (14px, w500)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'bodyLarge',
          type: 'TextStyle',
          description:
              'Estilo de texto para contenido principal grande (16px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'bodyMedium',
          type: 'TextStyle',
          description:
              'Estilo de texto para contenido principal mediano (14px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'bodySmall',
          type: 'TextStyle',
          description:
              'Estilo de texto para contenido principal pequeño (12px, w400)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'labelLarge',
          type: 'TextStyle',
          description: 'Estilo de texto para etiquetas grandes (14px, w500)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'labelMedium',
          type: 'TextStyle',
          description: 'Estilo de texto para etiquetas medianas (12px, w500)',
          required: false,
          defaultValue: 'null',
        ),
        ComponentProperty(
          name: 'labelSmall',
          type: 'TextStyle',
          description: 'Estilo de texto para etiquetas pequeñas (11px, w500)',
          required: false,
          defaultValue: 'null',
        ),
      ],
      usageNotes:
          'La tipografía utiliza la fuente Inter con pesos variables (wght) de 100 a 900. Los estilos se organizan en jerarquías: display (títulos principales), headline (encabezados), title (títulos de sección), body (contenido principal) y label (etiquetas). El sistema incluye font features avanzadas para control tipográfico preciso como ligaduras, kerning y alternativas de caracteres. Usa los estilos apropiados para mantener la consistencia visual.',
    );
  }

  Widget _buildBasicTypographyPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Display Large',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontFamily: 'InterVariable',
              fontFeatures: const [
                FontFeature.enable('cv11'),
                FontFeature.enable('ss01'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Headline Large',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              fontFamily: 'InterVariable',
              fontFeatures: const [
                FontFeature.enable('cv11'),
                FontFeature.enable('ss01'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Title Large',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              fontFamily: 'InterVariable',
              fontFeatures: const [
                FontFeature.enable('cv11'),
                FontFeature.enable('ss01'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Body Large - Texto de ejemplo.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGray,
              height: 1.5,
              fontFamily: 'InterVariable',
              fontFeatures: const [
                FontFeature.enable('cv11'),
                FontFeature.enable('ss01'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Label Medium',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grayMedium,
              fontFamily: 'InterVariable',
              fontFeatures: const [
                FontFeature.enable('cv11'),
                FontFeature.enable('ss01'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFontFeaturesPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Font Features Avanzadas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 20),
          _buildFeatureExample(
            'Sin font features',
            'a g 1 0',
            'Texto sin modificaciones',
          ),
          const SizedBox(height: 20),
          _buildFeatureExample(
            'Ligaduras (liga)',
            'fi fl ff ffi ffl',
            'Ligaduras automáticas entre caracteres',
          ),
          const SizedBox(height: 16),
          _buildFeatureExample(
            'Kerning (kern)',
            'AV Ta Wa',
            'Espaciado optimizado entre pares de letras',
          ),
          const SizedBox(height: 16),
          _buildFeatureExample('Solo ss01', 'a g 1 0', 'Solo ss01 habilitado'),
          const SizedBox(height: 16),
          _buildFeatureExample('Solo cv11', 'a g 1 0', 'Solo cv11 habilitado'),
          const SizedBox(height: 16),
          _buildFeatureExample('Solo ss02', 'a g 1 0', 'Solo ss02 habilitado'),
          const SizedBox(height: 16),
          _buildFeatureExample('Solo ss03', 'a g 1 0', 'Solo ss03 habilitado'),
          const SizedBox(height: 16),
          _buildFeatureExample(
            'Ligaduras contextuales (calt)',
            'st ct',
            'Ligaduras que dependen del contexto',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureExample(String title, String text, String description) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: AppColors.orangeBrand,
              fontFeatures: _getFontFeaturesForExample(title),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.darkGray,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  List<FontFeature> _getFontFeaturesForExample(String title) {
    switch (title) {
      case 'Sin font features':
        return [];
      case 'Solo ss01':
        return [FontFeature.enable('ss01')];
      case 'Solo ss02':
        return [FontFeature.enable('ss02')];
      case 'Solo ss03':
        return [FontFeature.enable('ss03')];
      case 'Solo cv11':
        return [FontFeature.enable('cv11')];
      case 'Alternativas (ss01)':
        return [
          FontFeature.enable('ss01'),
          FontFeature.enable('ss02'),
          FontFeature.enable('ss03'),
        ];
      default:
        return [
          FontFeature.disable('case'),
          FontFeature.disable('dlig'),
          FontFeature.disable('frac'),
          FontFeature.disable('dnom'),
          FontFeature.disable('numr'),
          FontFeature.disable('subs'),
          FontFeature.disable('sups'),
          FontFeature.disable('tnum'),
          FontFeature.disable('zero'),
          FontFeature.disable('ss01'),
          FontFeature.enable('cv11'),
          FontFeature.enable('calt'),
          FontFeature.enable('ccmp'),
          FontFeature.enable('locl'),
          FontFeature.enable('kern'),
        ];
    }
  }

  Widget _buildCustomTypographyPreview() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tipografía Personalizada',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.orangeBrand.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              'Texto con font features personalizadas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.orangeBrand,
                fontFeatures: const [
                  FontFeature.disable('case'),
                  FontFeature.disable('dlig'),
                  FontFeature.disable('frac'),
                  FontFeature.disable('dnom'),
                  FontFeature.disable('numr'),
                  FontFeature.disable('subs'),
                  FontFeature.disable('sups'),
                  FontFeature.disable('tnum'),
                  FontFeature.disable('zero'),
                  FontFeature.disable('ss01'),
                  FontFeature.enable('cv11'),
                  FontFeature.enable('calt'),
                  FontFeature.enable('ccmp'),
                  FontFeature.enable('locl'),
                  FontFeature.enable('kern'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Este texto muestra cómo aplicar font features específicas para controlar aspectos tipográficos como ligaduras, kerning y alternativas de caracteres.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyTokensPreview() {
    final sampleStyles = [
      {'name': 'displayLarge', 'size': '57px', 'weight': 'w400'},
      {'name': 'displayMedium', 'size': '45px', 'weight': 'w400'},
      {'name': 'displaySmall', 'size': '36px', 'weight': 'w400'},
      {'name': 'headlineLarge', 'size': '32px', 'weight': 'w400'},
      {'name': 'headlineMedium', 'size': '28px', 'weight': 'w400'},
      {'name': 'headlineSmall', 'size': '24px', 'weight': 'w400'},
      {'name': 'titleLarge', 'size': '22px', 'weight': 'w400'},
      {'name': 'titleMedium', 'size': '16px', 'weight': 'w500'},
      {'name': 'titleSmall', 'size': '14px', 'weight': 'w500'},
      {'name': 'bodyLarge', 'size': '16px', 'weight': 'w400'},
      {'name': 'bodyMedium', 'size': '14px', 'weight': 'w400'},
      {'name': 'bodySmall', 'size': '12px', 'weight': 'w400'},
      {'name': 'labelLarge', 'size': '14px', 'weight': 'w500'},
      {'name': 'labelMedium', 'size': '12px', 'weight': 'w500'},
      {'name': 'labelSmall', 'size': '11px', 'weight': 'w500'},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tokens del Sistema',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          ...sampleStyles.map(
            (style) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                          style['name'] as String,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                          style['size'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.orangeBrand,
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                          style['weight'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.greenFree,
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                    ],
                  ),
                  Text(
                      'Ejemplo',
                      style: TextStyle(
                        fontSize: _getFontSize(style['size'] as String),
                        fontWeight: _getFontWeight(style['weight'] as String),
                        color: AppColors.darkGray,
                      ),
                    ),  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getFontSize(String size) {
    return double.parse(size.replaceAll('px', ''));
  }

  FontWeight _getFontWeight(String weight) {
    switch (weight) {
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  String _getBasicTypographyCode() {
    return '''// Uso básico de tipografía del sistema
Text(
  'Display Large',
  style: Theme.of(context).textTheme.displayLarge,
)

Text(
  'Headline Large',
  style: Theme.of(context).textTheme.headlineLarge,
)

Text(
  'Body Large',
  style: Theme.of(context).textTheme.bodyLarge,
)''';
  }

  String _getFontFeaturesCode() {
    return '''// Font features avanzadas
Text(
  'Texto con ligaduras y kerning',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFeatures: const [
      FontFeature.disable('case'),
      FontFeature.disable('dlig'),
      FontFeature.disable('frac'),
      FontFeature.disable('dnom'),
      FontFeature.disable('numr'),
      FontFeature.disable('subs'),
      FontFeature.disable('sups'),
      FontFeature.disable('tnum'),
      FontFeature.disable('zero'),
      FontFeature.disable('ss01'),
      FontFeature.enable('cv11'),
      FontFeature.enable('calt'),
      FontFeature.enable('ccmp'),
      FontFeature.enable('locl'),
      FontFeature.enable('kern'),
    ],
  ),
)''';
  }

  String _getCustomTypographyCode() {
    return '''// Tipografía personalizada con font features
TextStyle customStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: AppColors.orangeBrand,
  fontFeatures: const [
    FontFeature.disable('case'),
    FontFeature.disable('dlig'),
    FontFeature.disable('frac'),
    FontFeature.disable('dnom'),
    FontFeature.disable('numr'),
    FontFeature.disable('subs'),
    FontFeature.disable('sups'),
    FontFeature.disable('tnum'),
    FontFeature.disable('zero'),
    FontFeature.disable('ss01'),
    FontFeature.enable('cv11'),
    FontFeature.enable('calt'),
    FontFeature.enable('ccmp'),
    FontFeature.enable('locl'),
    FontFeature.enable('kern'),
  ],
);

Text(
  'Mi texto personalizado',
  style: customStyle,
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
theme.textTheme.labelSmall      // 11px, w500

// Font features disponibles
FontFeature.disable('case')     // Deshabilita mayúsculas
FontFeature.disable('dlig')     // Deshabilita ligaduras discretas
FontFeature.disable('frac')     // Deshabilita fracciones
FontFeature.disable('dnom')     // Deshabilita denominadores
FontFeature.disable('numr')     // Deshabilita numeradores
FontFeature.disable('subs')     // Deshabilita subíndices
FontFeature.disable('sups')     // Deshabilita superíndices
FontFeature.disable('tnum')     // Deshabilita números tabulares
FontFeature.disable('zero')     // Deshabilita cero con barra
FontFeature.disable('ss01')     // Deshabilita alternativas estilísticas
FontFeature.enable('cv11')      // Habilita alternativas contextuales
FontFeature.enable('calt')      // Habilita ligaduras alternativas
FontFeature.enable('ccmp')      // Habilita composición de caracteres
FontFeature.enable('locl')      // Habilita localización
FontFeature.enable('kern')      // Habilita kerning''';
  }
}
