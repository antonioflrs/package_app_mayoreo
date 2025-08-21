import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BottomNavigationContent extends StatefulWidget {
  const BottomNavigationContent({super.key});

  @override
  State<BottomNavigationContent> createState() => _BottomNavigationContentState();
}

class _BottomNavigationContentState extends State<BottomNavigationContent> {
  int _currentIndex = 0;

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      examples: [
        ComponentExample(
          id: 'basic_usage',
          title: 'Uso Básico - Diseño Original',
          description: 'Implementación del diseño original proporcionado con bordes redondeados y sombras personalizadas.',
          previewWidget: _buildBasicUsagePreview(),
          codeExample: _getBasicUsageCode(),
        ),
        ComponentExample(
          id: 'different_items',
          title: 'Diferentes Cantidades de Items',
          description: 'Ejemplos de navegación con diferentes cantidades de elementos (3, 4, 5 items).',
          previewWidget: _buildDifferentItemsPreview(),
          codeExample: _getDifferentItemsCode(),
        ),
        ComponentExample(
          id: 'custom_design',
          title: 'Diseño Personalizado',
          description: 'Barra de navegación con bordes redondeados, sombras personalizadas y colores de marca.',
          previewWidget: _buildCustomDesignPreview(),
          codeExample: _getCustomDesignCode(),
        ),
        ComponentExample(
          id: 'interactive_demo',
          title: 'Demo Interactivo',
          description: 'Demostración interactiva de la navegación con iconos dinámicos y estados visuales.',
          previewWidget: _buildInteractiveDemoPreview(),
          codeExample: _getInteractiveDemoCode(),
        ),
        ComponentExample(
          id: 'features_list',
          title: 'Características del Componente',
          description: 'Lista de características y funcionalidades disponibles en el bottom navigation bar.',
          previewWidget: _buildFeaturesListPreview(),
          codeExample: _getFeaturesListCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'selectedIndex',
          type: 'int',
          description: 'Índice del item actualmente seleccionado en la navegación.',
          required: true,
        ),
        ComponentProperty(
          name: 'onItemTapped',
          type: 'ValueChanged<int>',
          description: 'Callback que se ejecuta cuando se toca un item de la navegación.',
          required: true,
        ),
        ComponentProperty(
          name: 'backgroundColor',
          type: 'Color',
          description: 'Color de fondo de la barra de navegación.',
          required: false,
          defaultValue: 'AppColors.white',
        ),
        ComponentProperty(
          name: 'selectedItemColor',
          type: 'Color',
          description: 'Color del item seleccionado.',
          required: false,
          defaultValue: 'AppColors.orangeBrand',
        ),
        ComponentProperty(
          name: 'unselectedItemColor',
          type: 'Color',
          description: 'Color de los items no seleccionados.',
          required: false,
          defaultValue: 'AppColors.black',
        ),
      ],
      usageNotes: '''
El widget BottomNavigation proporciona una barra de navegación inferior personalizada con:

• Bordes redondeados en la parte superior
• Sombras personalizadas con efecto hacia arriba
• Iconos SVG del package con SafeSvgIcon
• Colores de marca configurables
• Estados visuales diferenciados
• Navegación fluida con animaciones
• Diseño responsivo y accesible

Para personalizar los colores, usa las propiedades selectedItemColor y unselectedItemColor.
      ''',
    );
  }

  Widget _buildBasicUsagePreview() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Contenido de la pantalla ${_currentIndex + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          MobileNavigation(
            selectedIndex: _currentIndex,
            onItemTapped: _onNavigationTap,
          ),
        ],
      ),
    );
  }

  Widget _buildDifferentItemsPreview() {
    return Column(
      children: [
        _buildItemCountExample(3, '3 Items'),
        const SizedBox(height: 16),
        _buildItemCountExample(4, '4 Items'),
        const SizedBox(height: 16),
        _buildItemCountExample(5, '5 Items'),
      ],
    );
  }

  Widget _buildItemCountExample(int itemCount, String title) {
    int currentIndex = _currentIndex % itemCount;
    
    return Container(
      height: 126,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backCards,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Item ${currentIndex + 1} de $itemCount',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  _buildCustomBottomNav(itemCount, currentIndex),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomBottomNav(int itemCount, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.orangeBrand,
          unselectedItemColor: AppColors.black,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
          enableFeedback: true,
          items: _getItemsForCount(itemCount),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _getItemsForCount(int count) {
    switch (count) {
      case 3:
        return [
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.blifeLogoInactivo,
              height: 20.0,
              color: _currentIndex % 3 == 0 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.blifeLogoActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.categoriesInactive,
              height: 20.0,
              color: _currentIndex % 3 == 1 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.categoriesActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.userInactivo,
              height: 20.0,
              color: _currentIndex % 3 == 2 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.userActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Perfil',
          ),
        ];
      case 4:
        return [
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.blifeLogoInactivo,
              height: 20.0,
              color: _currentIndex % 4 == 0 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.blifeLogoActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.categoriesInactive,
              height: 20.0,
              color: _currentIndex % 4 == 1 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.categoriesActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.documentInactive,
              height: 20.0,
              color: _currentIndex % 4 == 2 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.documentActive,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Docs',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.userInactivo,
              height: 20.0,
              color: _currentIndex % 4 == 3 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.userActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Perfil',
          ),
        ];
      case 5:
        return [
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.blifeLogoInactivo,
              height: 20.0,
              color: _currentIndex % 5 == 0 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.blifeLogoActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.categoriesInactive,
              height: 20.0,
              color: _currentIndex % 5 == 1 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.categoriesActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.ordesInactivo,
              height: 20.0,
              color: _currentIndex % 5 == 2 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.ordersActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.cartInactivo,
              height: 20.0,
              color: _currentIndex % 5 == 3 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.cartActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: SafeSvgIcon(
              iconPath: PackageIcons.userInactivo,
              height: 20.0,
              color: _currentIndex % 5 == 4 ? AppColors.orangeBrand : AppColors.black,
            ),
            activeIcon: SafeSvgIcon(
              iconPath: PackageIcons.userActivo,
              height: 20.0,
              color: AppColors.orangeBrand,
            ),
            label: 'Perfil',
          ),
        ];
      default:
        return [];
    }
  }

  Widget _buildCustomDesignPreview() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SafeSvgIcon(
                    iconPath: _getCurrentIcon(),
                    height: 48.0,
                    color: AppColors.orangeBrand,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pantalla ${_currentIndex + 1}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MobileNavigation(
            selectedIndex: _currentIndex,
            onItemTapped: _onNavigationTap,
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveDemoPreview() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SafeSvgIcon(
                    iconPath: _getCurrentIcon(),
                    height: 64.0,
                    color: AppColors.orangeBrand,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _getCurrentTitle(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getCurrentDescription(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.grayMedium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  UiButton(
                    onPressed: () {
                      // Acción del botón
                    },
                    label: 'Acción de ${_getCurrentTitle()}',
                    type: UiButtonType.primary,
                  ),
                ],
              ),
            ),
          ),
          MobileNavigation(
            selectedIndex: _currentIndex,
            onItemTapped: _onNavigationTap,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesListPreview() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFeatureItem('🎨 Diseño Personalizado', 'Bordes redondeados y sombras personalizadas'),
          _buildFeatureItem('🎯 Iconos del Package', 'Uso exclusivo de iconos SVG del sistema'),
          _buildFeatureItem('🌈 Colores Personalizables', 'Fácil cambio de colores mediante selectedItemColor y unselectedItemColor'),
          _buildFeatureItem('⚡ Estados Dinámicos', 'Iconos y colores que cambian según el estado'),
          _buildFeatureItem('📱 Responsivo', 'Adaptable a diferentes tamaños de pantalla'),
          _buildFeatureItem('♿ Accesible', 'Soporte para lectores de pantalla y navegación por teclado'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 12),
            decoration: BoxDecoration(
              color: AppColors.orangeBrand,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.grayMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getBasicUsageCode() {
    return '''class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabTapped;

  const BottomNavBar({super.key, required this.onTabTapped});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.orangeBrand,
          unselectedItemColor: AppColors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          iconSize: 24.0,
          items: [
            // Items de navegación
          ],
        ),
      ),
    );
  }
}''';
  }

  String _getDifferentItemsCode() {
    return '''// Ejemplo con 3 items
BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
      icon: SafeSvgIcon(iconPath: PackageIcons.blifeLogoInactivo),
      activeIcon: SafeSvgIcon(iconPath: PackageIcons.blifeLogoActivo),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: SafeSvgIcon(iconPath: PackageIcons.categoriesInactive),
      activeIcon: SafeSvgIcon(iconPath: PackageIcons.categoriesActivo),
      label: 'Tienda',
    ),
    BottomNavigationBarItem(
      icon: SafeSvgIcon(iconPath: PackageIcons.userInactivo),
      activeIcon: SafeSvgIcon(iconPath: PackageIcons.userActivo),
      label: 'Perfil',
    ),
  ],
)

// Ejemplo con 5 items (como el original)
BottomNavigationBar(
  items: [
    // Inicio, Tienda, Pedidos, Carrito, Perfil
  ],
)''';
  }

  String _getCustomDesignCode() {
    return '''Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        spreadRadius: 0,
        blurRadius: 5,
        offset: Offset(0, -1),
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    ),
    child: BottomNavigationBar(
      // Configuración personalizada
    ),
  ),
)''';
  }

  String _getInteractiveDemoCode() {
    return '''// Estados de navegación
int _currentIndex = 0;

void _onNavigationTap(int index) {
  setState(() {
    _currentIndex = index;
  });
}

// Iconos dinámicos según el estado
SafeSvgIcon(
  iconPath: _getCurrentIcon(),
  height: 24.0,
  color: currentIndex == index 
      ? AppColors.orangeBrand 
      : AppColors.black,
)''';
  }

  String _getFeaturesListCode() {
    return '''// Características principales
- Bordes redondeados en la parte superior
- Sombras personalizadas con efecto hacia arriba
- Iconos SVG del package con SafeSvgIcon
- Colores de marca (orangeBrand para activo)
- Estados visuales diferenciados
- Navegación fluida con animaciones
- Diseño responsivo y accesible

// Personalización de colores
selectedItemColor: AppColors.orangeBrand,    // Color del item seleccionado
unselectedItemColor: AppColors.black,        // Color de items no seleccionados

// Ejemplos de colores alternativos:
// selectedItemColor: AppColors.greenFree,
// selectedItemColor: Color(0xFF2196F3),     // Azul personalizado
// unselectedItemColor: AppColors.grayMedium,''';
  }

  String _getCurrentIcon() {
    switch (_currentIndex) {
      case 0:
        return PackageIcons.blifeLogoActivo;
      case 1:
        return PackageIcons.categoriesActivo;
      case 2:
        return PackageIcons.documentActive;
      case 3:
        return PackageIcons.helpActive;
      default:
        return PackageIcons.blifeLogoActivo;
    }
  }

  String _getCurrentTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Componentes';
      case 2:
        return 'Iconos';
      case 3:
        return 'Documentación';
      default:
        return 'Inicio';
    }
  }

  String _getCurrentDescription() {
    switch (_currentIndex) {
      case 0:
        return 'Pantalla principal con acceso rápido a las funcionalidades';
      case 1:
        return 'Explora todos los componentes del sistema de diseño';
      case 2:
        return 'Biblioteca completa de iconos SVG personalizados';
      case 3:
        return 'Documentación y guías de uso del package';
      default:
        return 'Pantalla principal';
    }
  }
}
