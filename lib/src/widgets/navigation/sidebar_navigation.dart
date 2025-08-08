import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SidebarNavigation extends StatefulWidget {
  final NavigationItem? selectedItem;
  final String searchQuery;
  final Function(String) onSearchChanged;
  final Function(NavigationItem) onItemSelected;
  final VoidCallback? onClose;

  const SidebarNavigation({
    super.key,
    this.selectedItem,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.onItemSelected,
    this.onClose,
  });

  @override
  State<SidebarNavigation> createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends State<SidebarNavigation> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchQuery;
  }

  @override
  void didUpdateWidget(SidebarNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      _searchController.text = widget.searchQuery;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filteredItems = DesignSystemData.searchItems(widget.searchQuery);
    
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          _buildHeader(theme),
          _buildSearchBar(theme),
          _buildVersionSelector(theme),
          Expanded(
            child: _buildNavigationItems(theme, filteredItems),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.widgets,
              size: 20,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'App Mayoreo Toolkit',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
              widget.onClose?.call();
            },
            tooltip: 'Cerrar menú',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        onChanged: widget.onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Buscar en ToolKit',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: AppColors.black,
          ),
          prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.black),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: () {
                    _searchController.clear();
                    widget.onSearchChanged('');
                    _searchFocusNode.requestFocus();
                  },
                  tooltip: 'Limpiar búsqueda',
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.backCards,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '⌘K',
                  style: theme.textTheme.labelSmall?.copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: AppColors.backCards,
        ),
      ),
    );
  }

  Widget _buildVersionSelector(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.widgets,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Componentes v1.0.0',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItems(ThemeData theme, List<NavigationItem> items) {
    if (items.isEmpty && widget.searchQuery.isNotEmpty) {
      return _buildEmptySearch(theme);
    }

    final designGuides = items.where((item) => item.category == NavigationCategory.designGuides).toList();
    final uiComponents = items.where((item) => item.category == NavigationCategory.uiComponents).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (designGuides.isNotEmpty) ...[
          _buildCategoryHeader(theme, 'Guias de diseño'),
          const SizedBox(height: 8),
          ...designGuides.map((item) => _buildNavigationItem(theme, item)),
          const SizedBox(height: 24),
        ],
        if (uiComponents.isNotEmpty) ...[
          _buildCategoryHeader(theme, 'UI'),
          const SizedBox(height: 8),
          ...uiComponents.map((item) => _buildNavigationItem(theme, item)),
        ],
      ],
    );
  }

  Widget _buildEmptySearch(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No se encontraron resultados',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Intenta con otros términos de búsqueda',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildNavigationItem(ThemeData theme, NavigationItem item) {
    final isSelected = widget.selectedItem?.id == item.id;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: AppColors.white,
        child: InkWell(
          onTap: () {
            widget.onItemSelected(item);
            Navigator.of(context).pop();
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected 
                  ? theme.colorScheme.primaryContainer
                  : AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _buildIcon(theme, item, isSelected),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isSelected 
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(ThemeData theme, NavigationItem item, bool isSelected) {
    final iconColor = isSelected 
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;

    switch (item.iconType) {
      case IconType.material:
        return Icon(
          item.icon,
          size: 18,
          color: iconColor,
        );
      case IconType.svg:
        // Fallback to a default icon for SVG types
        return Icon(
          Icons.help_outline,
          size: 18,
          color: iconColor,
        );
    }
  }
} 