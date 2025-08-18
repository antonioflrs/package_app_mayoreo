import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class IconsContent extends StatelessWidget {
  const IconsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Iconos',
      componentDescription: 'Biblioteca de iconos del sistema que proporciona consistencia visual en toda la interfaz',
      examples: [
        ComponentExample(
          id: 'icons-usage',
          title: 'Uso de Iconos',
          description: 'Los iconos se aplican mediante widgets predefinidos siguiendo esta sintaxis',
          previewWidget: _buildIconsUsagePreview(),
          codeExample: _getIconsUsageCode(),
        ),
        ComponentExample(
          id: 'icons-import',
          title: 'Importación',
          description: 'Los iconos están disponibles como widgets en el paquete',
          previewWidget: _buildIconsImportPreview(),
          codeExample: _getIconsImportCode(),
        ),
        ComponentExample(
          id: 'icons-tokens',
          title: 'Tokens de Iconos',
          description: 'Lista completa de iconos disponibles en el sistema',
          previewWidget: _buildIconsTokensPreview(),
          codeExample: _getIconsTokensCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'icon',
          type: 'IconData',
          description: 'Icono de Material Design a mostrar',
          required: true,
        ),
        ComponentProperty(
          name: 'size',
          type: 'double',
          description: 'Tamaño del icono en píxeles',
          required: false,
          defaultValue: '24.0',
        ),
        ComponentProperty(
          name: 'color',
          type: 'Color',
          description: 'Color del icono',
          required: false,
        ),
        ComponentProperty(
          name: 'semanticLabel',
          type: 'String',
          description: 'Etiqueta semántica para accesibilidad',
          required: false,
        ),
      ],
      usageNotes: 'Los iconos se organizan en categorías: navigation (navegación), action (acciones), content (contenido), alert (alertas) y communication (comunicación). Usa iconos apropiados para cada contexto y mantén consistencia en el tamaño y color.',
    );
  }

  Widget _buildIconsUsagePreview() {
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
            'Icon(Icons.[nombreDelIcono])',
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
              Icon(
                Icons.home,
                color: AppColors.orangeBrand,
                size: 32,
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.search,
                color: AppColors.greenFree,
                size: 32,
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.person,
                color: AppColors.ochreBrand,
                size: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconsImportPreview() {
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
            'Icon(Icons.home, color: AppColors.orangeBrand)',
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

  Widget _buildIconsTokensPreview() {
    final sampleIcons = [
      {'name': 'Home', 'icon': Icons.home, 'color': AppColors.orangeBrand},
      {'name': 'Search', 'icon': Icons.search, 'color': AppColors.greenFree},
      {'name': 'Person', 'icon': Icons.person, 'color': AppColors.ochreBrand},
      {'name': 'Settings', 'icon': Icons.settings, 'color': AppColors.oliveBrand},
      {'name': 'Notifications', 'icon': Icons.notifications, 'color': AppColors.digitalRed},
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
            'Iconos disponibles:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          ...sampleIcons.map((icon) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    icon['name'] as String,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  icon['icon'] as IconData,
                  color: icon['color'] as Color,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  'Icons.${icon['name'].toString().toLowerCase()}',
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

  String _getIconsUsageCode() {
    return '''// Sintaxis
Icon(Icons.[nombreDelIcono])

// Ejemplo básico
Icon(Icons.home)

// Con propiedades
Icon(
  Icons.search,
  color: AppColors.orangeBrand,
  size: 32.0,
)''';
  }

  String _getIconsImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar iconos
Icon(Icons.home, color: AppColors.orangeBrand)''';
  }

  String _getIconsTokensCode() {
    return '''// Iconos de navegación
Icons.home           // Inicio
Icons.search         // Búsqueda
Icons.person         // Perfil
Icons.settings       // Configuración

// Iconos de acción
Icons.add            // Agregar
Icons.edit           // Editar
Icons.delete         // Eliminar
Icons.favorite       // Favorito

// Iconos de contenido
Icons.image          // Imagen
Icons.video_library  // Video
Icons.attach_file    // Archivo
Icons.link           // Enlace

// Iconos de alerta
Icons.info           // Información
Icons.warning        // Advertencia
Icons.error          // Error
Icons.check_circle   // Éxito

// Uso en widgets
Icon(
  Icons.home,
  color: AppColors.orangeBrand,
  size: 24.0,
)''';
  }
} 