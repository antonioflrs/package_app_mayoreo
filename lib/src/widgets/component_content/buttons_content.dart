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
    return ComponentScreenTemplate(
      examples: [
        ComponentExample(
          id: 'button-types',
          title: 'Tipos de Botones',
          description: 'Diferentes variantes de botones disponibles en el sistema',
          previewWidget: _buildButtonTypesPreview(),
          codeExample: _getButtonTypesCode(),
        ),
        ComponentExample(
          id: 'button-sizes',
          title: 'Tamaños de Botones',
          description: 'Variaciones de tamaño para diferentes contextos de uso',
          previewWidget: _buildButtonSizesPreview(),
          codeExample: _getButtonSizesCode(),
        ),
        ComponentExample(
          id: 'button-icons',
          title: 'Botones con Iconos',
          description: 'Botones que incluyen iconos para mejor comprensión visual',
          previewWidget: _buildButtonIconsPreview(),
          codeExample: _getButtonIconsCode(),
        ),
        ComponentExample(
          id: 'button-states',
          title: 'Estados de Botones',
          description: 'Diferentes estados visuales de los botones',
          previewWidget: _buildButtonStatesPreview(),
          codeExample: _getButtonStatesCode(),
        ),
        ComponentExample(
          id: 'button-radius',
          title: 'Border Radius Personalizado',
          description: 'Personalización del radio de borde de los botones',
          previewWidget: _buildButtonRadiusPreview(),
          codeExample: _getButtonRadiusCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'type',
          type: 'UiButtonType',
          description: 'Define el estilo visual del botón (primary, secondary, text, destructive)',
          required: true,
        ),
        ComponentProperty(
          name: 'size',
          type: 'UiButtonSize',
          description: 'Define el tamaño del botón (small, medium, large)',
          required: false,
          defaultValue: 'UiButtonSize.medium',
        ),
        ComponentProperty(
          name: 'onPressed',
          type: 'VoidCallback?',
          description: 'Función que se ejecuta cuando se presiona el botón',
          required: false,
        ),
        ComponentProperty(
          name: 'label',
          type: 'String',
          description: 'Texto que se muestra en el botón',
          required: true,
        ),
      ],
      methods: [
        ComponentMethod(
          name: 'build',
          returnType: 'Widget',
          description: 'Construye el widget del botón con las propiedades especificadas',
          parameters: ['BuildContext context'],
        ),
      ],
      usageNotes: 'Los botones deben seguir las guías de accesibilidad y proporcionar feedback visual claro al usuario. Use el tipo primary para acciones principales y secondary para acciones secundarias.',
    );
  }

  Widget _buildButtonTypesPreview() {
    return Wrap(
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
          label: 'Destructivo',
          type: UiButtonType.destructive,
        ),
      ],
    );
  }

  Widget _buildButtonSizesPreview() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        UiButton(
          onPressed: () => _showSnackBar('Botón pequeño presionado'),
          label: 'Pequeño',
          size: UiButtonSize.small,
        ),
        UiButton(
          onPressed: () => _showSnackBar('Botón mediano presionado'),
          label: 'Mediano',
          size: UiButtonSize.medium,
        ),
        UiButton(
          onPressed: () => _showSnackBar('Botón grande presionado'),
          label: 'Grande',
          size: UiButtonSize.large,
        ),
      ],
    );
  }

  Widget _buildButtonIconsPreview() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        UiButton(
          onPressed: () => _showSnackBar('Botón con icono presionado'),
          label: 'Guardar',
          type: UiButtonType.primary,
        ),
        UiButton(
          onPressed: () => _showSnackBar('Botón con icono presionado'),
          label: 'Eliminar',
          type: UiButtonType.secondary,
        ),
      ],
    );
  }

  Widget _buildButtonStatesPreview() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        UiButton(
          onPressed: () => _showSnackBar('Botón activo presionado'),
          label: 'Activo',
          type: UiButtonType.primary,
        ),
        UiButton(
          onPressed: null,
          label: 'Deshabilitado',
          type: UiButtonType.primary,
        ),
      ],
    );
  }

  Widget _buildButtonRadiusPreview() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        UiButton(
          onPressed: () => _showSnackBar('Botón con radio personalizado presionado'),
          label: 'Radio 8px',
          type: UiButtonType.primary,
        ),
        UiButton(
          onPressed: () => _showSnackBar('Botón con radio personalizado presionado'),
          label: 'Radio 16px',
          type: UiButtonType.secondary,
        ),
      ],
    );
  }

  String _getButtonTypesCode() {
    return '''UiButton(
  onPressed: () => print('Botón presionado'),
  label: 'Mi Botón',
  type: UiButtonType.primary,
)''';
  }

  String _getButtonSizesCode() {
    return '''UiButton(
  onPressed: () => print('Botón presionado'),
  label: 'Mi Botón',
  size: UiButtonSize.large,
)''';
  }

  String _getButtonIconsCode() {
    return '''UiButton(
  onPressed: () => print('Botón presionado'),
  label: 'Guardar',
  type: UiButtonType.primary,
)''';
  }

  String _getButtonStatesCode() {
    return '''UiButton(
  onPressed: null, // Deshabilitado
  label: 'Deshabilitado',
  type: UiButtonType.primary,
)''';
  }

  String _getButtonRadiusCode() {
    return '''UiButton(
  onPressed: () => print('Botón presionado'),
  label: 'Mi Botón',
  type: UiButtonType.primary,
)''';
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.orangeBrand,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
} 