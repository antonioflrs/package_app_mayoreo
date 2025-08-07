import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Ejemplos avanzados de uso de iconos del paquete
class AdvancedIconExamples extends StatefulWidget {
  const AdvancedIconExamples({super.key});

  @override
  State<AdvancedIconExamples> createState() => _AdvancedIconExamplesState();
}

class _AdvancedIconExamplesState extends State<AdvancedIconExamples> {
  bool _isLoading = false;
  String _selectedCategory = 'Navegación';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ejemplos Avanzados de Iconos',
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

  /// Ejemplo 1: Selector de iconos por categorías
  Widget _buildExample1() {
    final categories = SvgIcons.getAllIconsByCategory();
    
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
            'Ejemplo 1: Selector de Iconos por Categorías',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.orangeBrand,
            ),
          ),
          const SizedBox(height: 16),
          
          // Selector de categoría
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.silverGrayMedium),
            ),
            child: DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              underline: const SizedBox(),
              items: categories.keys.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(
                    category,
                    style: AppTypography.bodyMedium,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Grid de iconos de la categoría seleccionada
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemCount: categories[_selectedCategory]?.length ?? 0,
            itemBuilder: (context, index) {
              final iconPath = categories[_selectedCategory]![index];
              final iconName = iconPath.split('/').last.replaceAll('.svg', '');
              
              return _buildIconCard(iconPath, iconName);
            },
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
// Obtener iconos por categoría
final categories = SvgIcons.getAllIconsByCategory();

// Usar icono específico
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 32,
  height: 32,
  color: AppColors.orangeBrand,
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

  /// Ejemplo 2: Iconos con estados y animaciones
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
            'Ejemplo 2: Iconos con Estados y Animaciones',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.orangeBrand,
            ),
          ),
          const SizedBox(height: 16),
          
          // Iconos con diferentes estados
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatefulIcon(
                icon: SvgIcons.favoritesActive,
                inactiveIcon: SvgIcons.favoritesInactive,
                label: 'Favorito',
              ),
              _buildStatefulIcon(
                icon: SvgIcons.cartActive,
                inactiveIcon: SvgIcons.cartInactive,
                label: 'Carrito',
              ),
              _buildStatefulIcon(
                icon: SvgIcons.userActive,
                inactiveIcon: SvgIcons.userInactive,
                label: 'Usuario',
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Iconos con animación de carga
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLoadingIcon(
                icon: SvgIcons.ordersActive,
                label: 'Pedidos',
              ),
              _buildLoadingIcon(
                icon: SvgIcons.documentActive,
                label: 'Documentos',
              ),
              _buildLoadingIcon(
                icon: SvgIcons.cardActive,
                label: 'Pagos',
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Botón con icono y loading
          Center(
            child: UiButton(
              onPressed: _isLoading ? null : _toggleLoading,
              label: _isLoading ? 'Procesando...' : 'Procesar Pedido',
              type: UiButtonType.primary,
              icon: _isLoading ? null : Icons.shopping_cart,
              isLoading: _isLoading,
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
// Icono con estado
CustomSvgIcon(
  iconPath: isActive ? SvgIcons.favoritesActive : SvgIcons.favoritesInactive,
  width: 32,
  height: 32,
  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
)

// Icono con animación
AnimatedSwitcher(
  duration: Duration(milliseconds: 300),
  child: CustomSvgIcon(
    key: ValueKey(isLoading),
    iconPath: iconPath,
    width: 32,
    height: 32,
    color: isLoading ? AppColors.grayMedium : AppColors.orangeBrand,
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

  Widget _buildIconCard(String iconPath, String iconName) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgIcon(
            iconPath: iconPath,
            width: 24,
            height: 24,
            color: AppColors.orangeBrand,
          ),
          const SizedBox(height: 4),
          Text(
            iconName,
            style: AppTypography.labelSmall?.copyWith(
              color: AppColors.grayMedium,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStatefulIcon({
    required String icon,
    required String inactiveIcon,
    required String label,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isActive = false;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              isActive = !isActive;
            });
          },
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: CustomSvgIcon(
                  key: ValueKey(isActive),
                  iconPath: isActive ? icon : inactiveIcon,
                  width: 32,
                  height: 32,
                  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTypography.labelSmall?.copyWith(
                  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingIcon({
    required String icon,
    required String label,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isLoading = false;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              isLoading = !isLoading;
            });
            
            if (isLoading) {
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  isLoading = false;
                });
              });
            }
          },
          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isLoading
                    ? SizedBox(
                        key: const ValueKey('loading'),
                        width: 32,
                        height: 32,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.orangeBrand,
                          ),
                        ),
                      )
                    : CustomSvgIcon(
                        key: const ValueKey('icon'),
                        iconPath: icon,
                        width: 32,
                        height: 32,
                        color: AppColors.orangeBrand,
                      ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTypography.labelSmall?.copyWith(
                  color: AppColors.grayMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
    
    if (_isLoading) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }
}
