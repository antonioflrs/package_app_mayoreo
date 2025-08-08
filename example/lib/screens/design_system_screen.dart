import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../widgets/component_viewer.dart';

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
    _selectedItem = DesignSystemData.designGuides.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(
        title: _selectedItem?.title ?? 'B Life Flutter Toolkit',
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onSearchPressed: () => _showGlobalSearch(context),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.grayMedium),
            onPressed: () => _showMenu(context),
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
            _searchQuery = '';
          });
          Navigator.of(context).pop();
        },
        onClose: () {
          setState(() {
            _searchQuery = '';
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

  void _showMenu(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(
                context,
                'Documentación',
                Icons.description,
                () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Documentación próximamente'),
                      duration: Duration(seconds: 1),
                      backgroundColor: AppColors.black,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              _buildMenuItem(
                context,
                'Novedades',
                Icons.newspaper,
                () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Novedades próximamente'),
                      duration: Duration(seconds: 1),
                      backgroundColor: AppColors.black,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 24, color: AppColors.grayMedium),
            const SizedBox(width: 12),
                          Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
} 