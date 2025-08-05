import 'package:flutter/material.dart';
import '../widgets/sidebar_navigation.dart';
import '../widgets/component_viewer.dart';
import '../data/design_system_data.dart';
import '../models/navigation_item.dart';

class DesignSystemScreen extends StatefulWidget {
  const DesignSystemScreen({super.key});

  @override
  State<DesignSystemScreen> createState() => _DesignSystemScreenState();
}

class _DesignSystemScreenState extends State<DesignSystemScreen> {
  NavigationItem? _selectedItem;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Seleccionar el primer elemento por defecto
    _selectedItem = DesignSystemData.designGuides.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedItem?.title ?? 'App Mayoreo Toolkit',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showGlobalSearch(context);
            },
          ),
        ],
      ),
      drawer: SidebarNavigation(
        selectedItem: _selectedItem,
        searchQuery: _searchQuery,
        onSearchChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
        onItemSelected: (item) {
          setState(() {
            _selectedItem = item;
          });
          // Cerrar el drawer después de seleccionar un item
          Navigator.of(context).pop();
        },
      ),
      body: _selectedItem != null
          ? ComponentViewer(item: _selectedItem!)
          : const Center(
              child: Text('Selecciona un componente para ver su documentación'),
            ),
    );
  }

  void _showGlobalSearch(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Búsqueda Global'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Buscar componentes...',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // El drawer se abrirá automáticamente si hay resultados
            },
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }
} 