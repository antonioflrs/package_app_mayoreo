import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BottomNavigationContent extends StatefulWidget {
  const BottomNavigationContent({super.key});

  @override
  State<BottomNavigationContent> createState() => _BottomNavigationContentState();
}

class _BottomNavigationContentState extends State<BottomNavigationContent> {
  int _currentIndex = 0;
  final Map<String, bool> _showCodeStates = {};

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(theme, 'Bottom Navigation Bar'),
        const SizedBox(height: 16),
        Text(
          'Barra de navegación inferior con diseño personalizado y iconos SVG del package. Incluye bordes redondeados, sombras personalizadas y estados activos/inactivos con colores de marca.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        
        const SizedBox(height: 32),
        _buildBasicUsage(theme),
        
        const SizedBox(height: 32),
        _buildDifferentItemCounts(theme),
        
        const SizedBox(height: 32),
        _buildCustomDesign(theme),
        
        const SizedBox(height: 32),
        _buildInteractiveDemo(theme),
        
        const SizedBox(height: 32),
        _buildFeaturesList(theme),
      ],
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildBasicUsage(ThemeData theme) {
    const codeExample = '''class BottomNavBar extends StatefulWidget {
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

    return _buildExampleContainer(
      theme: theme,
      title: 'Uso Básico - Diseño Original',
      description: 'Implementación del diseño original proporcionado con bordes redondeados y sombras personalizadas.',
      child: Container(
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
                  style: theme.textTheme.titleMedium?.copyWith(
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
      ),
      codeExample: codeExample,
      exampleId: 'basic_usage',
    );
  }

  Widget _buildDifferentItemCounts(ThemeData theme) {
    const codeExample = '''// Ejemplo con 3 items
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

    return _buildExampleContainer(
      theme: theme,
      title: 'Diferentes Cantidades de Items',
      description: 'Ejemplos de navegación con diferentes cantidades de elementos (3, 4, 5 items).',
      child: Column(
        children: [
          _buildItemCountExample(theme, 3, '3 Items'),
          const SizedBox(height: 16),
          _buildItemCountExample(theme, 4, '4 Items'),
          const SizedBox(height: 16),
          _buildItemCountExample(theme, 5, '5 Items'),
        ],
      ),
      codeExample: codeExample,
      exampleId: 'different_items',
    );
  }

  Widget _buildItemCountExample(ThemeData theme, int itemCount, String title) {
    int currentIndex = _currentIndex % itemCount;
    
    return Container(
      height: 120,
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
              style: theme.textTheme.titleSmall?.copyWith(
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
                        style: theme.textTheme.bodySmall?.copyWith(
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

  Widget _buildCustomDesign(ThemeData theme) {
    const codeExample = '''Container(
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

    return _buildExampleContainer(
      theme: theme,
      title: 'Diseño Personalizado',
      description: 'Barra de navegación con bordes redondeados, sombras personalizadas y colores de marca.',
      child: Container(
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
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
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
      ),
      codeExample: codeExample,
      exampleId: 'custom_design',
    );
    }

  Widget _buildInteractiveDemo(theme) {
    const codeExample = '''// Estados de navegación
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

    return _buildExampleContainer(
      theme: theme,
      title: 'Demo Interactivo',
      description: 'Demostración interactiva de la navegación con iconos dinámicos y estados visuales.',
      child: Container(
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
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getCurrentDescription(),
                      style: theme.textTheme.bodyMedium?.copyWith(
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
      ),
      codeExample: codeExample,
      exampleId: 'interactive_demo',
    );
  }

  Widget _buildFeaturesList(ThemeData theme) {
    const codeExample = '''// Características principales
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

    return _buildExampleContainer(
      theme: theme,
      title: 'Características del Componente',
      description: 'Lista de características y funcionalidades disponibles en el bottom navigation bar.',
      child: Container(
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
            _buildFeatureItem(theme, '🎨 Diseño Personalizado', 'Bordes redondeados y sombras personalizadas'),
            _buildFeatureItem(theme, '🎯 Iconos del Package', 'Uso exclusivo de iconos SVG del sistema'),
            _buildFeatureItem(theme, '🌈 Colores Personalizables', 'Fácil cambio de colores mediante selectedItemColor y unselectedItemColor'),
            _buildFeatureItem(theme, '⚡ Estados Dinámicos', 'Iconos y colores que cambian según el estado'),
            _buildFeatureItem(theme, '📱 Responsivo', 'Adaptable a diferentes tamaños de pantalla'),
            _buildFeatureItem(theme, '♿ Accesible', 'Soporte para lectores de pantalla y navegación por teclado'),
          ],
        ),
      ),
      codeExample: codeExample,
      exampleId: 'features_list',
    );
  }

  Widget _buildFeatureItem(ThemeData theme, String title, String description) {
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
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
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

  Widget _buildExampleContainer({
    required ThemeData theme,
    required String title,
    required String description,
    required Widget child,
    required String codeExample,
    required String exampleId,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkGray,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          
          // Toggle tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomTabsWidget(
              tabs: [
                TabItem(
                  id: 'preview',
                  title: 'Vista previa',
                  isSelected: !(_showCodeStates[exampleId] ?? false),
                ),
                TabItem(
                  id: 'code',
                  title: 'Código',
                  isSelected: _showCodeStates[exampleId] ?? false,
                ),
              ],
              variant: TabVariant.underlined,
              onTabChanged: (tabId) {
                setState(() {
                  _showCodeStates[exampleId] = (tabId == 'code');
                });
              },
            ),
          ),
          
          // Content based on toggle
          Padding(
            padding: const EdgeInsets.all(24),
            child: (_showCodeStates[exampleId] ?? false)
                ? _buildCodeSection(theme, codeExample)
                : child,
          ),
        ],
      ),
    );
  }



  Widget _buildCodeSection(ThemeData theme, String codeExample) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
        ),
      ),
      child: Stack(
        children: [
          SelectableText(
            codeExample,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              color: AppColors.black,
              height: 1.4,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _buildCopyButton(theme, codeExample),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyButton(ThemeData theme, String code) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: code));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Código copiado al portapapeles'),
            backgroundColor: AppColors.orangeBrand,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.grayMedium.withValues(alpha: 0.2),
          ),
        ),
        child: Icon(
          Icons.copy,
          size: 16,
          color: AppColors.grayMedium,
        ),
      ),
    );
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
