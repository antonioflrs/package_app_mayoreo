import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import 'package:flutter/services.dart';

class ShadowsContent extends StatelessWidget {
  const ShadowsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainTitle(theme, 'Sombras'),
          const SizedBox(height: 8),
          _buildSubtitle(theme, 'Sistema de sombras y elevación para crear profundidad visual en la interfaz'),
          
          const SizedBox(height: 32),
          _buildUsageSection(theme, isMobile),
          
          const SizedBox(height: 32),
          _buildImportSection(theme, isMobile),
          
          const SizedBox(height: 32),
          _buildTokensSection(theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildMainTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }

  Widget _buildSubtitle(ThemeData theme, String subtitle) {
    return Text(
      subtitle,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontSize: 16,
      ),
    );
  }

  Widget _buildUsageSection(ThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(theme, 'Uso'),
        const SizedBox(height: 16),
        Text(
          'Las sombras se aplican mediante BoxShadow siguiendo esta sintaxis:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Sintaxis\nBoxShadow(\n  color: AppColors.pureBlack.withValues(alpha: 0.1),\n  blurRadius: 4,\n  offset: Offset(0, 2),\n)',
          isMobile,
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Ejemplo\nContainer(\n  decoration: BoxDecoration(\n    boxShadow: [\n      BoxShadow(\n        color: AppColors.pureBlack.withValues(alpha: 0.1),\n        blurRadius: 4,\n        offset: Offset(0, 2),\n      ),\n    ],\n  ),\n  child: Text(\'Mi elemento\'),\n)',
          isMobile,
        ),
      ],
    );
  }

  Widget _buildImportSection(ThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(theme, 'Importación'),
        const SizedBox(height: 16),
        Text(
          'Los valores de sombra están disponibles como constantes en el paquete:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\n// Usar valores de sombra\nBoxShadow(\n  color: AppColors.pureBlack.withValues(alpha: 0.1),\n  blurRadius: 4,\n  offset: Offset(0, 2),\n)',
          isMobile,
        ),
      ],
    );
  }

  Widget _buildTokensSection(ThemeData theme, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(theme, 'Tokens'),
        const SizedBox(height: 16),
        _buildShadowTokens(theme, isMobile),
      ],
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    );
  }

  Widget _buildCodeBlock(ThemeData theme, String code, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Código',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: code));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Código copiado al portapapeles'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SelectableText(
            code,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'RobotoMono',
              fontSize: isMobile ? 12 : 14,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadowTokens(ThemeData theme, bool isMobile) {
    final shadowTokens = [
      {
        'token': 'sm',
        'valor': '0 1px 2px 0',
        'descripcion': 'Sombra pequeña para elementos sutiles',
        'shadow': BoxShadow(
          color: AppColors.pureBlack.withValues(alpha: 0.05),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      },
      {
        'token': 'md',
        'valor': '0 4px 6px -1px',
        'descripcion': 'Sombra mediana para tarjetas y contenedores',
        'shadow': BoxShadow(
          color: AppColors.pureBlack.withValues(alpha: 0.1),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      },
      {
        'token': 'lg',
        'valor': '0 10px 15px -3px',
        'descripcion': 'Sombra grande para elementos elevados',
        'shadow': BoxShadow(
          color: AppColors.pureBlack.withValues(alpha: 0.1),
          blurRadius: 15,
          offset: const Offset(0, 10),
        ),
      },
      {
        'token': 'xl',
        'valor': '0 20px 25px -5px',
        'descripcion': 'Sombra extra grande para modales y overlays',
        'shadow': BoxShadow(
          color: AppColors.pureBlack.withValues(alpha: 0.1),
          blurRadius: 25,
          offset: const Offset(0, 20),
        ),
      },
      {
        'token': '2xl',
        'valor': '0 25px 50px -12px',
        'descripcion': 'Sombra máxima para elementos de máxima elevación',
        'shadow': BoxShadow(
          color: AppColors.pureBlack.withValues(alpha: 0.25),
          blurRadius: 50,
          offset: const Offset(0, 25),
        ),
      },
    ];

    if (isMobile) {
      return _buildMobileShadowList(theme, shadowTokens);
    } else {
      return _buildDesktopShadowTable(theme, shadowTokens);
    }
  }

  Widget _buildDesktopShadowTable(ThemeData theme, List<Map<String, dynamic>> tokens) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Token',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Valor',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Descripción',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Muestra',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rows
          ...tokens.map((token) => _buildShadowTableRow(theme, token)),
        ],
      ),
    );
  }

  Widget _buildMobileShadowList(ThemeData theme, List<Map<String, dynamic>> tokens) {
    return Column(
      children: tokens.map((token) => _buildMobileShadowCard(theme, token)).toList(),
    );
  }

  Widget _buildShadowTableRow(ThemeData theme, Map<String, dynamic> token) {
    final shadow = token['shadow'] as BoxShadow;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              token['token'] as String,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              token['valor'] as String,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'RobotoMono',
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              token['descripcion'] as String,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 40,
              child: Center(
                child: SizedBox(
                  width: 60,
                  height: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [shadow],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileShadowCard(ThemeData theme, Map<String, dynamic> token) {
    final shadow = token['shadow'] as BoxShadow;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                token['token'] as String,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [shadow],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            token['valor'] as String,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'RobotoMono',
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            token['descripcion'] as String,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
} 