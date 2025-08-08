import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ColorsContent extends StatelessWidget {
  const ColorsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainTitle(theme, 'Colores'),
          const SizedBox(height: 8),
          _buildSubtitle(theme, 'Paleta de colores del sistema de diseño que define la identidad visual de la aplicación'),
          
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
          'Los colores se aplican mediante la clase AppColors siguiendo esta sintaxis:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Sintaxis\nAppColors.[nombreDelColor]',
          isMobile,
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Ejemplo\nContainer(\n  color: AppColors.orangeBrand,\n  child: Text(\'Texto\'),\n)',
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
          'Para usar los colores en tu proyecto, importa la clase AppColors:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\n// Luego usa los colores\nAppColors.orangeBrand',
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
        _buildTokensTable(theme, isMobile),
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

  Widget _buildTokensTable(ThemeData theme, bool isMobile) {
    final tokens = [
      {'token': 'orangeBrand', 'valor': '#E1A141', 'color': AppColors.orangeBrand},
      {'token': 'ochreBrand', 'valor': '#C79022', 'color': AppColors.ochreBrand},
      {'token': 'oliveBrand', 'valor': '#84861C', 'color': AppColors.oliveBrand},
      {'token': 'lightTan', 'valor': '#F1D992', 'color': AppColors.lightTan},
      {'token': 'backCards', 'valor': '#F1F0EC', 'color': AppColors.backCards},
      {'token': 'black', 'valor': '#232323', 'color': AppColors.black},
      {'token': 'grayMedium', 'valor': '#A7ADBA', 'color': AppColors.grayMedium},
      {'token': 'white', 'valor': '#FFFFFF', 'color': AppColors.white},
      {'token': 'softGray', 'valor': '#F9F9F9', 'color': AppColors.softGray},
      {'token': 'digitalRed', 'valor': '#FF0000', 'color': AppColors.digitalRed},
      {'token': 'orangeRed', 'valor': '#FF5757', 'color': AppColors.orangeRed},
      {'token': 'fadedRed', 'valor': '#D54C4C', 'color': AppColors.fadedRed},
      {'token': 'cappuccinoWhite', 'valor': '#E5E6C8', 'color': AppColors.cappuccinoWhite},
      {'token': 'limeGreen', 'valor': '#32CD32', 'color': AppColors.limeGreen},
      {'token': 'greenFree', 'valor': '#047B5D', 'color': AppColors.greenFree},
      {'token': 'smokeGreenMedium', 'valor': '#9BA65C', 'color': AppColors.smokeGreenMedium},
      {'token': 'greenBorder', 'valor': '#21CD5B', 'color': AppColors.greenBorder},
      {'token': 'truGreen', 'valor': '#299617', 'color': AppColors.truGreen},
      {'token': 'yellow', 'valor': '#FADA28', 'color': AppColors.yellow},
      {'token': 'amarilloSuscripciones', 'valor': '#F3BE55', 'color': AppColors.amarilloSuscripciones},
      {'token': 'backGratis', 'valor': '#DDFFE9', 'color': AppColors.backGratis},
      {'token': 'mysticGray', 'valor': '#DDE5E8', 'color': AppColors.mysticGray},
      {'token': 'silverGrayMedium', 'valor': '#D4D4D4', 'color': AppColors.silverGrayMedium},
      {'token': 'slateCoolGray', 'valor': '#708090', 'color': AppColors.slateCoolGray},
      {'token': 'warmGray', 'valor': '#888888', 'color': AppColors.warmGray},
      {'token': 'darkGray', 'valor': '#3D3D3D', 'color': AppColors.darkGray},
      {'token': 'pureBlack', 'valor': '#000000', 'color': AppColors.pureBlack},
    ];

    if (isMobile) {
      return _buildMobileTokensList(theme, tokens);
    } else {
      return _buildDesktopTokensTable(theme, tokens);
    }
  }

  Widget _buildDesktopTokensTable(ThemeData theme, List<Map<String, dynamic>> tokens) {
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
                  flex: 2,
                  child: Text(
                    'Valor',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
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
          ...tokens.map((token) => _buildTableRow(theme, token)),
        ],
      ),
    );
  }

  Widget _buildMobileTokensList(ThemeData theme, List<Map<String, dynamic>> tokens) {
    return Column(
      children: tokens.map((token) => _buildMobileTokenCard(theme, token)).toList(),
    );
  }

  Widget _buildTableRow(ThemeData theme, Map<String, dynamic> token) {
    final color = token['color'] as Color;
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
            flex: 1,
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTokenCard(ThemeData theme, Map<String, dynamic> token) {
    final color = token['color'] as Color;
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
              color: color,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
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