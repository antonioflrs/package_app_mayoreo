import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ZIndexContent extends StatelessWidget {
  const ZIndexContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Z Index',
      componentDescription: 'Sistema de capas y profundidad para controlar el orden de apilamiento de elementos en la interfaz',
      examples: [
        ComponentExample(
          id: 'z-index-usage',
          title: 'Uso de Z Index',
          description: 'Los valores de z-index se aplican mediante constantes predefinidas',
          previewWidget: _buildZIndexUsagePreview(),
          codeExample: _getZIndexUsageCode(),
        ),
        ComponentExample(
          id: 'z-index-import',
          title: 'Importación',
          description: 'Los valores de z-index están disponibles como constantes en el paquete',
          previewWidget: _buildZIndexImportPreview(),
          codeExample: _getZIndexImportCode(),
        ),
        ComponentExample(
          id: 'z-index-tokens',
          title: 'Tokens de Z Index',
          description: 'Lista completa de valores de z-index disponibles en el sistema',
          previewWidget: _buildZIndexTokensPreview(),
          codeExample: _getZIndexTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'base',
          type: 'int',
          description: 'Z-index base para elementos normales (0)',
          required: false,
        ),
        ComponentProperty(
          name: 'dropdown',
          type: 'int',
          description: 'Z-index para dropdowns y menús desplegables (1000)',
          required: false,
        ),
        ComponentProperty(
          name: 'sticky',
          type: 'int',
          description: 'Z-index para elementos sticky (1020)',
          required: false,
        ),
        ComponentProperty(
          name: 'fixed',
          type: 'int',
          description: 'Z-index para elementos fijos (1030)',
          required: false,
        ),
        ComponentProperty(
          name: 'modal',
          type: 'int',
          description: 'Z-index para modales y overlays (1040)',
          required: false,
        ),
        ComponentProperty(
          name: 'popover',
          type: 'int',
          description: 'Z-index para popovers y tooltips (1050)',
          required: false,
        ),
        ComponentProperty(
          name: 'tooltip',
          type: 'int',
          description: 'Z-index para tooltips (1060)',
          required: false,
        ),
        ComponentProperty(
          name: 'toast',
          type: 'int',
          description: 'Z-index para notificaciones toast (1070)',
          required: false,
        ),
      ],
      usageNotes: 'El sistema de z-index utiliza una escala progresiva para evitar conflictos. Usa valores bajos para elementos base, medianos para elementos interactivos y altos para overlays y modales. Mantén consistencia en el uso de estos valores.',
    );
  }

  Widget _buildZIndexUsagePreview() {
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
            'Stack(\n  children: [\n    BaseElement(),\n    Positioned(\n      top: 0,\n      child: OverlayElement(),\n    ),\n  ],\n)',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 12,
              color: AppColors.orangeBrand,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ejemplo visual:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                // Base layer
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.orangeBrand,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Base',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                // Overlay layer
                Positioned(
                  left: 40,
                  top: 10,
                  child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.greenFree,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Overlay',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZIndexImportPreview() {
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
            'zIndex: 1000 // dropdown',
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

  Widget _buildZIndexTokensPreview() {
    final sampleZIndexes = [
      {'name': 'Base', 'value': 0, 'color': AppColors.orangeBrand},
      {'name': 'Dropdown', 'value': 1000, 'color': AppColors.greenFree},
      {'name': 'Sticky', 'value': 1020, 'color': AppColors.ochreBrand},
      {'name': 'Fixed', 'value': 1030, 'color': AppColors.oliveBrand},
      {'name': 'Modal', 'value': 1040, 'color': AppColors.digitalRed},
      {'name': 'Popover', 'value': 1050, 'color': AppColors.yellow},
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
            'Niveles de z-index:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleZIndexes.map((zIndex) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    zIndex['name'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: zIndex['color'] as Color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${zIndex['value']}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
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

  String _getZIndexUsageCode() {
    return '''// Sintaxis
Stack(
  children: [
    BaseElement(),
    Positioned(
      top: 0,
      child: OverlayElement(),
    ),
  ],
)

// Ejemplo con z-index
Container(
  decoration: BoxDecoration(
    color: AppColors.white,
    boxShadow: [BoxShadow(...)],
  ),
  child: Text('Mi elemento'),
)''';
  }

  String _getZIndexImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar valores de z-index
zIndex: 1000 // dropdown''';
  }

  String _getZIndexTokensCode() {
    return '''// Niveles de z-index
const int base = 0;       // Elementos base
const int dropdown = 1000; // Dropdowns y menús
const int sticky = 1020;   // Elementos sticky
const int fixed = 1030;    // Elementos fijos
const int modal = 1040;    // Modales y overlays
const int popover = 1050;  // Popovers
const int tooltip = 1060;  // Tooltips
const int toast = 1070;    // Notificaciones

// Uso en widgets
Container(
  decoration: BoxDecoration(
    color: AppColors.white,
    boxShadow: [BoxShadow(...)],
  ),
  child: Text('Mi elemento'),
)''';
  }
} 