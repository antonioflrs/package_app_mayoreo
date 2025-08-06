import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class MobileNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MobileNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.grayMedium,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      elevation: 8,
      enableFeedback: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: 'Componentes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.style),
          label: 'Iconos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Docs',
        ),
      ],
    );
  }
} 