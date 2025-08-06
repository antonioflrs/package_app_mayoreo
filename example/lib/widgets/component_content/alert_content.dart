import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class AlertContent extends StatelessWidget {
  const AlertContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Descripción'),
        _buildDescription(),
        const SizedBox(height: 24),
        _buildSectionTitle('Tipos de Alertas'),
        const SizedBox(height: 16),
        _buildAlertExamples(),
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
        'Los componentes Alert se utilizan para mostrar mensajes importantes al usuario. '
        'Pueden ser informativos, de advertencia, de error o de éxito, cada uno con su propio estilo visual.',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.darkGray,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildAlertExamples() {
    return Column(
      children: [
        _buildAlertItem(
          type: 'Información',
          message: 'Esta es una alerta informativa que proporciona información útil al usuario.',
          icon: Icons.info_outline,
          color: AppColors.orangeBrand,
        ),
        const SizedBox(height: 12),
        _buildAlertItem(
          type: 'Éxito',
          message: '¡Operación completada exitosamente! Los cambios han sido guardados.',
          icon: Icons.check_circle_outline,
          color: AppColors.greenFree,
        ),
        const SizedBox(height: 12),
        _buildAlertItem(
          type: 'Advertencia',
          message: 'Ten cuidado con esta acción. Asegúrate de revisar los detalles antes de continuar.',
          icon: Icons.warning_amber_outlined,
          color: AppColors.yellow,
        ),
        const SizedBox(height: 12),
        _buildAlertItem(
          type: 'Error',
          message: 'Ha ocurrido un error. Por favor, intenta nuevamente o contacta al soporte.',
          icon: Icons.error_outline,
          color: AppColors.digitalRed,
        ),
      ],
    );
  }

  Widget _buildAlertItem({
    required String type,
    required String message,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGray,
                    height: 1.4,
                  ),
                ),
              ],
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
              '// Ejemplo de alerta informativa\n'
              'Container(\n'
              '  padding: EdgeInsets.all(16),\n'
              '  decoration: BoxDecoration(\n'
              '    color: AppColors.orangeBrand.withValues(alpha: 0.1),\n'
              '    borderRadius: BorderRadius.circular(12),\n'
              '    border: Border.all(\n'
              '      color: AppColors.orangeBrand.withValues(alpha: 0.3),\n'
              '    ),\n'
              '  ),\n'
              '  child: Row(\n'
              '    children: [\n'
              '      Icon(Icons.info_outline, color: AppColors.orangeBrand),\n'
              '      SizedBox(width: 12),\n'
              '      Expanded(\n'
              '        child: Text("Mensaje de la alerta"),\n'
              '      ),\n'
              '    ],\n'
              '  ),\n'
              ')',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: AppColors.darkGray,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Mejores prácticas:',
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• Usa colores consistentes para cada tipo de alerta\n'
                  '• Mantén los mensajes claros y concisos\n'
                  '• Incluye iconos apropiados para cada tipo\n'
                  '• Considera la accesibilidad con contraste adecuado\n'
                  '• Permite cerrar alertas cuando sea apropiado',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.darkGray,
                    height: 1.4,
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