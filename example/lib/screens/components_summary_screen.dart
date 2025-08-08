import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../widgets/app_bar_widget.dart';
import '../data/design_system_data.dart';
import '../models/navigation_item.dart';
import 'component_detail_screen.dart';

class ComponentsSummaryScreen extends StatefulWidget {
  const ComponentsSummaryScreen({super.key});

  @override
  State<ComponentsSummaryScreen> createState() => _ComponentsSummaryScreenState();
}

class _ComponentsSummaryScreenState extends State<ComponentsSummaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  NavigationCategory? _selectedCategory;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredComponents = _getFilteredComponents();

    return Scaffold(
      backgroundColor: AppColors.softGray,
      appBar: AppBarWidget(
        title: 'Componentes',
        showMenuButton: false,
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildCategoryFilter(),
          Expanded(
            child: _buildComponentsGrid(filteredComponents),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.orangeBrand,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.widgets,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Biblioteca de Componentes',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Explora todos los componentes del sistema de diseño',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGray,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_searchQuery.isNotEmpty) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.search,
                  size: 16,
                  color: AppColors.grayMedium,
                ),
                const SizedBox(width: 8),
                Text(
                  'Buscando: "$_searchQuery"',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grayMedium,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _searchQuery = '';
                      _searchController.clear();
                    });
                  },
                  child: const Text('Limpiar'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildFilterChip(
            label: 'Todos',
            isSelected: _selectedCategory == null,
            onTap: () => setState(() => _selectedCategory = null),
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            label: 'Guías de Diseño',
            isSelected: _selectedCategory == NavigationCategory.designGuides,
            onTap: () => setState(() => _selectedCategory = NavigationCategory.designGuides),
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            label: 'Componentes UI',
            isSelected: _selectedCategory == NavigationCategory.uiComponents,
            onTap: () => setState(() => _selectedCategory = NavigationCategory.uiComponents),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orangeBrand : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.orangeBrand : AppColors.grayMedium.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.white : AppColors.darkGray,
          ),
        ),
      ),
    );
  }

  Widget _buildComponentsGrid(List<NavigationItem> components) {
    if (components.isEmpty) {
      return _buildEmptyState();
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: components.length,
      itemBuilder: (context, index) {
        return _buildComponentCard(components[index]);
      },
    );
  }

  Widget _buildComponentCard(NavigationItem component) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ComponentDetailScreen(component: component),
          ),
        );
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon and Category Badge
              Row(
                children: [
                  _buildComponentIcon(component),
                  const Spacer(),
                  _buildCategoryBadge(component.category),
                ],
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                component.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Description
              Expanded(
                child: Text(
                  component.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGray,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),
              // CTA Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ComponentDetailScreen(component: component),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orangeBrand,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Ver Detalles',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComponentIcon(NavigationItem component) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: component.category == NavigationCategory.designGuides
            ? AppColors.orangeBrand.withValues(alpha: 0.1)
            : AppColors.greenFree.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: component.iconType == IconType.material
            ? Icon(
                component.icon,
                size: 20,
                color: component.category == NavigationCategory.designGuides
                    ? AppColors.orangeBrand
                    : AppColors.greenFree,
              )
            : Icon(
                Icons.widgets,
                size: 20,
                color: component.category == NavigationCategory.designGuides
                    ? AppColors.orangeBrand
                    : AppColors.greenFree,
              ),
      ),
    );
  }

  Widget _buildCategoryBadge(NavigationCategory category) {
    final categoryText = category == NavigationCategory.designGuides
        ? 'Guía'
        : 'UI';
    
    final categoryColor = category == NavigationCategory.designGuides
        ? AppColors.orangeBrand
        : AppColors.greenFree;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: categoryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: categoryColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        categoryText,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: categoryColor,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
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
            'No se encontraron componentes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Intenta con otros términos de búsqueda',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _searchQuery = '';
                _selectedCategory = null;
                _searchController.clear();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orangeBrand,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Limpiar Filtros'),
          ),
        ],
      ),
    );
  }

  List<NavigationItem> _getFilteredComponents() {
    List<NavigationItem> allComponents = DesignSystemData.getAllItems();
    
    // Filter by category
    if (_selectedCategory != null) {
      allComponents = allComponents.where(
        (component) => component.category == _selectedCategory
      ).toList();
    }
    
    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      allComponents = allComponents.where((component) {
        final query = _searchQuery.toLowerCase();
        return component.title.toLowerCase().contains(query) ||
               component.description.toLowerCase().contains(query);
      }).toList();
    }
    
    return allComponents;
  }
} 