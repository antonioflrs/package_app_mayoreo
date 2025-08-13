import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Template reutilizable para mostrar información de componentes
/// Basado en la estructura de search_bar_content.dart
class ComponentScreenTemplate extends StatefulWidget {
  final String componentTitle;
  final String componentDescription;
  final List<ComponentExample> examples;
  final List<ComponentProperty>? properties;
  final List<ComponentMethod>? methods;
  final String? usageNotes;

  const ComponentScreenTemplate({
    super.key,
    required this.componentTitle,
    required this.componentDescription,
    required this.examples,
    this.properties,
    this.methods,
    this.usageNotes,
  });

  @override
  State<ComponentScreenTemplate> createState() => _ComponentScreenTemplateState();
}

class _ComponentScreenTemplateState extends State<ComponentScreenTemplate> {
  final Map<String, bool> _showCodeStates = {};
  final Map<String, bool> _expandedSections = {};

  @override
  void initState() {
    super.initState();
    // Inicializar estados de expansión para secciones opcionales
    if (widget.properties != null) _expandedSections['properties'] = false;
    if (widget.methods != null) _expandedSections['methods'] = false;
    if (widget.usageNotes != null) _expandedSections['usage'] = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          
          const SizedBox(height: 32),
          
          // Ejemplos del componente
          ...widget.examples.map((example) => 
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: _buildExampleContainer(
                theme: theme,
                example: example,
              ),
            ),
          ),
          
          // Propiedades del componente (opcional)
          if (widget.properties != null) ...[
            const SizedBox(height: 32),
            _buildPropertiesSection(theme),
          ],
          
          // Métodos del componente (opcional)
          if (widget.methods != null) ...[
            const SizedBox(height: 32),
            _buildMethodsSection(theme),
          ],
          
          // Notas de uso (opcional)
          if (widget.usageNotes != null) ...[
            const SizedBox(height: 32),
            _buildUsageNotesSection(theme),
          ],
          
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.componentTitle,
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.componentDescription,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildExampleContainer({
    required ThemeData theme,
    required ComponentExample example,
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
          // Header del ejemplo
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  example.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  example.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.darkGray,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          
          // Tabs de vista previa/código
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomTabsWidget(
              tabs: [
                TabItem(
                  id: 'preview',
                  title: 'Vista previa',
                  isSelected: !(_showCodeStates[example.id] ?? false),
                ),
                TabItem(
                  id: 'code',
                  title: 'Código',
                  isSelected: _showCodeStates[example.id] ?? false,
                ),
              ],
              variant: TabVariant.underlined,
              onTabChanged: (tabId) {
                setState(() {
                  _showCodeStates[example.id] = (tabId == 'code');
                });
              },
            ),
          ),
          
          // Contenido basado en el toggle
          Padding(
            padding: const EdgeInsets.all(24),
            child: (_showCodeStates[example.id] ?? false)
                ? _buildCodeSection(theme, example.codeExample)
                : example.previewWidget,
          ),
        ],
      ),
    );
  }

  Widget _buildPropertiesSection(ThemeData theme) {
    return _buildExpandableSection(
      theme: theme,
      title: 'Propiedades',
      icon: Icons.settings,
      sectionKey: 'properties',
      child: Column(
        children: widget.properties!.map((property) => 
          _buildPropertyItem(theme, property),
        ).toList(),
      ),
    );
  }

  Widget _buildMethodsSection(ThemeData theme) {
    return _buildExpandableSection(
      theme: theme,
      title: 'Métodos',
      icon: Icons.functions,
      sectionKey: 'methods',
      child: Column(
        children: widget.methods!.map((method) => 
          _buildMethodItem(theme, method),
        ).toList(),
      ),
    );
  }

  Widget _buildUsageNotesSection(ThemeData theme) {
    return _buildExpandableSection(
      theme: theme,
      title: 'Notas de Uso',
      icon: Icons.info,
      sectionKey: 'usage',
      child: Text(
        widget.usageNotes!,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required ThemeData theme,
    required String title,
    required IconData icon,
    required String sectionKey,
    required Widget child,
  }) {
    final isExpanded = _expandedSections[sectionKey] ?? false;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          // Header expandible
          InkWell(
            onTap: () => setState(() => 
              _expandedSections[sectionKey] = !isExpanded
            ),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: AppColors.orangeBrand,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.grayMedium,
                  ),
                ],
              ),
            ),
          ),
          
          // Contenido expandible
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: child,
            ),
        ],
      ),
    );
  }

  Widget _buildPropertyItem(ThemeData theme, ComponentProperty property) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                property.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'monospace',
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.orangeBrand.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  property.type,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.orangeBrand,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (property.required)
                                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.digitalRed.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Requerido',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.digitalRed,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
            ],
          ),
          if (property.description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              property.description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGray,
                height: 1.4,
              ),
            ),
          ],
          if (property.defaultValue != null) ...[
            const SizedBox(height: 4),
            Text(
              'Valor por defecto: ${property.defaultValue}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.grayMedium,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMethodItem(ThemeData theme, ComponentMethod method) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                method.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'monospace',
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 8),
                              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.oliveBrand.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    method.returnType,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.oliveBrand,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          if (method.description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              method.description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.darkGray,
                height: 1.4,
              ),
            ),
          ],
          if (method.parameters.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Parámetros: ${method.parameters.join(', ')}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.grayMedium,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
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

/// Modelo para ejemplos de componentes
class ComponentExample {
  final String id;
  final String title;
  final String description;
  final Widget previewWidget;
  final String codeExample;

  const ComponentExample({
    required this.id,
    required this.title,
    required this.description,
    required this.previewWidget,
    required this.codeExample,
  });
}

/// Modelo para propiedades de componentes
class ComponentProperty {
  final String name;
  final String type;
  final String description;
  final bool required;
  final String? defaultValue;

  const ComponentProperty({
    required this.name,
    required this.type,
    required this.description,
    this.required = false,
    this.defaultValue,
  });
}

/// Modelo para métodos de componentes
class ComponentMethod {
  final String name;
  final String returnType;
  final String description;
  final List<String> parameters;

  const ComponentMethod({
    required this.name,
    required this.returnType,
    required this.description,
    this.parameters = const [],
  });
}
