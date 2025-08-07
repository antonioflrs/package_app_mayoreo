import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Ejemplos prácticos de uso de iconos del paquete
class IconExamples extends StatelessWidget {
  const IconExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejemplos de Iconos',
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
            _buildExample1(),
            const SizedBox(height: 32),
            _buildExample2(),
          ],
        ),
      ),
    );
  }

  /// Ejemplo 1: Barra de navegación con iconos del paquete
  Widget _buildExample1() {
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
            'Ejemplo 1: Barra de Navegación',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.orangeBrand,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Barra de navegación inferior con iconos SVG del paquete:',
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: 16),
          
          // Simulación de barra de navegación
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.silverGrayMedium.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  icon: SvgIcons.userActive, // ✅ Ruta correcta desde lib/src/assets/icons
                  label: 'Perfil',
                  isActive: true,
                ),
                _buildNavItem(
                  icon: SvgIcons.ordersActive, // ✅ Ruta correcta desde lib/src/assets/icons
                  label: 'Pedidos',
                  isActive: false,
                ),
                _buildNavItem(
                  icon: SvgIcons.cartActive, // ✅ Ruta correcta desde lib/src/assets/icons
                  label: 'Carrito',
                  isActive: false,
                ),
                _buildNavItem(
                  icon: SvgIcons.favoritesActive, // ✅ Ruta correcta desde lib/src/assets/icons
                  label: 'Favoritos',
                  isActive: false,
                ),
                _buildNavItem(
                  icon: SvgIcons.categoriesActive, // ✅ Ruta correcta desde lib/src/assets/icons
                  label: 'Categorías',
                  isActive: false,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          Text(
            'Código:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '''
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
)
              ''',
              style: AppTypography.bodySmall?.copyWith(
                fontFamily: 'monospace',
                color: AppColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Ejemplo 2: Dashboard con iconos y acciones
  Widget _buildExample2() {
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
            'Ejemplo 2: Dashboard de Acciones',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.orangeBrand,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Dashboard con diferentes tipos de iconos y acciones:',
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: 16),
          
          // Grid de acciones
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: [
              _buildActionCard(
                icon: SvgIcons.documentActive, // ✅ Ruta correcta desde lib/src/assets/icons
                title: 'Documentos',
                subtitle: 'Ver documentos',
                color: AppColors.orangeBrand,
                onTap: () => _showSnackBar('Documentos'),
              ),
              _buildActionCard(
                icon: SvgIcons.cardActive, // ✅ Ruta correcta desde lib/src/assets/icons
                title: 'Pagos',
                subtitle: 'Gestionar pagos',
                color: AppColors.ochreBrand,
                onTap: () => _showSnackBar('Pagos'),
              ),
              _buildActionCard(
                icon: SvgIcons.locationActive, // ✅ Ruta correcta desde lib/src/assets/icons
                title: 'Ubicación',
                subtitle: 'Ver ubicaciones',
                color: AppColors.oliveBrand,
                onTap: () => _showSnackBar('Ubicación'),
              ),
              _buildActionCard(
                icon: SvgIcons.helpActive, // ✅ Ruta correcta desde lib/src/assets/icons
                title: 'Ayuda',
                subtitle: 'Centro de ayuda',
                color: AppColors.digitalRed,
                onTap: () => _showSnackBar('Ayuda'),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          Text(
            'Código:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '''
Container(
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [/* sombra */],
  ),
  child: Column(
    children: [
      CustomSvgIcon(
        iconPath: SvgIcons.documentActive,
        width: 32,
        height: 32,
        color: AppColors.orangeBrand,
      ),
      Text('Documentos', style: AppTypography.titleSmall),
    ],
  ),
)
              ''',
              style: AppTypography.bodySmall?.copyWith(
                fontFamily: 'monospace',
                color: AppColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required bool isActive,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvgIcon(
          iconPath: icon,
          width: 24,
          height: 24,
          color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTypography.labelSmall?.copyWith(
            color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.silverGrayMedium.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgIcon(
              iconPath: icon,
              width: 32,
              height: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTypography.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTypography.labelSmall?.copyWith(
                color: AppColors.grayMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    // En un contexto real, esto mostraría un SnackBar
    // ignore: avoid_print
    print('Acción: $message');
  }
}
