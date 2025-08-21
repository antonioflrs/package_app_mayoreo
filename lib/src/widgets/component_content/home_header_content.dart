import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../home_header.dart';

/// Contenido de documentación para el widget HomeHeader
class HomeHeaderContent extends StatelessWidget {
  const HomeHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Home Header',
      componentDescription:
          'Widget de header personalizable para la pantalla de inicio con opciones de colores, iconos, tamaños y acciones',
      examples: [
        ComponentExample(
          id: 'header-basico',
          title: 'Header básico',
          description: 'Header simple con iconos por defecto y título',
          previewWidget: Container(
            color: Colors.grey[100],
            child: HomeHeader(title: 'Mi App', height: 80),
          ),
          codeExample: '''
HomeHeader(
  title: 'Mi App',
  height: 80,
)
          ''',
        ),
        ComponentExample(
          id: 'header-con-iconos-personalizados',
          title: 'Header iconos personalizados',
          description: 'Header con iconos específicos y colores personalizados',
          previewWidget: Container(
            color: Colors.grey[100],
            child: HomeHeader(
              title: 'Productos',
              menuIcon: Icons.apps,
              cartIcon: Icons.shopping_bag,
              backgroundColor: Colors.blue,
              iconColor: Colors.white,
              titleColor: Colors.white,
              height: 80,
            ),
          ),
          codeExample: '''
HomeHeader(
  title: 'Productos',
  menuIcon: Icons.apps,
  cartIcon: Icons.shopping_bag,
  backgroundColor: Colors.blue,
  iconColor: Colors.white,
  titleColor: Colors.white,
  height: 80,
)
          ''',
        ),

        ComponentExample(
          id: 'header-completamente-personalizado',
          title: 'Header personalizado',
          description:
              'Header con todas las opciones personalizables y callbacks',
          previewWidget: Container(
            color: Colors.grey[100],
            child: HomeHeader(
              title: 'Premium',
              menuIcon: Icons.dashboard,
              cartIcon: Icons.favorite,
              backgroundColor: AppColors.smokeGreenMedium,
              iconColor: Colors.white,
              titleColor: Colors.white,
              verticalPadding: 20.0,
              height: 90,
              iconSize: 24.0,
              elevation: 4.0,
              borderRadius: BorderRadius.circular(16.0),
              onMenuPressed: () => print('Menú personalizado'),
              onCartPressed: () => print('Carrito personalizado'),
              onLogoPressed: () => print('Logo presionado'),
              titleStyle: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
          codeExample: '''
HomeHeader(
  title: 'Premium',
  menuIcon: Icons.dashboard,
  cartIcon: Icons.favorite,
  backgroundColor: Colors.purple,
  iconColor: Colors.white,
  titleColor: Colors.white,
  verticalPadding: 12.0,
  height: 90,
  iconSize: 28.0,
  elevation: 4.0,
  borderRadius: BorderRadius.circular(16.0),
  onMenuPressed: () => print('Menú personalizado'),
  onCartPressed: () => print('Carrito personalizado'),
  onLogoPressed: () => print('Logo presionado'),
  titleStyle: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  ),
)
          ''',
        ),
      ],
    );
  }
}
