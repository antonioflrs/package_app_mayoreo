import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SpacingContent extends StatelessWidget {
  const SpacingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Espaciado',
      componentDescription: 'Sistema de espaciado y márgenes que proporciona consistencia visual en toda la interfaz',
      examples: [
        ComponentExample(
          id: 'spacing-usage',
          title: 'Uso de Espaciado',
          description: 'Los valores de espaciado se aplican mediante constantes predefinidas',
          previewWidget: _buildSpacingUsagePreview(),
          codeExample: _getSpacingUsageCode(),
        ),
        ComponentExample(
          id: 'spacing-import',
          title: 'Importación',
          description: 'Los valores de espaciado están disponibles como constantes en el paquete',
          previewWidget: _buildSpacingImportPreview(),
          codeExample: _getSpacingImportCode(),
        ),
        ComponentExample(
          id: 'spacing-tokens',
          title: 'Tokens de Espaciado',
          description: 'Lista completa de valores de espaciado disponibles en el sistema',
          previewWidget: _buildSpacingTokensPreview(),
          codeExample: _getSpacingTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'xs',
          type: 'double',
          description: 'Espaciado extra pequeño (4px)',
          required: false,
        ),
        ComponentProperty(
          name: 'sm',
          type: 'double',
          description: 'Espaciado pequeño (8px)',
          required: false,
        ),
        ComponentProperty(
          name: 'md',
          type: 'double',
          description: 'Espaciado mediano (16px)',
          required: false,
        ),
        ComponentProperty(
          name: 'lg',
          type: 'double',
          description: 'Espaciado grande (24px)',
          required: false,
        ),
        ComponentProperty(
          name: 'xl',
          type: 'double',
          description: 'Espaciado extra grande (32px)',
          required: false,
        ),
        ComponentProperty(
          name: 'xxl',
          type: 'double',
          description: 'Espaciado máximo (48px)',
          required: false,
        ),
      ],
      usageNotes: 'El sistema de espaciado utiliza una escala de 8px como base (4, 8, 16, 24, 32, 48). Usa espaciado pequeño para elementos relacionados, mediano para separación de secciones y grande para separación de grupos principales. Mantén consistencia en el uso de estos valores.',
    );
  }

  Widget _buildSpacingUsagePreview() {
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
            'SizedBox(height: 16.0) // o md',
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
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.orangeBrand,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 16), // md spacing
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.greenFree,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 24), // lg spacing
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.ochreBrand,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpacingImportPreview() {
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
            'Importación automática:',
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
            'Uso directo:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'SizedBox(height: 16.0) // 16px',
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

  Widget _buildSpacingTokensPreview() {
    final sampleSpacings = [
      {'name': 'XS', 'value': 4.0, 'color': AppColors.orangeBrand},
      {'name': 'SM', 'value': 8.0, 'color': AppColors.greenFree},
      {'name': 'MD', 'value': 16.0, 'color': AppColors.ochreBrand},
      {'name': 'LG', 'value': 24.0, 'color': AppColors.oliveBrand},
      {'name': 'XL', 'value': 32.0, 'color': AppColors.digitalRed},
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
            'Escala de espaciado:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleSpacings.map((spacing) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    spacing['name'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: spacing['value'] as double,
                  height: 20,
                  decoration: BoxDecoration(
                    color: spacing['color'] as Color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '${spacing['value']}px',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  String _getSpacingUsageCode() {
    return '''// Sintaxis
SizedBox(height: 16.0) // o md

// Ejemplo
Row(
  children: [
    Container(width: 40, height: 40),
    SizedBox(width: 16), // md spacing
    Container(width: 40, height: 40),
    SizedBox(width: 24), // lg spacing
    Container(width: 40, height: 40),
  ],
)''';
  }

  String _getSpacingImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar valores de espaciado
SizedBox(height: 16.0) // 16px''';
  }

  String _getSpacingTokensCode() {
    return '''// Escala de espaciado (base 8px)
const double xs = 4.0;   // Extra pequeño
const double sm = 8.0;   // Pequeño
const double md = 16.0;  // Mediano
const double lg = 24.0;  // Grande
const double xl = 32.0;  // Extra grande
const double xxl = 48.0; // Máximo

// Uso en widgets
SizedBox(height: xs),  // 4px
SizedBox(height: sm),  // 8px
SizedBox(height: md),  // 16px
SizedBox(height: lg),  // 24px
SizedBox(height: xl),  // 32px
SizedBox(height: xxl), // 48px''';
  }
} 