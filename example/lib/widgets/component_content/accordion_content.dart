import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class AccordionContent extends StatefulWidget {
  const AccordionContent({super.key});

  @override
  State<AccordionContent> createState() => _AccordionContentState();
}

class _AccordionContentState extends State<AccordionContent> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Descripción'),
        _buildDescription(),
        const SizedBox(height: 24),
        _buildSectionTitle('Ejemplos'),
        const SizedBox(height: 16),
        _buildAccordionExamples(),
        const SizedBox(height: 24),
        _buildSectionTitle('Uso'),
        _buildUsageInstructions(),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: const Text(
        'El componente Acordeón permite mostrar contenido colapsable de manera organizada. '
        'Es útil para mostrar información detallada sin ocupar mucho espacio en la interfaz.',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.darkGray,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildAccordionExamples() {
    return Column(
      children: [
        _buildAccordionItem(
          title: '¿Cómo funciona el acordeón?',
          content: 'El acordeón es un componente que permite expandir y contraer contenido. '
              'Cuando está cerrado, solo muestra el título. Al hacer clic, se expande para mostrar el contenido completo.',
          isExpanded: _isExpanded1,
          onTap: () => setState(() => _isExpanded1 = !_isExpanded1),
        ),
        const SizedBox(height: 8),
        _buildAccordionItem(
          title: '¿Cuándo usar acordeones?',
          content: 'Los acordeones son ideales para:\n'
              '• Información que no siempre es necesaria\n'
              '• Reducir la complejidad visual\n'
              '• Organizar contenido en secciones lógicas\n'
              '• Mejorar la experiencia móvil',
          isExpanded: _isExpanded2,
          onTap: () => setState(() => _isExpanded2 = !_isExpanded2),
        ),
        const SizedBox(height: 8),
        _buildAccordionItem(
          title: 'Mejores prácticas',
          content: '• Usa títulos descriptivos y claros\n'
              '• Mantén el contenido relevante y conciso\n'
              '• Considera la accesibilidad\n'
              '• No anides acordeones dentro de acordeones',
          isExpanded: _isExpanded3,
          onTap: () => setState(() => _isExpanded3 = !_isExpanded3),
        ),
      ],
    );
  }

  Widget _buildAccordionItem({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.grayMedium,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.darkGray,
                  height: 1.5,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUsageInstructions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Implementación básica:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.grayMedium.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: const Text(
              '// Ejemplo de implementación\n'
              'bool _isExpanded = false;\n\n'
              'ExpansionTile(\n'
              '  title: Text("Título del acordeón"),\n'
              '  children: [\n'
              '    Text("Contenido del acordeón"),\n'
              '  ],\n'
              ')',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: AppColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 