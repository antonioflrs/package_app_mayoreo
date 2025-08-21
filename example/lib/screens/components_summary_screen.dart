import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import 'component_detail_screen.dart';

class ComponentsSummaryScreen extends StatefulWidget {
  const ComponentsSummaryScreen({super.key});

  @override
  State<ComponentsSummaryScreen> createState() =>
      _ComponentsSummaryScreenState();
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
      appBar: AppBarWidget(title: 'Componentes', showMenuButton: false),
      body: Column(
        children: [
          _buildHeader(),
          _buildCategoryFilter(),
          Expanded(child: _buildComponentsGrid(filteredComponents)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Biblioteca de Componentes',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'Diseñados para el sistema App Mayoreo',
                      style: TextStyle(
                        fontSize: 14,
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
                Icon(Icons.search, size: 16, color: AppColors.grayMedium),
                const SizedBox(width: 8),
                Text(
                  'Buscando: "$_searchQuery"',
                  style: TextStyle(fontSize: 14, color: AppColors.grayMedium),
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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 8),
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
            onTap: () => setState(
              () => _selectedCategory = NavigationCategory.designGuides,
            ),
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            label: 'Componentes UI',
            isSelected: _selectedCategory == NavigationCategory.uiComponents,
            onTap: () => setState(
              () => _selectedCategory = NavigationCategory.uiComponents,
            ),
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
            color: isSelected
                ? AppColors.orangeBrand
                : AppColors.grayMedium.withValues(alpha: 0.3),
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

    return Padding(
      padding: const EdgeInsets.all(8),
      child: _buildMasonryLayout(components),
    );
  }

  Widget _buildMasonryLayout(List<NavigationItem> components) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = 2;
          final crossAxisSpacing = 16.0;
          final mainAxisSpacing = 16.0;
          final availableWidth = constraints.maxWidth;
          final itemWidth =
              (availableWidth - (crossAxisSpacing * (crossAxisCount - 1))) /
              crossAxisCount;

          // Listas para almacenar las alturas de cada columna
          List<double> columnHeights = List.filled(crossAxisCount, 0.0);
          List<List<Widget>> columns = List.generate(
            crossAxisCount,
            (index) => [],
          );

          // Distribuir los componentes en las columnas
          for (int i = 0; i < components.length; i++) {
            // Encontrar la columna con menor altura
            int shortestColumn = 0;
            for (int j = 1; j < crossAxisCount; j++) {
              if (columnHeights[j] < columnHeights[shortestColumn]) {
                shortestColumn = j;
              }
            }

            // Agregar el componente a la columna más corta
            columns[shortestColumn].add(
              Padding(
                padding: EdgeInsets.only(bottom: mainAxisSpacing),
                child: SizedBox(
                  width: itemWidth,
                  child: _buildComponentCard(components[i]),
                ),
              ),
            );

            // Actualizar la altura de la columna (estimación más precisa)
            columnHeights[shortestColumn] +=
                180; // Altura estimada más realista
          }
          // Construir las columnas con IntrinsicHeight para manejar alturas variables
          return Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Primera columna
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: columns[0],
                    ),
                  ),
                  // Gap de 16px entre columnas
                  SizedBox(width: crossAxisSpacing),
                  // Segunda columna
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: columns[1],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildComponentCard(NavigationItem component) {
    return ComponentCard(
      component: component,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ComponentDetailScreen(component: component),
          ),
        );
      },
    );
  }

  // Eliminado: icono y badge individuales ahora los maneja ComponentCard

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: AppColors.grayMedium),
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
            style: TextStyle(fontSize: 14, color: AppColors.darkGray),
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
      allComponents = allComponents
          .where((component) => component.category == _selectedCategory)
          .toList();
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
