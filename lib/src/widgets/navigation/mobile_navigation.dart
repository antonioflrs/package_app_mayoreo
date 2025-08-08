import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class MobileNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MobileNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  MobileNavigationState createState() => MobileNavigationState();
}

class MobileNavigationState extends State<MobileNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(MobileNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      setState(() {
        _selectedIndex = widget.currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Envuelve el ClipRRect en un Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          // Mueve el borderRadius a la BoxDecoration
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // Color de la sombra
            spreadRadius: 0, // Cuánto se extiende la sombra
            blurRadius: 5, // Cuánto se difumina la sombra
            offset: const Offset(
              0,
              -1,
            ), // Posición de la sombra (negativo para arriba)
          ),
        ],
      ),
      child: ClipRRect(
        // Mantén el ClipRRect para el recorte visual si lo necesitas
        borderRadius: BorderRadius.only(
          // Mueve el borderRadius a la BoxDecoration para la sombra
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SafeSvgIcon(
                iconPath: PackageIcons.blifeLogoInactivo,
                height: 24.0,
              ),
              activeIcon: SafeSvgIcon(
                iconPath: PackageIcons.blifeLogoActivo,
                height: 24.0,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: SafeSvgIcon(
                iconPath: PackageIcons.categoriesInactive,
                height: 24.0,
              ),
              activeIcon: SafeSvgIcon(
                iconPath: PackageIcons.categoriesActivo,
                height: 24.0,
              ),
              label: 'Componentes',
            ),
            BottomNavigationBarItem(
              icon: SafeSvgIcon(
                iconPath: PackageIcons.documentInactive,
                height: 24.0,
              ),
              activeIcon: SafeSvgIcon(
                iconPath: PackageIcons.documentActive,
                height: 24.0,
              ),
              label: 'Iconos',
            ),
            BottomNavigationBarItem(
              icon: SafeSvgIcon(
                iconPath: PackageIcons.helpInactive,
                height: 24.0,
              ),
              activeIcon: SafeSvgIcon(
                iconPath: PackageIcons.helpActive,
                height: 24.0,
              ),
              label: 'Docs',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.orangeBrand,
          unselectedItemColor: AppColors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          iconSize: 24.0,
        ),
      ),
    );
  }
} 