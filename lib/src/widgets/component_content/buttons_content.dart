import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ButtonsContent extends StatefulWidget {
  const ButtonsContent({super.key});

  @override
  State<ButtonsContent> createState() => _ButtonsContentState();
}

class _ButtonsContentState extends State<ButtonsContent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(theme, 'Sistema de Botones'),
        const SizedBox(height: 16),
        Text(
          'El sistema de botones proporciona una interfaz consistente y accesible para las acciones del usuario.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        
        const SizedBox(height: 32),
        _buildSectionTitle(theme, 'Tipos de Botones'),
        const SizedBox(height: 16),
        _buildButtonTypesSection(theme),
        
        const SizedBox(height: 32),
        _buildSectionTitle(theme, 'Tamaños de Botones'),
        const SizedBox(height: 16),
        _buildButtonSizesSection(theme),
        
        const SizedBox(height: 32),
        _buildSectionTitle(theme, 'Botones con Iconos'),
        const SizedBox(height: 16),
        _buildButtonIconsSection(theme),
        
        const SizedBox(height: 32),
        _buildSectionTitle(theme, 'Estados de Botones'),
        const SizedBox(height: 16),
        _buildButtonStatesSection(theme),
        
        const SizedBox(height: 32),
        _buildSectionTitle(theme, 'Border Radius Personalizado'),
        const SizedBox(height: 16),
        _buildButtonRadiusSection(theme),
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

  Widget _buildButtonTypesSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tipos de botones disponibles',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              UiButton(
                onPressed: () => _showSnackBar('Botón primario presionado'),
                label: 'Primario',
                type: UiButtonType.primary,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón secundario presionado'),
                label: 'Secundario',
                type: UiButtonType.secondary,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón de texto presionado'),
                label: 'Texto',
                type: UiButtonType.text,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón destructivo presionado'),
                label: 'Eliminar',
                type: UiButtonType.destructive,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSizesSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tamaños disponibles',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              UiButton(
                onPressed: () => _showSnackBar('Botón pequeño'),
                label: 'Pequeño',
                size: UiButtonSize.small,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón mediano'),
                label: 'Mediano',
                size: UiButtonSize.medium,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón grande'),
                label: 'Grande',
                size: UiButtonSize.large,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonIconsSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Botones con iconos',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              UiButton(
                onPressed: () => _showSnackBar('Guardar presionado'),
                label: 'Guardar',
                icon: Icons.save,
                type: UiButtonType.primary,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Descargar presionado'),
                label: 'Descargar',
                icon: Icons.download,
                iconPosition: UiButtonIconPosition.end,
                type: UiButtonType.secondary,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Eliminar presionado'),
                label: 'Eliminar',
                icon: Icons.delete,
                type: UiButtonType.destructive,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Buscar presionado'),
                label: 'Buscar',
                icon: Icons.search,
                type: UiButtonType.text,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonStatesSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estados de botones',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              UiButton(
                onPressed: () => _showSnackBar('Botón con carga'),
                label: 'Cargando...',
                isLoading: true,
              ),
              UiButton(
                onPressed: null,
                label: 'Deshabilitado',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRadiusSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Border radius personalizado',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              UiButton(
                onPressed: () => _showSnackBar('Botón cuadrado'),
                label: 'Cuadrado',
                borderRadius: 0,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón redondeado'),
                label: 'Redondeado',
                borderRadius: 12,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón muy redondeado'),
                label: 'Muy redondeado',
                borderRadius: 25,
              ),
              UiButton(
                onPressed: () => _showSnackBar('Botón circular'),
                label: 'Circular',
                borderRadius: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
} 