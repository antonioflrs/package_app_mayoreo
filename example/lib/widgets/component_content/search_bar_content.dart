import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SearchBarContent extends StatefulWidget {
  const SearchBarContent({super.key});

  @override
  State<SearchBarContent> createState() => _SearchBarContentState();
}

class _SearchBarContentState extends State<SearchBarContent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Barra de Búsqueda',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Widget de búsqueda con autocompletado y resultados dinámicos.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 32),
        SearchBarWidget(
          controller: _searchController,
          onChanged: (query) {
            // Handle search query
          },
        ),
      ],
    );
  }
}
