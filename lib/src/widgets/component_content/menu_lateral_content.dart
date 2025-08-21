import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget MenuLateral
class MenuLateralContent extends StatelessWidget {
  const MenuLateralContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Menu Lateral',
      componentDescription: 'Widget de menú lateral personalizable con elementos expandibles, categorías y perfil de usuario',
      examples: [
        ComponentExample(
          id: 'menu-basico',
          title: 'Menú básico',
          description: 'Menú lateral simple con elementos básicos y perfil de usuario',
          previewWidget: _buildMenuPreview(
            context,
            MenuLateral(
              title: 'Mi App',
              userName: 'J. Antonio Flores',
              menuItems: _getBasicMenuItems(),
              onCategorySelected: (index, title) => print('Seleccionada: $title'),
              onViewProfile: () => print('Ver perfil'),
              onLogout: () => print('Cerrar sesión'),
            ),
          ),
          codeExample: '''
MenuLateral(
  title: 'Mi App',
  userName: 'J. Antonio Flores',
  menuItems: [
    // Elementos del menú...
  ],
  onCategorySelected: (index, title) => print('Seleccionada: \$title'),
  onViewProfile: () => print('Ver perfil'),
  onLogout: () => print('Cerrar sesión'),
)
          ''',
        ),

        ComponentExample(
          id: 'menu-completamente-personalizado',
          title: 'Menú personalizado',
          description: 'Menú lateral con todas las opciones personalizables y colores específicos',
          previewWidget: _buildMenuPreview(
            context,
            MenuLateral(
              title: 'Premium',
              userName: 'Usuario Ejecutivo',
              backgroundColor: Colors.purple,
              titleColor: Colors.white,
              iconColor: Colors.white,
              textColor: Colors.white,
              profileTextColor: Colors.white,
              viewProfileTextColor: Colors.white70,
              logoutTextColor: Colors.white,
              headerHeight: 50.0,
              horizontalPadding: 20.0,
              itemSpacing: 8.0,
              menuItems: _getBasicMenuItems(),
              onCategorySelected: (index, title) => print('Seleccionada: $title'),
              onViewProfile: () => print('Ver perfil premium'),
              onLogout: () => print('Cerrar sesión premium'),
            ),
          ),
          codeExample: '''
MenuLateral(
  title: 'Premium',
  userName: 'Usuario Ejecutivo',
  backgroundColor: Colors.purple,
  titleColor: Colors.white,
  iconColor: Colors.white,
  textColor: Colors.white,
  profileTextColor: Colors.white,
  viewProfileTextColor: Colors.white70,
  logoutTextColor: Colors.white,
  headerHeight: 50.0,
  horizontalPadding: 20.0,
  itemSpacing: 8.0,
  menuItems: [
    // Elementos del menú...
  ],
  onCategorySelected: (index, title) => print('Seleccionada: \$title'),
  onViewProfile: () => print('Ver perfil premium'),
  onLogout: () => print('Cerrar sesión premium'),
)
          ''',
        ),
      ],
    );
  }

  Widget _buildMenuPreview(BuildContext context, Widget menuWidget) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: _MenuPreviewFullScreen(menuWidget: menuWidget),
    );
  }

  List<MenuLateralItem> _getBasicMenuItems() {
    return [
      // Categorías expandible
      MenuLateralExpandableItem(
        title: 'Categorías',
        children: [
          SubcategoryItem(
            text: 'Vitaminas y más',
            onTap: () {},
            isSelected: false,
            title: Text('Vitaminas y más'),
          ),
          SubcategoryItem(
            text: 'Ofertas del mes',
            onTap: () {},
            isSelected: false,
            title: Text('Ofertas del mes'),
          ),
        ],
      ),
      
      // Elementos simples del menú
      MenuLateralSimpleItem(
        title: 'Mis pedidos',
        isSelected: false,
      ),
      MenuLateralSimpleItem(
        title: 'Métodos de pago',
        isSelected: false,
      ),
      MenuLateralSimpleItem(
        title: 'Direcciones',
        isSelected: false,
      ),
      MenuLateralSimpleItem(
        title: 'Mis listas',
        isSelected: false,
      ),
      MenuLateralSimpleItem(
        title: 'Favoritos',
        isSelected: false,
      ),
      MenuLateralSimpleItem(
        title: 'Soporte a mayorista',
        isSelected: false,
      ),
      MenuLateralSimpleItem(
        title: 'Catálogo',
        isSelected: false,
      ),
    ];
  }
}



/// Widget auxiliar para mostrar el menú lateral a pantalla completa
class _MenuPreviewFullScreen extends StatefulWidget {
  final Widget menuWidget;

  const _MenuPreviewFullScreen({required this.menuWidget});

  @override
  State<_MenuPreviewFullScreen> createState() => _MenuPreviewFullScreenState();
}

class _MenuPreviewFullScreenState extends State<_MenuPreviewFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Botón para abrir el menú
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              _showFullScreenMenu(context);
            },
            icon: const Icon(Icons.menu),
            label: const Text('Toca para abrir el menú lateral'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            ),
          ),
        ),
        
        // Vista previa del menú
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu_open,
                  size: 32,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 12),
                Text(
                  'Presiona el botón para ver el menú lateral',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showFullScreenMenu(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _FullScreenMenuPage(menuWidget: widget.menuWidget),
        fullscreenDialog: true,
      ),
    );
  }
}

/// Página a pantalla completa para mostrar el menú lateral
class _FullScreenMenuPage extends StatelessWidget {
  final Widget menuWidget;

  const _FullScreenMenuPage({required this.menuWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo semi-transparente
          Container(
            color: Colors.black54,
            width: double.infinity,
            height: double.infinity,
          ),
          
          // Menú lateral que abarca toda la pantalla
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // 85% del ancho de la pantalla
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(5, 0),
                    ),
                  ],
                ),
                child: menuWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
