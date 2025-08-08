import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TypographyContent extends StatelessWidget {
  const TypographyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainTitle(theme, 'Tipografía'),
          const SizedBox(height: 8),
          _buildSubtitle(theme, 'Sistema de tipografía que utiliza la fuente Inter con diferentes pesos y tamaños para crear una jerarquía visual clara'),
          
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
          'Los estilos de tipografía se aplican mediante el ThemeData siguiendo esta sintaxis:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Sintaxis\nTheme.of(context).textTheme.[estilo]',
          isMobile,
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Ejemplo\nText(\n  \'Mi texto\',\n  style: theme.textTheme.headlineLarge,\n)',
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
          'La tipografía se configura automáticamente al usar el tema del paquete:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\n// El tema incluye la tipografía automáticamente\nMaterialApp(\n  theme: AppTheme.lightTheme,\n  // ...\n)',
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
        _buildTypographyTokens(theme, isMobile),
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

  Widget _buildTypographyTokens(ThemeData theme, bool isMobile) {
    final typographyTokens = [
      {
        'category': 'Display',
        'tokens': [
          {'token': 'displayLarge', 'style': theme.textTheme.displayLarge, 'sample': 'Display Large'},
          {'token': 'displayMedium', 'style': theme.textTheme.displayMedium, 'sample': 'Display Medium'},
          {'token': 'displaySmall', 'style': theme.textTheme.displaySmall, 'sample': 'Display Small'},
        ]
      },
      {
        'category': 'Headline',
        'tokens': [
          {'token': 'headlineLarge', 'style': theme.textTheme.headlineLarge, 'sample': 'Headline Large'},
          {'token': 'headlineMedium', 'style': theme.textTheme.headlineMedium, 'sample': 'Headline Medium'},
          {'token': 'headlineSmall', 'style': theme.textTheme.headlineSmall, 'sample': 'Headline Small'},
        ]
      },
      {
        'category': 'Title',
        'tokens': [
          {'token': 'titleLarge', 'style': theme.textTheme.titleLarge, 'sample': 'Title Large'},
          {'token': 'titleMedium', 'style': theme.textTheme.titleMedium, 'sample': 'Title Medium'},
          {'token': 'titleSmall', 'style': theme.textTheme.titleSmall, 'sample': 'Title Small'},
        ]
      },
      {
        'category': 'Body',
        'tokens': [
          {'token': 'bodyLarge', 'style': theme.textTheme.bodyLarge, 'sample': 'Body Large Text'},
          {'token': 'bodyMedium', 'style': theme.textTheme.bodyMedium, 'sample': 'Body Medium Text'},
          {'token': 'bodySmall', 'style': theme.textTheme.bodySmall, 'sample': 'Body Small Text'},
        ]
      },
      {
        'category': 'Label',
        'tokens': [
          {'token': 'labelLarge', 'style': theme.textTheme.labelLarge, 'sample': 'Label Large'},
          {'token': 'labelMedium', 'style': theme.textTheme.labelMedium, 'sample': 'Label Medium'},
          {'token': 'labelSmall', 'style': theme.textTheme.labelSmall, 'sample': 'Label Small'},
        ]
      },
    ];

    return Column(
      children: typographyTokens.map((category) => _buildCategorySection(theme, category, isMobile)).toList(),
    );
  }

  Widget _buildCategorySection(ThemeData theme, Map<String, dynamic> category, bool isMobile) {
    final categoryName = category['category'] as String;
    final tokens = category['tokens'] as List<Map<String, dynamic>>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          categoryName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        if (isMobile)
          _buildMobileTypographyList(theme, tokens)
        else
          _buildDesktopTypographyTable(theme, tokens),
      ],
    );
  }

  Widget _buildDesktopTypographyTable(ThemeData theme, List<Map<String, dynamic>> tokens) {
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
                  flex: 2,
                  child: Text(
                    'Token',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Muestra',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Especificaciones',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rows
          ...tokens.map((token) => _buildTypographyTableRow(theme, token)),
        ],
      ),
    );
  }

  Widget _buildMobileTypographyList(ThemeData theme, List<Map<String, dynamic>> tokens) {
    return Column(
      children: tokens.map((token) => _buildMobileTypographyCard(theme, token)).toList(),
    );
  }

  Widget _buildTypographyTableRow(ThemeData theme, Map<String, dynamic> token) {
    final style = token['style'] as TextStyle?;
    final sample = token['sample'] as String;
    
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
            flex: 2,
            child: Text(
              token['token'] as String,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              sample,
              style: style,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${style?.fontSize?.toStringAsFixed(0)}px',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'RobotoMono',
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  _getFontWeightName(style?.fontWeight),
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

  Widget _buildMobileTypographyCard(ThemeData theme, Map<String, dynamic> token) {
    final style = token['style'] as TextStyle?;
    final sample = token['sample'] as String;
    
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
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${style?.fontSize?.toStringAsFixed(0)}px',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            sample,
            style: style,
          ),
          const SizedBox(height: 4),
          Text(
            'Inter ${_getFontWeightName(style?.fontWeight)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'RobotoMono',
            ),
          ),
        ],
      ),
    );
  }

  String _getFontWeightName(FontWeight? weight) {
    if (weight == null) return 'Regular';
    switch (weight) {
      case FontWeight.w300:
        return 'Light';
      case FontWeight.w400:
        return 'Regular';
      case FontWeight.w500:
        return 'Medium';
      case FontWeight.w600:
        return 'SemiBold';
      case FontWeight.w700:
        return 'Bold';
      default:
        return 'Regular';
    }
  }
} 