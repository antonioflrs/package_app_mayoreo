import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Widget de demostración que muestra cómo usar todos los assets del package
class AssetsDemoWidget extends StatelessWidget {
  const AssetsDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo de Assets del Package',
          style: AppTypography.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.orangeBrand,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('📊 Estadísticas de Assets'),
            _buildAssetsStats(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🔤 Fuentes Inter'),
            _buildFontsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🎨 Iconos BLife'),
            _buildBlifeIconsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🔵 Iconos Filled'),
            _buildFilledIconsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('⚪ Iconos Stroke'),
            _buildStrokeIconsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🎯 Iconos Simbólicos'),
            _buildSymbolicIconsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('📱 Iconos Social Media'),
            _buildSocialMediaIconsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('💳 Iconos de Pagos'),
            _buildPaymentIconsDemo(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('📦 Iconos de Estado de Pedidos'),
            _buildOrderStatusIconsDemo(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: AppTypography.headlineSmall?.copyWith(
          color: AppColors.orangeBrand,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildAssetsStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumen de Assets Disponibles:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildStatRow('Total de Assets', AssetUtils.totalAssetCount.toString()),
          _buildStatRow('Fuentes', AssetUtils.getAssetCount('fonts').toString()),
          _buildStatRow('Iconos BLife', AssetUtils.getAssetCount('blife').toString()),
          _buildStatRow('Iconos Filled', AssetUtils.getAssetCount('filled').toString()),
          _buildStatRow('Iconos Stroke', AssetUtils.getAssetCount('stroke').toString()),
          _buildStatRow('Iconos Simbólicos', AssetUtils.getAssetCount('symbolic').toString()),
          _buildStatRow('Iconos Social Media', AssetUtils.getAssetCount('social').toString()),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.darkGray,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.orangeBrand,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: AppTypography.labelSmall?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFontsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fuentes Inter Disponibles:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Inter Light (300)',
            style: TextStyle(
              fontFamily: FontAssets.interFamily,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          Text(
            'Inter Regular (400)',
            style: TextStyle(
              fontFamily: FontAssets.interFamily,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Text(
            'Inter Medium (500)',
            style: TextStyle(
              fontFamily: FontAssets.interFamily,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            'Inter SemiBold (600)',
            style: TextStyle(
              fontFamily: FontAssets.interFamily,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            'Inter Bold (700)',
            style: TextStyle(
              fontFamily: FontAssets.interFamily,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlifeIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos de Marca BLife:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconItem('BLife Toolkit', IconAssets.blifeToolkit),
              _buildIconItem('Logo Activo', IconAssets.blifeLogoActivo),
              _buildIconItem('Logo Inactivo', IconAssets.blifeLogoInactivo),
              _buildIconItem('Logo Mayoreo', IconAssets.blifeLogoMayoreo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilledIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos Filled (${AssetUtils.getAssetCount('filled')} iconos):',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconItem('Apple Logo', IconAssets.filledAppleLogo),
              _buildIconItem('Card Active', IconAssets.filledCardActive),
              _buildIconItem('Card Inactive', IconAssets.filledCardInactive),
              _buildIconItem('Cart Activo', IconAssets.filledCartActivo),
              _buildIconItem('Categories', IconAssets.filledCategoriesActivo),
              _buildIconItem('Document', IconAssets.filledDocumentActive),
              _buildIconItem('Favorites', IconAssets.filledFavoritesActivo),
              _buildIconItem('Help', IconAssets.filledHelpActive),
              _buildIconItem('List', IconAssets.filledListActive),
              _buildIconItem('Mail', IconAssets.filledMailIcon),
              _buildIconItem('Orders', IconAssets.filledOrdersActivo),
              _buildIconItem('Pedidos', IconAssets.filledPedidosActive),
              _buildIconItem('User', IconAssets.filledUserActivo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStrokeIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos Stroke (${AssetUtils.getAssetCount('stroke')} iconos):',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconItem('Alert', IconAssets.strokeAlertIcon),
              _buildIconItem('Arrow Down', IconAssets.strokeArrowDown),
              _buildIconItem('Arrow Left', IconAssets.strokeArrowLeft),
              _buildIconItem('Check', IconAssets.strokeCheck),
              _buildIconItem('Close', IconAssets.strokeClose),
              _buildIconItem('Delete', IconAssets.strokeDelete),
              _buildIconItem('Plus', IconAssets.strokePlusIcon),
              _buildIconItem('Search', IconAssets.strokeSearchIcon),
              _buildIconItem('Share', IconAssets.strokeShareIcon),
              _buildIconItem('User', IconAssets.strokeUserInactivo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolicIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos Simbólicos:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconItem('Promotions', IconAssets.simbolicosPromotions),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos de Redes Sociales:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildIconItem('WhatsApp', IconAssets.socialMediaWhatsappLogo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos de Pagos:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Directorio disponible: ${IconAssets.pagosDirectory}',
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Los iconos específicos de pagos se pueden agregar según sea necesario.',
            style: AppTypography.bodySmall?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatusIconsDemo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos de Estado de Pedidos:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Directorio disponible: ${IconAssets.statusPedidosDirectory}',
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Los iconos específicos de estado de pedidos se pueden agregar según sea necesario.',
            style: AppTypography.bodySmall?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconItem(String label, String assetPath) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.silverGrayMedium),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              assetPath,
              width: 36,
              height: 36,
              colorFilter: ColorFilter.mode(
                AppColors.orangeBrand,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: AppTypography.labelSmall?.copyWith(
              color: AppColors.grayMedium,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
