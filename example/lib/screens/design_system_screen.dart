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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Seleccionar el primer elemento por defecto
    _selectedItem = DesignSystemData.designGuides.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          _selectedItem?.title ?? 'B Life Flutter Toolkit',
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
              _scaffoldKey.currentState?.openDrawer();
            },
            tooltip: 'Abrir menú',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showGlobalSearch(context);
            },
            tooltip: 'Búsqueda global',
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
            _searchQuery = ''; // Limpiar búsqueda al seleccionar
          });
          // Cerrar el drawer después de seleccionar un item
          Navigator.of(context).pop();
        },
        onClose: () {
          // Callback adicional para manejo de cierre
          setState(() {
            _searchQuery = ''; // Limpiar búsqueda al cerrar
          });
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
          onSubmitted: (query) {
            Navigator.of(context).pop();
            if (query.isNotEmpty) {
              _scaffoldKey.currentState?.openDrawer();
            }
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
              if (_searchQuery.isNotEmpty) {
                _scaffoldKey.currentState?.openDrawer();
              }
            },
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }
} 