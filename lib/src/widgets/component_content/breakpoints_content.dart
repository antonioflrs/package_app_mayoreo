import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BreakpointsContent extends StatelessWidget {
  const BreakpointsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Breakpoints',
      componentDescription: 'Sistema de puntos de quiebre responsivos para adaptar la interfaz a diferentes tamaños de pantalla',
      examples: [
        ComponentExample(
          id: 'breakpoints-usage',
          title: 'Uso de Breakpoints',
          description: 'Los breakpoints se utilizan para crear diseños responsivos',
          previewWidget: _buildBreakpointsUsagePreview(),
          codeExample: _getBreakpointsUsageCode(),
        ),
        ComponentExample(
          id: 'breakpoints-import',
          title: 'Importación',
          description: 'Los valores de breakpoint están disponibles como constantes en el paquete',
          previewWidget: _buildBreakpointsImportPreview(),
          codeExample: _getBreakpointsImportCode(),
        ),
        ComponentExample(
          id: 'breakpoints-tokens',
          title: 'Tokens de Breakpoints',
          description: 'Lista completa de valores de breakpoint disponibles en el sistema',
          previewWidget: _buildBreakpointsTokensPreview(),
          codeExample: _getBreakpointsTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'xs',
          type: 'double',
          description: 'Breakpoint extra pequeño (0px - 575px)',
          required: false,
        ),
        ComponentProperty(
          name: 'sm',
          type: 'double',
          description: 'Breakpoint pequeño (576px - 767px)',
          required: false,
        ),
        ComponentProperty(
          name: 'md',
          type: 'double',
          description: 'Breakpoint mediano (768px - 991px)',
          required: false,
        ),
        ComponentProperty(
          name: 'lg',
          type: 'double',
          description: 'Breakpoint grande (992px - 1199px)',
          required: false,
        ),
        ComponentProperty(
          name: 'xl',
          type: 'double',
          description: 'Breakpoint extra grande (1200px - 1399px)',
          required: false,
        ),
        ComponentProperty(
          name: 'xxl',
          type: 'double',
          description: 'Breakpoint máximo (1400px+)',
          required: false,
        ),
      ],
      usageNotes: 'Los breakpoints se utilizan para crear diseños responsivos. Usa MediaQuery.of(context).size.width para obtener el ancho de pantalla y compara con los valores de breakpoint para aplicar estilos diferentes. Mantén consistencia en el uso de estos valores.',
    );
  }

  Widget _buildBreakpointsUsagePreview() {
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
            'MediaQuery.of(context).size.width < 768',
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Mobile',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Tablet',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Desktop',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
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

  Widget _buildBreakpointsImportPreview() {
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
            'MediaQuery.of(context).size.width < 768',
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

  Widget _buildBreakpointsTokensPreview() {
    final sampleBreakpoints = [
      {'name': 'XS', 'range': '0px - 575px', 'color': AppColors.orangeBrand},
      {'name': 'SM', 'range': '576px - 767px', 'color': AppColors.greenFree},
      {'name': 'MD', 'range': '768px - 991px', 'color': AppColors.ochreBrand},
      {'name': 'LG', 'range': '992px - 1199px', 'color': AppColors.oliveBrand},
      {'name': 'XL', 'range': '1200px - 1399px', 'color': AppColors.digitalRed},
      {'name': 'XXL', 'range': '1400px+', 'color': AppColors.yellow},
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
            'Rangos de breakpoint:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleBreakpoints.map((breakpoint) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    breakpoint['name'] as String,
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
                    color: breakpoint['color'] as Color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    breakpoint['range'] as String,
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

  String _getBreakpointsUsageCode() {
    return '''// Sintaxis
MediaQuery.of(context).size.width < 768

// Ejemplo
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 768;
  
  return isMobile 
    ? MobileLayout()
    : DesktopLayout();
}''';
  }

  String _getBreakpointsImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar valores de breakpoint
MediaQuery.of(context).size.width < 768''';
  }

  String _getBreakpointsTokensCode() {
    return '''// Rangos de breakpoint
const double xs = 0;      // 0px - 575px
const double sm = 576;    // 576px - 767px
const double md = 768;    // 768px - 991px
const double lg = 992;    // 992px - 1199px
const double xl = 1200;   // 1200px - 1399px
const double xxl = 1400;  // 1400px+

// Uso en widgets
final screenWidth = MediaQuery.of(context).size.width;
if (screenWidth < md) {
  // Mobile layout
} else if (screenWidth < lg) {
  // Tablet layout
} else {
  // Desktop layout
}''';
  }
} 