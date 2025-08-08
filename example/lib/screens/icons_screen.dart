import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../widgets/app_bar_widget.dart';

// Clase para mapear iconos directamente a PackageIcons
class PackageIconMapper {
  static String? getPackageIconPath(String iconName) {
    // Mapeo directo de nombres de iconos a PackageIcons
    final Map<String, String> iconMapping = {
      // BLife Icons
      'bToolkitCopia': PackageIcons.bToolkitCopia,
      'colors': PackageIcons.colors,
      'blifeLogoActivo': PackageIcons.blifeLogoActivo,
      'blifeLogoInactivo': PackageIcons.blifeLogoInactivo,
      
      // Filled Icons
      'userActivo': PackageIcons.userActivo,
      'ubicationActive': PackageIcons.ubicationActive,
      'ubicationInactive': PackageIcons.ubicationInactive,
      'pedidosActive': PackageIcons.pedidosActive,
      'pedidosInactive': PackageIcons.pedidosInactive,
      'ordersActivo': PackageIcons.ordersActivo,
      'mailIcon': PackageIcons.mailIcon,
      'listActive': PackageIcons.listActive,
      'listInactive': PackageIcons.listInactive,
      'helpActive': PackageIcons.helpActive,
      'helpInactive': PackageIcons.helpInactive,
      'favoritesActivo': PackageIcons.favoritesActivo,
      'favActive': PackageIcons.favActive,
      'favInactive': PackageIcons.favInactive,
      'documentActive': PackageIcons.documentActive,
      'documentInactive': PackageIcons.documentInactive,
      'categoriesActivo': PackageIcons.categoriesActivo,
      'cartActivo': PackageIcons.cartActivo,
      'cardActive': PackageIcons.cardActive,
      'cardInactive': PackageIcons.cardInactive,
      'appleLogo': PackageIcons.appleLogo,
      
      // Stroke Icons
      'zIndex': PackageIcons.zIndex,
      'userInactivo': PackageIcons.userInactivo,
      'tipography': PackageIcons.tipography,
      'shareIcon': PackageIcons.shareIcon,
      'shadow': PackageIcons.shadow,
      'rest': PackageIcons.rest,
      'plusIcon': PackageIcons.plusIcon,
      'ordesInactivo': PackageIcons.ordesInactivo,
      'icon': PackageIcons.icon,
      'hugeiconsNoteAdd': PackageIcons.hugeiconsNoteAdd,
      'favoritesInactivo': PackageIcons.favoritesInactivo,
      'espaciados': PackageIcons.espaciados,
      'delete': PackageIcons.delete,
      'strokeColors': PackageIcons.strokeColors,
      'close': PackageIcons.close,
      'check': PackageIcons.check,
      'categoriesInactive': PackageIcons.categoriesInactive,
      'cartInactivo': PackageIcons.cartInactivo,
      'burguerIcon': PackageIcons.burguerIcon,
      'breakpoints': PackageIcons.breakpoints,
      'arrowLeft': PackageIcons.arrowLeft,
      'arrowDown': PackageIcons.arrowDown,
      'alertIcon': PackageIcons.alertIcon,
      
      // Social Icons
      'whatsappLogo': PackageIcons.whatsappLogo,
      
      // Custom Icons
      'promotions': PackageIcons.promotions,
    };
    
    return iconMapping[iconName];
  }
  
  static bool hasPackageIcon(String iconName) {
    return getPackageIconPath(iconName) != null;
  }
}

class IconsScreen extends StatefulWidget {
  const IconsScreen({super.key});

  @override
  State<IconsScreen> createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Todos';

  final List<IconCategory> _categories = [
    IconCategory('Todos', Icons.all_inclusive),
    IconCategory('BLife Icons', Icons.branding_watermark),
    IconCategory('Filled Icons', Icons.radio_button_checked),
    IconCategory('Stroke Icons', Icons.radio_button_unchecked),
    IconCategory('Social Icons', Icons.share),
    IconCategory('Custom Icons', Icons.extension),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Iconos SVG',
        showMenuButton: false,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
          _buildLegend(),
          _buildIconStats(),
          Expanded(
            child: _buildIconsGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Buscar iconos SVG...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.orangeBrand,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: AppColors.backCards,
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category.name;
          
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category.icon,
                    size: 16,
                    color: isSelected ? Colors.white : AppColors.grayMedium,
                  ),
                  const SizedBox(width: 4),
                  Text(category.name),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category.name;
                });
              },
              backgroundColor: AppColors.backCards,
              selectedColor: AppColors.orangeBrand,
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.grayMedium,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegend() {
    final packageIconCount = _getPackageIconCount();
    final totalIconCount = _getTotalIconCount();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.orangeBrand,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'PI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'PackageIcon (Material Design Style) - $totalIconCount iconos',
                style: AppTypography.bodySmall?.copyWith(
                  color: AppColors.grayMedium,
                ) ?? TextStyle(
                  color: AppColors.grayMedium,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Total: $totalIconCount iconos disponibles',
            style: AppTypography.bodySmall?.copyWith(
              color: AppColors.orangeBrand,
              fontWeight: FontWeight.w600,
            ) ?? TextStyle(
              color: AppColors.orangeBrand,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  int _getPackageIconCount() {
    final allIcons = _getAvailableIcons();
    return allIcons.where((icon) => PackageIconMapper.hasPackageIcon(icon.name)).length;
  }

  int _getTotalIconCount() {
    return _getAvailableIcons().length;
  }

  List<SvgIconData> _getAvailableIcons() {
    return [
      // BLife Icons
      SvgIconData('bToolkitCopia', PackageIcons.bToolkitCopia),
      SvgIconData('colors', PackageIcons.colors),
      SvgIconData('blifeLogoActivo', PackageIcons.blifeLogoActivo),
      SvgIconData('blifeLogoInactivo', PackageIcons.blifeLogoInactivo),
      
      // Filled Icons
      SvgIconData('userActivo', PackageIcons.userActivo),
      SvgIconData('ubicationActive', PackageIcons.ubicationActive),
      SvgIconData('ubicationInactive', PackageIcons.ubicationInactive),
      SvgIconData('pedidosActive', PackageIcons.pedidosActive),
      SvgIconData('pedidosInactive', PackageIcons.pedidosInactive),
      SvgIconData('ordersActivo', PackageIcons.ordersActivo),
      SvgIconData('mailIcon', PackageIcons.mailIcon),
      SvgIconData('listActive', PackageIcons.listActive),
      SvgIconData('listInactive', PackageIcons.listInactive),
      SvgIconData('helpActive', PackageIcons.helpActive),
      SvgIconData('helpInactive', PackageIcons.helpInactive),
      SvgIconData('favoritesActivo', PackageIcons.favoritesActivo),
      SvgIconData('favActive', PackageIcons.favActive),
      SvgIconData('favInactive', PackageIcons.favInactive),
      SvgIconData('documentActive', PackageIcons.documentActive),
      SvgIconData('documentInactive', PackageIcons.documentInactive),
      SvgIconData('categoriesActivo', PackageIcons.categoriesActivo),
      SvgIconData('cartActivo', PackageIcons.cartActivo),
      SvgIconData('cardActive', PackageIcons.cardActive),
      SvgIconData('cardInactive', PackageIcons.cardInactive),
      SvgIconData('appleLogo', PackageIcons.appleLogo),
      
      // Stroke Icons
      SvgIconData('zIndex', PackageIcons.zIndex),
      SvgIconData('userInactivo', PackageIcons.userInactivo),
      SvgIconData('tipography', PackageIcons.tipography),
      SvgIconData('shareIcon', PackageIcons.shareIcon),
      SvgIconData('shadow', PackageIcons.shadow),
      SvgIconData('rest', PackageIcons.rest),
      SvgIconData('plusIcon', PackageIcons.plusIcon),
      SvgIconData('ordesInactivo', PackageIcons.ordesInactivo),
      SvgIconData('icon', PackageIcons.icon),
      SvgIconData('hugeiconsNoteAdd', PackageIcons.hugeiconsNoteAdd),
      SvgIconData('favoritesInactivo', PackageIcons.favoritesInactivo),
      SvgIconData('espaciados', PackageIcons.espaciados),
      SvgIconData('delete', PackageIcons.delete),
      SvgIconData('strokeColors', PackageIcons.strokeColors),
      SvgIconData('close', PackageIcons.close),
      SvgIconData('check', PackageIcons.check),
      SvgIconData('categoriesInactive', PackageIcons.categoriesInactive),
      SvgIconData('cartInactivo', PackageIcons.cartInactivo),
      SvgIconData('burguerIcon', PackageIcons.burguerIcon),
      SvgIconData('breakpoints', PackageIcons.breakpoints),
      SvgIconData('arrowLeft', PackageIcons.arrowLeft),
      SvgIconData('arrowDown', PackageIcons.arrowDown),
      SvgIconData('alertIcon', PackageIcons.alertIcon),
      
      // Social Icons
      SvgIconData('whatsappLogo', PackageIcons.whatsappLogo),
      
      // Custom Icons
      SvgIconData('promotions', PackageIcons.promotions),
    ];
  }

  Widget _buildIconStats() {
    final totalIconCount = _getTotalIconCount();
    final percentage = 100; // All icons are now PackageIcons
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.analytics,
            color: AppColors.orangeBrand,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estado de Migración de Iconos',
                  style: AppTypography.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                  ) ?? TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$totalIconCount iconos disponibles ($percentage% migrados)',
                  style: AppTypography.bodySmall?.copyWith(
                    color: AppColors.grayMedium,
                  ) ?? TextStyle(
                    color: AppColors.grayMedium,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: percentage >= 80 
                  ? Colors.green 
                  : percentage >= 50 
                      ? Colors.orange 
                      : Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$percentage%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconsGrid() {
    final filteredIcons = _getFilteredIcons();
    
    if (filteredIcons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: AppColors.grayMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'No se encontraron iconos',
              style: AppTypography.titleMedium?.copyWith(
                color: AppColors.grayMedium,
              ) ?? TextStyle(
                color: AppColors.grayMedium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Intenta con otros términos de búsqueda',
              style: AppTypography.bodyMedium?.copyWith(
                color: AppColors.grayMedium.withValues(alpha: 0.7),
              ) ?? TextStyle(
                color: AppColors.grayMedium.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: filteredIcons.length,
      itemBuilder: (context, index) {
        final icon = filteredIcons[index];
        return _buildIconCard(icon);
      },
    );
  }

  Widget _buildIconCard(SvgIconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
        ),
      ),
      child: InkWell(
        onTap: () => _showIconDetails(icon),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Center(
                      child: _buildIconWidget(icon.path),
                    ),
                  ),
                  // Badge para indicar el tipo de icono
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.orangeBrand,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'PI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                icon.name,
                style: AppTypography.labelSmall?.copyWith(
                  color: AppColors.grayMedium,
                  fontSize: 12,
                ) ?? TextStyle(
                  color: AppColors.grayMedium,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<SvgIconData> _getFilteredIcons() {
    List<SvgIconData> allIcons = _getAvailableIcons();
    
    // Filtrar por categoría
    if (_selectedCategory == 'BLife Icons') {
      allIcons = allIcons.where((icon) => 
        icon.name == 'bToolkitCopia' || 
        icon.name == 'colors' || 
        icon.name == 'blifeLogoActivo' || 
        icon.name == 'blifeLogoInactivo'
      ).toList();
    } else if (_selectedCategory == 'Filled Icons') {
      allIcons = allIcons.where((icon) => 
        icon.name == 'userActivo' ||
        icon.name == 'ubicationActive' ||
        icon.name == 'ubicationInactive' ||
        icon.name == 'pedidosActive' ||
        icon.name == 'pedidosInactive' ||
        icon.name == 'ordersActivo' ||
        icon.name == 'mailIcon' ||
        icon.name == 'listActive' ||
        icon.name == 'listInactive' ||
        icon.name == 'helpActive' ||
        icon.name == 'helpInactive' ||
        icon.name == 'favoritesActivo' ||
        icon.name == 'favActive' ||
        icon.name == 'favInactive' ||
        icon.name == 'documentActive' ||
        icon.name == 'documentInactive' ||
        icon.name == 'categoriesActivo' ||
        icon.name == 'cartActivo' ||
        icon.name == 'cardActive' ||
        icon.name == 'cardInactive' ||
        icon.name == 'appleLogo'
      ).toList();
    } else if (_selectedCategory == 'Stroke Icons') {
      allIcons = allIcons.where((icon) => 
        icon.name == 'zIndex' ||
        icon.name == 'userInactivo' ||
        icon.name == 'tipography' ||
        icon.name == 'shareIcon' ||
        icon.name == 'shadow' ||
        icon.name == 'rest' ||
        icon.name == 'plusIcon' ||
        icon.name == 'ordesInactivo' ||
        icon.name == 'icon' ||
        icon.name == 'hugeiconsNoteAdd' ||
        icon.name == 'favoritesInactivo' ||
        icon.name == 'espaciados' ||
        icon.name == 'delete' ||
        icon.name == 'strokeColors' ||
        icon.name == 'close' ||
        icon.name == 'check' ||
        icon.name == 'categoriesInactive' ||
        icon.name == 'cartInactivo' ||
        icon.name == 'burguerIcon' ||
        icon.name == 'breakpoints' ||
        icon.name == 'arrowLeft' ||
        icon.name == 'arrowDown' ||
        icon.name == 'alertIcon'
      ).toList();
    } else if (_selectedCategory == 'Social Icons') {
      allIcons = allIcons.where((icon) => 
        icon.name == 'whatsappLogo'
      ).toList();
    } else if (_selectedCategory == 'Custom Icons') {
      allIcons = allIcons.where((icon) => 
        icon.name == 'promotions'
      ).toList();
    }
    
    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      allIcons = allIcons.where((icon) => 
        icon.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        icon.path.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    
    return allIcons;
  }

  Widget _buildIconWidget(String iconPath) {
    // Usar PackageIcon para todos los iconos
    final packageIconPath = PackageIconMapper.getPackageIconPath(iconPath);
    if (packageIconPath != null) {
      // Verificar si el icono termina en _active.svg para mostrar color original
      final isActiveIcon = packageIconPath.contains('_active.svg');
      return PackageIcon(
        iconPath: packageIconPath,
        size: 32,
        color: isActiveIcon ? null : AppColors.darkGray, // null = color original del SVG
      );
    }
    
    // Fallback si no hay PackageIcon disponible
    final isActiveIcon = iconPath.contains('_active.svg');
    return PackageIcon(
      iconPath: iconPath,
      size: 32,
      color: isActiveIcon ? null : AppColors.darkGray, // null = color original del SVG
      fallback: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.grayMedium.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.image_not_supported,
          size: 20,
          color: AppColors.grayMedium,
        ),
      ),
    );
  }

  void _showIconDetails(SvgIconData icon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(icon.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.backCards,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
                ),
              ),
              child: Center(
                child: _buildIconWidget(icon.path),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Ruta: ${icon.path}',
              style: AppTypography.bodySmall?.copyWith(
                color: AppColors.grayMedium.withValues(alpha: 0.7),
              ) ?? TextStyle(
                color: AppColors.grayMedium.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.softGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Código de uso:',
                    style: AppTypography.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGray,
                    ) ?? TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGray,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getIconCodeExample(icon.path),
                    style: AppTypography.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                      color: AppColors.darkGray,
                    ) ?? TextStyle(
                      fontFamily: 'monospace',
                      color: AppColors.darkGray,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.orangeBrand,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'PackageIcon (Recomendado)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  String _getIconCodeExample(String iconPath) {
    final packageIconPath = PackageIconMapper.getPackageIconPath(iconPath);
    final isActiveIcon = (packageIconPath ?? iconPath).contains('_active.svg');
    final colorParam = isActiveIcon ? '  // color: null (color original del SVG)' : '  color: AppColors.darkGray,';
    
    if (packageIconPath != null) {
      return 'PackageIcon(\n  iconPath: PackageIcons.${_getPackageIconName(packageIconPath)},\n  size: 32,\n$colorParam\n)';
    }
    return 'PackageIcon(\n  iconPath: "$iconPath",\n  size: 32,\n$colorParam\n)';
  }

  String _getPackageIconName(String packageIconPath) {
    // Extraer el nombre del icono de la ruta
    final parts = packageIconPath.split('/');
    final fileName = parts.last.replaceAll('.svg', '');
    
    // Convertir snake_case a camelCase
    final words = fileName.split('_');
    if (words.length == 1) {
      return words[0];
    }
    
    return words[0] + words.skip(1).map((word) => 
      word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : ''
    ).join('');
  }
}

class IconCategory {
  final String name;
  final IconData icon;

  IconCategory(this.name, this.icon);
} 