import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Navegación móvil simplificada y optimizada
class MobileNavigation extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MobileNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<MobileNavigation> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavigationItem(
                icon: PackageIcons.blifeLogoInactivo,
                activeIcon: PackageIcons.blifeLogoActivo,
                label: 'Inicio',
                isSelected: widget.selectedIndex == 0,
                onTap: () => widget.onItemTapped(0),
              ),
              _buildNavigationItem(
                icon: PackageIcons.categoriesInactive,
                activeIcon: PackageIcons.categoriesActivo,
                label: 'Componentes',
                isSelected: widget.selectedIndex == 1,
                onTap: () => widget.onItemTapped(1),
              ),
              _buildNavigationItem(
                icon: PackageIcons.icon,
                activeIcon: PackageIcons.icon,
                label: 'Iconos',
                isSelected: widget.selectedIndex == 2,
                onTap: () => widget.onItemTapped(2),
              ),
              _buildNavigationItem(
                icon: PackageIcons.documentInactive,
                activeIcon: PackageIcons.documentActive,
                label: 'Docs',
                isSelected: widget.selectedIndex == 3,
                onTap: () => widget.onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Construye un item de navegación individual
  Widget _buildNavigationItem({
    required String icon,
    required String activeIcon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeSvgIcon(
                iconPath: isSelected ? activeIcon : icon,
                height: 24,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w300,
                  color: isSelected ? AppColors.orangeBrand : AppColors.grayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 