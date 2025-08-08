import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpacingContent extends StatelessWidget {
  const SpacingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainTitle(theme, 'Espaciado'),
          const SizedBox(height: 8),
          _buildSubtitle(theme, 'Valores de spacing que controlan márgenes, padding y gaps entre elementos'),
          
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
          'El espaciado se aplica mediante clases utilitarias siguiendo esta sintaxis:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Sintaxis\n[utilidad]-[token]',
          isMobile,
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Ejemplo\nContainer(\n  margin: EdgeInsets.all(16),\n  padding: EdgeInsets.symmetric(\n    horizontal: 24,\n    vertical: 12,\n  ),\n)',
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
          'Los valores de espaciado están disponibles como constantes en el paquete:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\n// Usar valores de espaciado\nEdgeInsets.all(16) // 16px\nEdgeInsets.symmetric(horizontal: 24) // 24px',
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
        _buildSpacingTokens(theme, isMobile),
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

  Widget _buildSpacingTokens(ThemeData theme, bool isMobile) {
    final spacingTokens = [
      {'token': '0', 'valor': '0px', 'size': 0.0},
      {'token': 'px', 'valor': '1px', 'size': 1.0},
      {'token': '0.5', 'valor': '0.125rem', 'size': 2.0},
      {'token': '1', 'valor': '0.25rem', 'size': 4.0},
      {'token': '1.5', 'valor': '0.375rem', 'size': 6.0},
      {'token': '2', 'valor': '0.5rem', 'size': 8.0},
      {'token': '2.5', 'valor': '0.625rem', 'size': 10.0},
      {'token': '3', 'valor': '0.75rem', 'size': 12.0},
      {'token': '3.5', 'valor': '0.875rem', 'size': 14.0},
      {'token': '4', 'valor': '1rem', 'size': 16.0},
      {'token': '5', 'valor': '1.25rem', 'size': 20.0},
      {'token': '6', 'valor': '1.5rem', 'size': 24.0},
      {'token': '7', 'valor': '1.75rem', 'size': 28.0},
      {'token': '8', 'valor': '2rem', 'size': 32.0},
      {'token': '9', 'valor': '2.25rem', 'size': 36.0},
      {'token': '10', 'valor': '2.5rem', 'size': 40.0},
      {'token': '11', 'valor': '2.75rem', 'size': 44.0},
      {'token': '12', 'valor': '3rem', 'size': 48.0},
      {'token': '14', 'valor': '3.5rem', 'size': 56.0},
      {'token': '16', 'valor': '4rem', 'size': 64.0},
      {'token': '20', 'valor': '5rem', 'size': 80.0},
      {'token': '24', 'valor': '6rem', 'size': 96.0},
      {'token': '28', 'valor': '7rem', 'size': 112.0},
      {'token': '32', 'valor': '8rem', 'size': 128.0},
    ];

    if (isMobile) {
      return _buildMobileSpacingList(theme, spacingTokens);
    } else {
      return _buildDesktopSpacingTable(theme, spacingTokens);
    }
  }

  Widget _buildDesktopSpacingTable(ThemeData theme, List<Map<String, dynamic>> tokens) {
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
                  flex: 2,
                  child: Text(
                    'Espaciador',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rows
          ...tokens.map((token) => _buildSpacingTableRow(theme, token)),
        ],
      ),
    );
  }

  Widget _buildMobileSpacingList(ThemeData theme, List<Map<String, dynamic>> tokens) {
    return Column(
      children: tokens.map((token) => _buildMobileSpacingCard(theme, token)).toList(),
    );
  }

  Widget _buildSpacingTableRow(ThemeData theme, Map<String, dynamic> token) {
    final size = token['size'] as double;
    
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
            flex: 2,
            child: SizedBox(
              height: 24,
              child: Row(
                children: [
                  SizedBox(
                    width: size,
                    height: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileSpacingCard(ThemeData theme, Map<String, dynamic> token) {
    final size = token['size'] as double;
    
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Center(
              child: Container(
                width: size,
                height: 16,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  token['token'] as String,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  token['valor'] as String,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'RobotoMono',
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 