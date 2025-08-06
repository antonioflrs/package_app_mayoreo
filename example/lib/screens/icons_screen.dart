import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../widgets/app_bar_widget.dart';

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
    IconCategory('Navegación', Icons.navigation),
    IconCategory('Usuario', Icons.person),
    IconCategory('Pedidos', Icons.shopping_cart),
    IconCategory('Categorías', Icons.category),
    IconCategory('Favoritos', Icons.favorite),
    IconCategory('Pagos', Icons.payment),
    IconCategory('Social', Icons.share),
    IconCategory('Simbólicos', Icons.star),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Iconos',
        showMenuButton: false,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryFilter(),
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
          hintText: 'Buscar iconos...',
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
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: filteredIcons.length,
      itemBuilder: (context, index) {
        final icon = filteredIcons[index];
        return _buildIconCard(icon);
      },
    );
  }

  Widget _buildIconCard(IconItem icon) {
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
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon.iconData,
                    size: 24,
                    color: AppColors.darkGray,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                icon.name,
                style: AppTypography.labelSmall?.copyWith(
                  color: AppColors.grayMedium,
                ) ?? TextStyle(
                  color: AppColors.grayMedium,
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

  void _showIconDetails(IconItem icon) {
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
                child: Icon(
                  icon.iconData,
                  size: 40,
                  color: AppColors.darkGray,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Categoría: ${icon.category}',
              style: AppTypography.bodyMedium?.copyWith(
                color: AppColors.grayMedium,
              ) ?? TextStyle(
                color: AppColors.grayMedium,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ruta: ${icon.path}',
              style: AppTypography.bodySmall?.copyWith(
                color: AppColors.grayMedium.withValues(alpha: 0.7),
              ) ?? TextStyle(
                color: AppColors.grayMedium.withValues(alpha: 0.7),
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

  List<IconItem> _getFilteredIcons() {
    List<IconItem> allIcons = _getAllIcons();
    
    // Filtrar por categoría
    if (_selectedCategory != 'Todos') {
      allIcons = allIcons.where((icon) => icon.category == _selectedCategory).toList();
    }
    
    // Filtrar por búsqueda
    if (_searchQuery.isNotEmpty) {
      allIcons = allIcons.where((icon) => 
        icon.name.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    
    return allIcons;
  }

  List<IconItem> _getAllIcons() {
    return [
      // Navegación
      IconItem('Menú', 'Icons.menu', 'Navegación'),
      IconItem('Flecha Izquierda', 'Icons.arrow_back', 'Navegación'),
      IconItem('Flecha Abajo', 'Icons.keyboard_arrow_down', 'Navegación'),
      IconItem('Cerrar', 'Icons.close', 'Navegación'),
      IconItem('Verificar', 'Icons.check', 'Navegación'),
      IconItem('Agregar', 'Icons.add', 'Navegación'),
      IconItem('Restaurar', 'Icons.refresh', 'Navegación'),
      
      // Usuario
      IconItem('Usuario Activo', 'Icons.person', 'Usuario'),
      IconItem('Usuario Inactivo', 'Icons.person_outline', 'Usuario'),
      IconItem('Perfil', 'Icons.account_circle', 'Usuario'),
      
      // Pedidos
      IconItem('Pedidos Activo', 'Icons.shopping_cart', 'Pedidos'),
      IconItem('Pedidos Inactivo', 'Icons.shopping_cart_outlined', 'Pedidos'),
      IconItem('Carrito Activo', 'Icons.shopping_bag', 'Pedidos'),
      IconItem('Carrito Inactivo', 'Icons.shopping_bag_outlined', 'Pedidos'),
      
      // Categorías
      IconItem('Categorías Activo', 'Icons.category', 'Categorías'),
      IconItem('Categorías Inactivo', 'Icons.category_outlined', 'Categorías'),
      IconItem('Lista Activa', 'Icons.list', 'Categorías'),
      IconItem('Lista Inactiva', 'Icons.list_outlined', 'Categorías'),
      IconItem('Agregar Nota', 'Icons.note_add', 'Categorías'),
      IconItem('Agregar Nota Stroke', 'Icons.note_add_outlined', 'Categorías'),
      
      // Favoritos
      IconItem('Favoritos Activo', 'Icons.favorite', 'Favoritos'),
      IconItem('Favoritos Inactivo', 'Icons.favorite_border', 'Favoritos'),
      
      // Pagos
      IconItem('Tarjeta Activa', 'Icons.credit_card', 'Pagos'),
      IconItem('Tarjeta Inactiva', 'Icons.credit_card_outlined', 'Pagos'),
      
      // Social
      IconItem('WhatsApp', 'Icons.chat', 'Social'),
    ];
  }
}

class IconCategory {
  final String name;
  final IconData icon;

  IconCategory(this.name, this.icon);
}

class IconItem {
  final String name;
  final String path;
  final String category;

  IconItem(this.name, this.path, this.category);

  IconData get iconData {
    switch (path) {
      case 'Icons.menu': return Icons.menu;
      case 'Icons.arrow_back': return Icons.arrow_back;
      case 'Icons.keyboard_arrow_down': return Icons.keyboard_arrow_down;
      case 'Icons.close': return Icons.close;
      case 'Icons.check': return Icons.check;
      case 'Icons.add': return Icons.add;
      case 'Icons.refresh': return Icons.refresh;
      case 'Icons.person': return Icons.person;
      case 'Icons.person_outline': return Icons.person_outline;
      case 'Icons.account_circle': return Icons.account_circle;
      case 'Icons.shopping_cart': return Icons.shopping_cart;
      case 'Icons.shopping_cart_outlined': return Icons.shopping_cart_outlined;
      case 'Icons.shopping_bag': return Icons.shopping_bag;
      case 'Icons.shopping_bag_outlined': return Icons.shopping_bag_outlined;
      case 'Icons.category': return Icons.category;
      case 'Icons.category_outlined': return Icons.category_outlined;
      case 'Icons.list': return Icons.list;
      case 'Icons.list_outlined': return Icons.list_outlined;
      case 'Icons.note_add': return Icons.note_add;
      case 'Icons.note_add_outlined': return Icons.note_add_outlined;
      case 'Icons.favorite': return Icons.favorite;
      case 'Icons.favorite_border': return Icons.favorite_border;
      case 'Icons.credit_card': return Icons.credit_card;
      case 'Icons.credit_card_outlined': return Icons.credit_card_outlined;
      case 'Icons.chat': return Icons.chat;
      default: return Icons.help_outline;
    }
  }
} 