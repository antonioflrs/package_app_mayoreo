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
          ? Column(
              children: [
                _buildComponentHeader(),
                Expanded(
                  child: ComponentViewer(item: _selectedItem!),
                ),
              ],
            )
          : const Center(
              child: Text('Selecciona un componente para ver su documentación'),
            ),
    );
  }

  Widget _buildComponentHeader() {
    if (_selectedItem == null) return const SizedBox.shrink();
    
    final isDesignGuide = DesignSystemData.designGuides.contains(_selectedItem);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _selectedItem!.icon ?? Icons.widgets,
                color: AppColors.orangeBrand,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  _selectedItem!.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _selectedItem!.description,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          // Badges informativos
          Row(
            children: [
              CategoryBadge(
                text: isDesignGuide ? 'Token' : 'Componente',
                color: isDesignGuide ? AppColors.oliveBrand : AppColors.ochreBrand,
                size: BadgeSize.small,
              ),
              const SizedBox(width: 8),
              StatusBadge(
                text: 'Disponible',
                color: AppColors.greenFree,
                size: BadgeSize.small,
              ),
              const SizedBox(width: 8),
              NotificationBadge(
                text: 'Flutter',
                color: AppColors.orangeBrand,
              ),
            ],
          ),
        ],
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