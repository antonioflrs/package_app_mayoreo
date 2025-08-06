import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class IconsContent extends StatefulWidget {
  const IconsContent({super.key});

  @override
  State<IconsContent> createState() => _IconsContentState();
}

class _IconsContentState extends State<IconsContent> {
  String _searchQuery = '';
  String _selectedCategory = 'Todos';

  @override
  Widget build(BuildContext context) {
    final iconsByCategory = _getMockIconsByCategory();
    final categories = ['Todos', ...iconsByCategory.keys];
    
    final filteredIcons = _getFilteredIcons(iconsByCategory);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 32),
          _buildSearchAndFilter(categories),
          const SizedBox(height: 24),
          _buildIconsGrid(filteredIcons),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biblioteca de Material Icons',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Colección organizada de Material Icons para el sistema de diseño. Los iconos están agrupados por categorías y funcionalidad.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildUsageExample(),
      ],
    );
  }

  Widget _buildUsageExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ejemplo de uso:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\nIcon(SvgIcons.getMaterialIcon(SvgIcons.burgerMenu))\nIcon(SvgIcons.getMaterialIcon(SvgIcons.userActive))\nIcon(Icons.widgets)',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'monospace',
              backgroundColor: Theme.of(context).colorScheme.surface,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter(List<String> categories) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar iconos...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButton<String>(
            value: _selectedCategory,
            underline: const SizedBox(),
            items: categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIconsGrid(Map<String, List<String>> filteredIcons) {
    if (filteredIcons.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No se encontraron iconos',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Intenta con otros términos de búsqueda',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: filteredIcons.entries.map((entry) {
        return _buildCategorySection(entry.key, entry.value);
      }).toList(),
    );
  }

  Widget _buildCategorySection(String category, List<String> icons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return _buildIconCard(icons[index]);
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildIconCard(String iconPath) {
    final iconName = _getIconName(iconPath);
    
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _showIconDetails(iconPath, iconName),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono Material
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  _getIconData(iconPath),
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                iconName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
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

  String _getIconName(String iconPath) {
    // Para Material Icons, el path ya es el nombre
    if (iconPath.startsWith('Icons.')) {
      return iconPath.replaceAll('Icons.', '').replaceAll('_', ' ');
    }
    
    // Para rutas SVG (fallback)
    final fileName = iconPath.split('/').last;
    final nameWithoutExtension = fileName.replaceAll('.svg', '');
    
    // Convertir snake_case a camelCase y hacer más legible
    final words = nameWithoutExtension.split('_');
    final capitalizedWords = words.map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    });
    
    return capitalizedWords.join(' ');
  }

  Map<String, List<String>> _getFilteredIcons(Map<String, List<String>> allIcons) {
    Map<String, List<String>> filtered = {};
    
    for (final entry in allIcons.entries) {
      final category = entry.key;
      final icons = entry.value;
      
      // Filtrar por categoría
      if (_selectedCategory != 'Todos' && category != _selectedCategory) {
        continue;
      }
      
      // Filtrar por búsqueda
      final filteredIcons = icons.where((icon) {
        final iconName = _getIconName(icon).toLowerCase();
        return iconName.contains(_searchQuery.toLowerCase()) || 
               icon.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
      
      if (filteredIcons.isNotEmpty) {
        filtered[category] = filteredIcons;
      }
    }
    
    return filtered;
  }

  void _showIconDetails(String iconPath, String iconName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Icono: $iconName'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono Material
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getIconData(iconName),
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'SvgIcons.$iconName',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Path: $iconPath',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                color: Theme.of(context).colorScheme.onSurfaceVariant,
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

  IconData _getIconData(String iconName) {
    // Mapeo de nombres de iconos a IconData
    final iconMap = {
      'Icons.menu': Icons.menu,
      'Icons.arrow_back': Icons.arrow_back,
      'Icons.keyboard_arrow_down': Icons.keyboard_arrow_down,
      'Icons.close': Icons.close,
      'Icons.check': Icons.check,
      'Icons.add': Icons.add,
      'Icons.refresh': Icons.refresh,
      'Icons.person': Icons.person,
      'Icons.person_outline': Icons.person_outline,
      'Icons.account_circle': Icons.account_circle,
      'Icons.shopping_cart': Icons.shopping_cart,
      'Icons.shopping_cart_outlined': Icons.shopping_cart_outlined,
      'Icons.shopping_bag': Icons.shopping_bag,
      'Icons.shopping_bag_outlined': Icons.shopping_bag_outlined,
      'Icons.category': Icons.category,
      'Icons.category_outlined': Icons.category_outlined,
      'Icons.list': Icons.list,
      'Icons.list_outlined': Icons.list_outlined,
      'Icons.note_add': Icons.note_add,
      'Icons.note_add_outlined': Icons.note_add_outlined,
      'Icons.favorite': Icons.favorite,
      'Icons.favorite_border': Icons.favorite_border,
      'Icons.credit_card': Icons.credit_card,
      'Icons.credit_card_outlined': Icons.credit_card_outlined,
      'Icons.chat': Icons.chat,
      'Icons.share': Icons.share,
      'Icons.mail': Icons.mail,
    };
    
    return iconMap[iconName] ?? Icons.help_outline;
  }

  Map<String, List<String>> _getMockIconsByCategory() {
    return {
      'Navegación': [
        'Icons.menu',
        'Icons.arrow_back',
        'Icons.keyboard_arrow_down',
        'Icons.close',
        'Icons.check',
        'Icons.add',
        'Icons.refresh',
      ],
      'Usuario': [
        'Icons.person',
        'Icons.person_outline',
        'Icons.account_circle',
      ],
      'Pedidos': [
        'Icons.shopping_cart',
        'Icons.shopping_cart_outlined',
        'Icons.shopping_bag',
        'Icons.shopping_bag_outlined',
      ],
      'Categorías': [
        'Icons.category',
        'Icons.category_outlined',
        'Icons.list',
        'Icons.list_outlined',
        'Icons.note_add',
        'Icons.note_add_outlined',
      ],
      'Favoritos': [
        'Icons.favorite',
        'Icons.favorite_border',
      ],
      'Pagos': [
        'Icons.credit_card',
        'Icons.credit_card_outlined',
      ],
      'Social': [
        'Icons.chat',
        'Icons.share',
        'Icons.mail',
      ],
    };
  }
} 