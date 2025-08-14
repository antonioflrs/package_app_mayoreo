import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import 'design_system_screen.dart';
import 'component_detail_screen.dart';
import 'icon_test_screen.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final Function(int)? onNavigationRequested;

  const HomeScreen({super.key, this.onNavigationRequested});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF)],
            stops: [0.15, 0.65],
          ),
        ),
        child: Column(
          children: [
            _buildMobileAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Hero Content
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0, bottom: 20.0),
                      child: _buildHeroContent(context),
                    ),

                    // Search Bar
                    _buildSearchBar(context),

                    // Technology Tags
                    _buildTechnologyTags(context),

                    // Main Content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          // Call to Action Buttons
                          _buildActionButtons(context),

                          const SizedBox(height: 48),

                          // Component Cards
                          _buildComponentCards(context),

                          const SizedBox(height: 48),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backCards,
      elevation: 0,
      title: Row(
        children: [
          // Logo Btoolkit+ usando PackageIcon (Material Design Style)
          // Este icono usa el mismo sistema que se prueba en icon_test_screen.dart
          // Características: Manejo robusto de errores, placeholder, validación en tiempo de compilación
          Row(
            children: [
              PackageIcon(
                iconPath: PackageIcons.bToolkitCopia,
                size: 32,
                color: AppColors.black,
              ),
              const SizedBox(width: 4),
            ],
          ),
          const Spacer(),
          // Three dots menu
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.black),
            onPressed: () => _showMenu(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologyTags(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 40),
      child: Column(
        children: [
          _TechTag(
            text: 'Creado para Flutter',
            iconPath: PackageIcons.iconFlutter,
            textColor: AppColors.black,
            iconColor: null, // null means original color
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20, bottom: 0),
      
      child: CustomSearchBarWidget(
        hintText: 'Buscar componentes, tokens, iconos...',
        onChanged: (value) {
          // La búsqueda se maneja internamente en el widget
        },
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context) {
    return Column(
      children: [
        // Título del hero
        Text(
          'Sistema de diseño\npara Flutter',
                      style: AppTypography.headlineSmall!.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 32,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'La librería de componentes para unificar\nel diseño de tus apps.',
          style: AppTypography.bodyLarge!.copyWith(
            color: AppColors.warmGray,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
          const SizedBox(height: 0),
        ],
    );
  }

 

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DesignSystemScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Componentes',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const IconTestScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orangeBrand,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            icon: const Icon(Icons.image, size: 18),
            label: const Text(
              'Probar Iconos',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  String? _getPackageIconForItem(NavigationItem item) {
    // Mapeo de componentes a iconos del package
    switch (item.title.toLowerCase()) {
      case 'colores':
        return PackageIcons.colors;
      case 'tipografía':
        return PackageIcons.tipography;
      case 'espaciados':
        return PackageIcons.espaciados;
      case 'sombras':
        return PackageIcons.shadow;
      case 'radios':
        return PackageIcons.rest;
      case 'breakpoints':
        return PackageIcons.breakpoints;
      case 'z-index':
        return PackageIcons.zIndex;
      case 'botones':
        return PackageIcons.plusIcon;
      case 'campos de texto':
        return PackageIcons.hugeiconsNoteAdd;
      case 'barras de navegación':
        return PackageIcons.burguerIcon;
      case 'tarjetas':
        return PackageIcons.cardActive;
      case 'badges':
        return PackageIcons.check;
      case 'alertas':
        return PackageIcons.alertIcon;
      case 'acordeones':
        return PackageIcons.arrowDown;
      case 'breadcrumbs':
        return PackageIcons.arrowLeft;
      case 'barras de búsqueda':
        return PackageIcons.shareIcon;
      case 'avatares':
        return PackageIcons.userActivo;
      default:
        return null;
    }
  }

  Widget _buildComponentCards(BuildContext context) {
    final designGuides = DesignSystemData.designGuides.take(2).toList();
    final uiComponents = DesignSystemData.uiComponents.take(2).toList();

    return Column(
      children: [
        // Design Guides Section
        _buildSectionTitle('Guías de Diseño', Icons.palette),
        const SizedBox(height: 16),
        _buildCardsColumn(designGuides, context),

        const SizedBox(height: 32),

        // UI Components Section
        _buildSectionTitle('Componentes UI', Icons.widgets),
        const SizedBox(height: 16),
        _buildCardsColumn(uiComponents, context),
      ],
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.grayMedium, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildCardsColumn(List<NavigationItem> items, BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: MobileCard(
            title: item.title,
            description: item.description,
            packageIconPath: _getPackageIconForItem(item),
            icon: item.icon ?? Icons.widgets,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ComponentDetailScreen(component: item),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }

  void _showMenu(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(context, 'Docs', Icons.description, () {
                Navigator.of(context).pop();
                onNavigationRequested?.call(3);
              }),
              const SizedBox(height: 8),
              _buildMenuItem(context, 'Novedades', Icons.newspaper, () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Novedades próximamente'),
                    duration: Duration(seconds: 1),
                    backgroundColor: AppColors.black,
                  ),
                );
              }),
              const SizedBox(height: 8),
              _buildMenuItem(context, 'Iconos', Icons.style, () {
                Navigator.of(context).pop();
                onNavigationRequested?.call(2);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 24, color: AppColors.grayMedium),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String text;
  final String? iconPath;
  final Color? textColor;
  final Color? iconColor;

  const _TechTag({
    required this.text,
    this.iconPath,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            PackageIcon(
              iconPath: iconPath!,
              size: 16,
              color: iconColor,
            ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: textColor ?? AppColors.grayMedium,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
