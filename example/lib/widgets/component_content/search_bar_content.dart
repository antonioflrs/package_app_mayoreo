import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../../widgets/search_bar_widget.dart';

class SearchBarContent extends StatefulWidget {
  const SearchBarContent({super.key});

  @override
  State<SearchBarContent> createState() => _SearchBarContentState();
}

class _SearchBarContentState extends State<SearchBarContent> {
  final TextEditingController _searchController = TextEditingController();
  final Map<String, bool> _showCodeStates = {};

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
        _buildSectionTitle(theme, 'Barra de Búsqueda'),
        const SizedBox(height: 16),
        Text(
          'Widget de búsqueda con autocompletado y resultados dinámicos. Proporciona una experiencia de búsqueda fluida y responsiva con soporte para iconos personalizados y estados configurables.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        
        const SizedBox(height: 32),
        _buildBasicUsage(theme),
        
        const SizedBox(height: 32),
        _buildWithCustomHint(theme),
        
        const SizedBox(height: 32),
        _buildDisabledState(theme),
        
        const SizedBox(height: 32),
        _buildWithMargin(theme),
      ],
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildBasicUsage(ThemeData theme) {
    const codeExample = '''SearchBarWidget(
  controller: _searchController,
  onChanged: (query) {
    // Handle search query
    print('Searching for: \$query');
  },
)''';

    return _buildExampleContainer(
      theme: theme,
      title: 'Uso Básico',
      description: 'Barra de búsqueda con funcionalidad básica y controlador de texto.',
      child: SearchBarWidget(
        controller: _searchController,
        onChanged: (query) {
          // Handle search query
          print('Searching for: $query');
        },
      ),
      codeExample: codeExample,
      exampleId: 'basic_usage',
    );
  }

  Widget _buildWithCustomHint(ThemeData theme) {
    const codeExample = '''SearchBarWidget(
  hintText: 'Buscar productos, categorías...',
  onChanged: (query) {
    print('Searching with custom hint: \$query');
  },
)''';

    return _buildExampleContainer(
      theme: theme,
      title: 'Con Texto de Ayuda Personalizado',
      description: 'Barra de búsqueda con texto de ayuda específico para el contexto de la aplicación.',
      child: SearchBarWidget(
        hintText: 'Buscar productos, categorías...',
        onChanged: (query) {
          print('Searching with custom hint: $query');
        },
      ),
      codeExample: codeExample,
      exampleId: 'custom_hint',
    );
  }

  Widget _buildDisabledState(ThemeData theme) {
    const codeExample = '''SearchBarWidget(
  hintText: 'Búsqueda deshabilitada',
  enabled: false,
  onChanged: (query) {
    // This won't be called when disabled
  },
)''';

    return _buildExampleContainer(
      theme: theme,
      title: 'Estado Deshabilitado',
      description: 'Barra de búsqueda en estado deshabilitado para cuando la funcionalidad no está disponible.',
      child: SearchBarWidget(
        hintText: 'Búsqueda deshabilitada',
        enabled: false,
        onChanged: (query) {
          // This won't be called when disabled
        },
      ),
      codeExample: codeExample,
      exampleId: 'disabled_state',
    );
  }

  Widget _buildWithMargin(ThemeData theme) {
    const codeExample = '''SearchBarWidget(
  hintText: 'Buscar con márgenes...',
  margin: EdgeInsets.symmetric(
    horizontal: 8.0, 
    vertical: 4.0
  ),
  onChanged: (query) {
    print('Searching with custom margin: \$query');
  },
)''';

    return _buildExampleContainer(
      theme: theme,
      title: 'Con Márgenes Personalizados',
      description: 'Barra de búsqueda con márgenes específicos para ajustar el espaciado según el diseño.',
      child: SearchBarWidget(
        hintText: 'Buscar con márgenes...',
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        onChanged: (query) {
          print('Searching with custom margin: $query');
        },
      ),
      codeExample: codeExample,
      exampleId: 'custom_margin',
    );
  }

  Widget _buildExampleContainer({
    required ThemeData theme,
    required String title,
    required String description,
    required Widget child,
    required String codeExample,
    required String exampleId,
  }) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                     // Header
           Padding(
             padding: const EdgeInsets.all(24),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   title,
                   style: theme.textTheme.titleLarge?.copyWith(
                     fontWeight: FontWeight.w600,
                     color: AppColors.black,
                   ),
                 ),
                 const SizedBox(height: 8),
                 Text(
                   description,
                   style: theme.textTheme.bodyMedium?.copyWith(
                     color: AppColors.darkGray,
                     height: 1.4,
                   ),
                 ),
               ],
             ),
           ),
          
                     // Toggle tabs
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
             child: Row(
               children: [
                 _buildTab(
                   theme: theme,
                   title: 'Vista previa',
                   icon: Icons.visibility,
                   isSelected: !(_showCodeStates[exampleId] ?? false),
                   onTap: () => setState(() => _showCodeStates[exampleId] = false),
                 ),
                 const SizedBox(width: 8),
                 _buildTab(
                   theme: theme,
                   title: 'Código',
                   icon: Icons.code,
                   isSelected: _showCodeStates[exampleId] ?? false,
                   onTap: () => setState(() => _showCodeStates[exampleId] = true),
                 ),
               ],
             ),
           ),
           
           // Content based on toggle
           Padding(
             padding: const EdgeInsets.all(24),
             child: (_showCodeStates[exampleId] ?? false)
                 ? _buildCodeSection(theme, codeExample)
                 : child,
           ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required ThemeData theme,
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orangeBrand : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.orangeBrand : AppColors.grayMedium.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.white : AppColors.grayMedium,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColors.white : AppColors.grayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeSection(ThemeData theme, String codeExample) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
        ),
      ),
      child: Stack(
        children: [
          SelectableText(
            codeExample,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              color: AppColors.black,
              height: 1.4,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _buildCopyButton(theme, codeExample),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyButton(ThemeData theme, String code) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: code));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Código copiado al portapapeles'),
            backgroundColor: AppColors.orangeBrand,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.grayMedium.withValues(alpha: 0.2),
          ),
        ),
        child: Icon(
          Icons.copy,
          size: 16,
          color: AppColors.grayMedium,
        ),
      ),
    );
  }
}
