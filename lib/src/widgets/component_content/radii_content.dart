import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class RadiiContent extends StatelessWidget {
  const RadiiContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Radios',
      componentDescription: 'Sistema de bordes redondeados que proporciona consistencia visual en toda la interfaz',
      examples: [
        ComponentExample(
          id: 'radii-usage',
          title: 'Uso de Radios',
          description: 'Los valores de radio se aplican mediante constantes predefinidas',
          previewWidget: _buildRadiiUsagePreview(),
          codeExample: _getRadiiUsageCode(),
        ),
        ComponentExample(
          id: 'radii-import',
          title: 'Importación',
          description: 'Los valores de radio están disponibles como constantes en el paquete',
          previewWidget: _buildRadiiImportPreview(),
          codeExample: _getRadiiImportCode(),
        ),
        ComponentExample(
          id: 'radii-tokens',
          title: 'Tokens de Radios',
          description: 'Lista completa de valores de radio disponibles en el sistema',
          previewWidget: _buildRadiiTokensPreview(),
          codeExample: _getRadiiTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'xs',
          type: 'double',
          description: 'Radio extra pequeño (2px)',
          required: false,
        ),
        ComponentProperty(
          name: 'sm',
          type: 'double',
          description: 'Radio pequeño (4px)',
          required: false,
        ),
        ComponentProperty(
          name: 'md',
          type: 'double',
          description: 'Radio mediano (8px)',
          required: false,
        ),
        ComponentProperty(
          name: 'lg',
          type: 'double',
          description: 'Radio grande (12px)',
          required: false,
        ),
        ComponentProperty(
          name: 'xl',
          type: 'double',
          description: 'Radio extra grande (16px)',
          required: false,
        ),
        ComponentProperty(
          name: 'xxl',
          type: 'double',
          description: 'Radio máximo (24px)',
          required: false,
        ),
      ],
      usageNotes: 'El sistema de radios utiliza una escala progresiva (2, 4, 8, 12, 16, 24). Usa radios pequeños para elementos sutiles, medianos para componentes estándar y grandes para elementos destacados. Mantén consistencia en el uso de estos valores.',
    );
  }

  Widget _buildRadiiUsagePreview() {
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
            'BorderRadius.circular(8.0) // o md',
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
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.orangeBrand,
                  borderRadius: BorderRadius.circular(4), // sm
                ),
                child: const Center(
                  child: Text(
                    'SM',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.greenFree,
                  borderRadius: BorderRadius.circular(8), // md
                ),
                child: const Center(
                  child: Text(
                    'MD',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.ochreBrand,
                  borderRadius: BorderRadius.circular(16), // xl
                ),
                child: const Center(
                  child: Text(
                    'XL',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadiiImportPreview() {
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
            'BorderRadius.circular(8.0) // 8px',
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

  Widget _buildRadiiTokensPreview() {
    final sampleRadii = [
      {'name': 'XS', 'value': 2.0, 'color': AppColors.orangeBrand},
      {'name': 'SM', 'value': 4.0, 'color': AppColors.greenFree},
      {'name': 'MD', 'value': 8.0, 'color': AppColors.ochreBrand},
      {'name': 'LG', 'value': 12.0, 'color': AppColors.oliveBrand},
      {'name': 'XL', 'value': 16.0, 'color': AppColors.digitalRed},
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
            'Escala de radios:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleRadii.map((radius) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    radius['name'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: radius['color'] as Color,
                    borderRadius: BorderRadius.circular(radius['value'] as double),
                  ),
                  child: Center(
                    child: Text(
                      '${radius['value']}px',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '${radius['value']}px',
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

  String _getRadiiUsageCode() {
    return '''// Sintaxis
BorderRadius.circular(8.0) // o md

// Ejemplo
Container(
  decoration: BoxDecoration(
    color: AppColors.orangeBrand,
    borderRadius: BorderRadius.circular(8.0), // md
  ),
  child: Text('Mi elemento'),
)''';
  }

  String _getRadiiImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar valores de radio
BorderRadius.circular(8.0) // 8px''';
  }

  String _getRadiiTokensCode() {
    return '''// Escala de radios
const double xs = 2.0;   // Extra pequeño
const double sm = 4.0;   // Pequeño
const double md = 8.0;   // Mediano
const double lg = 12.0;  // Grande
const double xl = 16.0;  // Extra grande
const double xxl = 24.0; // Máximo

// Uso en widgets
BorderRadius.circular(xs),  // 2px
BorderRadius.circular(sm),  // 4px
BorderRadius.circular(md),  // 8px
BorderRadius.circular(lg),  // 12px
BorderRadius.circular(xl),  // 16px
BorderRadius.circular(xxl), // 24px''';
  }
} 