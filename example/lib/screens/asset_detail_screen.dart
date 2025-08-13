import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class AssetDetailScreen extends StatelessWidget {
  final SearchResult asset;

  const AssetDetailScreen({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          asset.title,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vista previa del asset
            _buildAssetPreview(),
            
            const SizedBox(height: 32),
            
            // Información del asset
            _buildAssetInfo(),
            
            const SizedBox(height: 32),
            
            // Código de uso
            _buildUsageCode(),
            
            const SizedBox(height: 32),
            
            // Botones de acción
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetPreview() {
    return Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.backCards,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Center(
          child: asset.iconPath != null
              ? SafeSvgIcon(
                  iconPath: asset.iconPath!,
                  width: 64,
                  height: 64,
                  color: _getAssetColor(),
                )
              : Icon(
                  asset.icon ?? Icons.widgets,
                  size: 64,
                  color: _getAssetColor(),
                ),
        ),
      ),
    );
  }

  Widget _buildAssetInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Información del Asset',
          style: AppTypography.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ) ?? const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        // Badges informativos
        Row(
          children: [
            CategoryBadge(
              text: asset.category ?? 'Asset',
              color: _getCategoryColor(asset.category),
              size: BadgeSize.small,
            ),
            const SizedBox(width: 8),
            StatusBadge(
              text: 'Disponible',
              color: AppColors.greenFree,
              size: BadgeSize.small,
            ),
            const SizedBox(width: 8),
            NotificationBadge(
              text: 'SVG',
              color: AppColors.orangeBrand,
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        _buildInfoRow('Tipo', _getTypeLabel()),
        _buildInfoRow('Categoría', asset.category ?? 'N/A'),
        if (asset.subcategory != null)
          _buildInfoRow('Subcategoría', asset.subcategory!),
        _buildInfoRow('Descripción', asset.description),
        if (asset.iconPath != null)
          _buildInfoRow('Ruta', asset.iconPath!),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backCards,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.silverGrayMedium.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.black,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageCode() {
    final codeExample = _generateCodeExample();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Código de uso:',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.backCards,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.silverGrayMedium.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                codeExample,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.black,
                  fontFamily: 'monospace',
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.copy,
                    size: 16,
                    color: AppColors.grayMedium,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Haz clic para copiar',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grayMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _copyToClipboard(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orangeBrand,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Copiar código',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.orangeBrand,
              side: const BorderSide(color: AppColors.orangeBrand),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Cerrar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getTypeLabel() {
    switch (asset.type) {
      case SearchResultType.component:
        return 'Componente UI';
      case SearchResultType.token:
        return 'Token de Diseño';
      case SearchResultType.icon:
        return 'Icono SVG';
      case SearchResultType.color:
        return 'Token de Color';
      case SearchResultType.typography:
        return 'Token de Tipografía';
    }
  }

  Color _getAssetColor() {
    return AppColors.orangeBrand;
  }

  Color _getCategoryColor(String? category) {
    if (category == null) return AppColors.grayMedium;
    
    switch (category.toLowerCase()) {
      case 'icon':
        return AppColors.orangeBrand;
      case 'logo':
        return AppColors.ochreBrand;
      case 'social':
        return AppColors.oliveBrand;
      case 'custom':
        return AppColors.greenFree;
      default:
        return AppColors.grayMedium;
    }
  }

  String _generateCodeExample() {
    switch (asset.type) {
      case SearchResultType.icon:
        return '''// Importar el package
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar el icono
PackageIcon(
  iconPath: "${asset.iconPath}",
  size: 32,
  color: AppColors.darkGray,
)''';
      
      case SearchResultType.color:
        return '''// Importar el package
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar el color
Container(
  color: ${asset.title},
  child: Text('Ejemplo de uso'),
)''';
      
      case SearchResultType.typography:
        return '''// Importar el package
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar la tipografía
Text(
  'Ejemplo de texto',
  style: ${asset.title},
)''';
      
      case SearchResultType.component:
        return '''// Importar el package
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Usar el componente
${asset.title}(
  // Propiedades del componente
  // Consulta la documentación para más detalles
)''';
      
      case SearchResultType.token:
        return '''// Importar el package
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Token de diseño
${asset.title}

// Ejemplo de uso
Container(
  // Usar el token aquí según el contexto
)''';
    }
  }

  void _copyToClipboard(BuildContext context) {
    final codeExample = _generateCodeExample();
    Clipboard.setData(ClipboardData(text: codeExample)).then((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Código copiado al portapapeles'),
            backgroundColor: AppColors.orangeBrand,
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }
}
