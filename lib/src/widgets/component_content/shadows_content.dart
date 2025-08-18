import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ShadowsContent extends StatelessWidget {
  const ShadowsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Sombras',
      componentDescription: 'Sistema de sombras y elevación para crear profundidad visual en la interfaz',
      examples: [
        ComponentExample(
          id: 'shadows-usage',
          title: 'Uso de Sombras',
          description: 'Las sombras se aplican mediante BoxShadow siguiendo esta sintaxis',
          previewWidget: _buildShadowsUsagePreview(),
          codeExample: _getShadowsUsageCode(),
        ),
        ComponentExample(
          id: 'shadows-import',
          title: 'Importación',
          description: 'Los valores de sombra están disponibles como constantes en el paquete',
          previewWidget: _buildShadowsImportPreview(),
          codeExample: _getShadowsImportCode(),
        ),
        ComponentExample(
          id: 'shadows-tokens',
          title: 'Tokens de Sombras',
          description: 'Lista completa de valores de sombra disponibles en el sistema',
          previewWidget: _buildShadowsTokensPreview(),
          codeExample: _getShadowsTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'color',
          type: 'Color',
          description: 'Color de la sombra (usar AppColors.pureBlack con alpha)',
          required: true,
        ),
        ComponentProperty(
          name: 'blurRadius',
          type: 'double',
          description: 'Radio de desenfoque de la sombra',
          required: true,
        ),
        ComponentProperty(
          name: 'offset',
          type: 'Offset',
          description: 'Desplazamiento de la sombra (x, y)',
          required: true,
        ),
        ComponentProperty(
          name: 'spreadRadius',
          type: 'double',
          description: 'Radio de expansión de la sombra (opcional)',
          required: false,
          defaultValue: '0.0',
        ),
      ],
      usageNotes: 'Las sombras se organizan en niveles de elevación: small (4px), medium (8px), large (16px) y extra-large (24px). Usa sombras pequeñas para elementos cercanos y sombras grandes para elementos elevados. Mantén consistencia en la dirección de las sombras (generalmente hacia abajo).',
    );
  }

  Widget _buildShadowsUsagePreview() {
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
            'BoxShadow(\n  color: AppColors.pureBlack.withValues(alpha: 0.1),\n  blurRadius: 4,\n  offset: Offset(0, 2),\n)',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 12,
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.pureBlack.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              'Elemento con sombra',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadowsImportPreview() {
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
            'BoxShadow(\n  color: AppColors.pureBlack.withValues(alpha: 0.1),\n  blurRadius: 4,\n  offset: Offset(0, 2),\n)',
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

  Widget _buildShadowsTokensPreview() {
    final sampleShadows = [
      {'name': 'Small', 'shadow': BoxShadow(color: AppColors.pureBlack.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2))},
      {'name': 'Medium', 'shadow': BoxShadow(color: AppColors.pureBlack.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(0, 4))},
      {'name': 'Large', 'shadow': BoxShadow(color: AppColors.pureBlack.withValues(alpha: 0.2), blurRadius: 16, offset: const Offset(0, 8))},
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
            'Niveles de sombra:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleShadows.map((shadow) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shadow['name'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [shadow['shadow'] as BoxShadow],
                  ),
                  child: Text(
                    'Sombra ${shadow['name']}',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
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

  String _getShadowsUsageCode() {
    return '''// Sintaxis
BoxShadow(
  color: AppColors.pureBlack.withValues(alpha: 0.1),
  blurRadius: 4,
  offset: Offset(0, 2),
)

// Ejemplo
Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.pureBlack.withValues(alpha: 0.1),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Text('Mi elemento'),
)''';
  }

  String _getShadowsImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar valores de sombra
BoxShadow(
  color: AppColors.pureBlack.withValues(alpha: 0.1),
  blurRadius: 4,
  offset: Offset(0, 2),
)''';
  }

  String _getShadowsTokensCode() {
    return '''// Sombras pequeñas (elementos cercanos)
BoxShadow(
  color: AppColors.pureBlack.withValues(alpha: 0.1),
  blurRadius: 4,
  offset: Offset(0, 2),
)

// Sombras medianas (elementos intermedios)
BoxShadow(
  color: AppColors.pureBlack.withValues(alpha: 0.15),
  blurRadius: 8,
  offset: Offset(0, 4),
)

// Sombras grandes (elementos elevados)
BoxShadow(
  color: AppColors.pureBlack.withValues(alpha: 0.2),
  blurRadius: 16,
  offset: Offset(0, 8),
)

// Sombras extra grandes (modales, overlays)
BoxShadow(
  color: AppColors.pureBlack.withValues(alpha: 0.25),
  blurRadius: 24,
  offset: Offset(0, 12),
)''';
  }
} 