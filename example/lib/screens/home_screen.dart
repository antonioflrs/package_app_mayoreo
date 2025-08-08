import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../widgets/search_bar_widget.dart';
import '../data/design_system_data.dart';
import '../models/navigation_item.dart';
import '../widgets/mobile_card.dart';
import 'design_system_screen.dart';
import 'component_detail_screen.dart';
import 'icon_test_screen.dart';


class HomeScreen extends StatelessWidget {
  final Function(int)? onNavigationRequested;
  
  const HomeScreen({
    super.key,
    this.onNavigationRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGray,
      appBar: _buildMobileAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context),
            
            // Technology Tags
            _buildTechnologyTags(context),
            
            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Main Heading
                  _buildMainHeading(context),
                  
                  // Subtitle
                  _buildSubtitle(context),
                  
                  // Call to Action Button
                  _buildCallToActionButton(context),
                  
                  // Icon Test Button
                  _buildIconTestButton(context),
                  
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
    );
  }

  PreferredSizeWidget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.softGray,
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
                size: 24,
                color: AppColors.black,
              ),
              const SizedBox(width: 4),
              const Text(
                'toolkit+',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
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

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.softGray,
            AppColors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          // Título del hero
          Text(
            'Sistema de Diseño Flutter',
            style: AppTypography.headlineSmall!.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Componentes y herramientas para desarrollo',
            style: AppTypography.bodyLarge!.copyWith(
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Buscador
          SearchBarWidget(
            onChanged: (value) {
              // Implementar lógica de búsqueda aquí
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologyTags(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _TechTag(text: 'Creado para Flutter', icon: Icons.flutter_dash),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildMainHeading(BuildContext context) {
    return const Text(
      'Menos código repetido, más velocidad en tu desarrollo',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        'Componentes listos para ayudarte a desarrollar más rápido, sin esfuerzo y sin código repetido.',
        style: TextStyle(
          fontSize: 16,
          color: AppColors.darkGray,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCallToActionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DesignSystemScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Explorar componentes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildIconTestButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const IconTestScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orangeBrand,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        icon: const Icon(Icons.image, size: 20),
        label: const Text(
          'Probar Iconos SVG',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
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
        Icon(
          icon,
          color: AppColors.grayMedium,
          size: 20,
        ),
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
              _buildMenuItem(
                context,
                'Docs',
                Icons.description,
                () {
                  Navigator.of(context).pop();
                  onNavigationRequested?.call(3);
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                context,
                'Novedades',
                Icons.newspaper,
                () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Novedades próximamente'),
                      duration: Duration(seconds: 1),
                      backgroundColor: AppColors.black,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                context,
                'Iconos',
                Icons.style,
                () {
                  Navigator.of(context).pop();
                  onNavigationRequested?.call(2);
                },
              ),

            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
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
  final IconData icon;

  const _TechTag({
    required this.text,
    required this.icon,
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
          Icon(
            icon,
            size: 16,
            color: AppColors.grayMedium,
          ),
          const SizedBox(width: 6),
                      Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.grayMedium,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
} 