import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class TextFieldsContent extends StatefulWidget {
  const TextFieldsContent({super.key});

  @override
  State<TextFieldsContent> createState() => _TextFieldsContentState();
}

class _TextFieldsContentState extends State<TextFieldsContent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainTitle(theme, 'Campos de Texto'),
          const SizedBox(height: 8),
          _buildSubtitle(theme, 'Sistema de campos de texto para entrada de datos del usuario con validación y estilos consistentes'),
          
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
          'Los campos de texto se implementan mediante el widget AppTextField siguiendo esta sintaxis:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Sintaxis básica\nAppTextField(\n  labelText: \'Etiqueta\',\n  hintText: \'Texto de ayuda\',\n)',
          isMobile,
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          '// Ejemplo con validación\nAppTextField(\n  controller: controller,\n  labelText: \'Email\',\n  validator: (value) {\n    if (value?.isEmpty ?? true) {\n      return \'Campo requerido\';\n    }\n    return null;\n  },\n)',
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
          'Para usar los campos de texto en tu proyecto, importa el paquete:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        _buildCodeBlock(
          theme,
          'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\n// Luego usa AppTextField\nAppTextField(\n  labelText: \'Mi campo\',\n  hintText: \'Texto de ayuda\',\n)',
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
        _buildTextFieldTokens(theme, isMobile),
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

  Widget _buildTextFieldTokens(ThemeData theme, bool isMobile) {
    final textFieldTokens = [
      {
        'category': 'Tipos de Campos',
        'tokens': [
          {
            'token': 'AppTextField',
            'descripcion': 'Campo de texto básico',
            'ejemplo': AppTextField(
              labelText: 'Campo básico',
              hintText: 'Escribe aquí...',
            ),
          },
          {
            'token': 'AppTextField (con icono)',
            'descripcion': 'Campo con icono prefijo',
            'ejemplo': AppTextField(
              labelText: 'Con icono',
              hintText: 'Buscar...',
              prefixIcon: const Icon(Icons.search),
            ),
          },
          {
            'token': 'AppTextField (password)',
            'descripcion': 'Campo de contraseña',
            'ejemplo': AppTextField(
              labelText: 'Contraseña',
              hintText: 'Ingresa tu contraseña',
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
            ),
          },
        ]
      },
      {
        'category': 'Tamaños',
        'tokens': [
          {
            'token': 'AppTextFieldSize.small',
            'descripcion': 'Tamaño pequeño',
            'ejemplo': AppTextField(
              labelText: 'Pequeño',
              hintText: 'Tamaño small',
              size: AppTextFieldSize.small,
            ),
          },
          {
            'token': 'AppTextFieldSize.medium',
            'descripcion': 'Tamaño mediano (por defecto)',
            'ejemplo': AppTextField(
              labelText: 'Mediano',
              hintText: 'Tamaño medium',
              size: AppTextFieldSize.medium,
            ),
          },
          {
            'token': 'AppTextFieldSize.large',
            'descripcion': 'Tamaño grande',
            'ejemplo': AppTextField(
              labelText: 'Grande',
              hintText: 'Tamaño large',
              size: AppTextFieldSize.large,
            ),
          },
        ]
      },
    ];

    return Column(
      children: textFieldTokens.map((category) => _buildCategorySection(theme, category, isMobile)).toList(),
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
          _buildMobileTextFieldList(theme, tokens)
        else
          _buildDesktopTextFieldTable(theme, tokens),
      ],
    );
  }

  Widget _buildDesktopTextFieldTable(ThemeData theme, List<Map<String, dynamic>> tokens) {
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
                    'Descripción',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Ejemplo',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Rows
          ...tokens.map((token) => _buildTextFieldTableRow(theme, token)),
        ],
      ),
    );
  }

  Widget _buildMobileTextFieldList(ThemeData theme, List<Map<String, dynamic>> tokens) {
    return Column(
      children: tokens.map((token) => _buildMobileTextFieldCard(theme, token)).toList(),
    );
  }

  Widget _buildTextFieldTableRow(ThemeData theme, Map<String, dynamic> token) {
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
              token['descripcion'] as String,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 60,
              child: token['ejemplo'] as Widget,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTextFieldCard(ThemeData theme, Map<String, dynamic> token) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          Text(
            token['token'] as String,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            token['descripcion'] as String,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          token['ejemplo'] as Widget,
        ],
      ),
    );
  }
} 