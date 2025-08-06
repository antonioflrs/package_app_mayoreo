import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BadgeContent extends StatelessWidget {
  const BadgeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Descripción'),
        _buildDescription(),
        const SizedBox(height: 24),
        _buildSectionTitle('Tipos de Badge'),
        const SizedBox(height: 16),
        _buildBadgeExamples(),
        const SizedBox(height: 24),
        _buildSectionTitle('Tamaños'),
        const SizedBox(height: 16),
        _buildSizeExamples(),
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
        'Los componentes Badge se utilizan para mostrar información adicional como notificaciones, '
        'estados, o contadores. Pueden aparecer como pequeños indicadores sobre otros elementos.',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.darkGray,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBadgeExamples() {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBadgeItem('Nuevo', AppColors.greenFree),
              _buildBadgeItem('Pro', AppColors.orangeBrand),
              _buildBadgeItem('Beta', AppColors.yellow),
              _buildBadgeItem('Error', AppColors.digitalRed),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBadgeWithIcon('3', Icons.notifications, AppColors.digitalRed),
              _buildBadgeWithIcon('12', Icons.mail, AppColors.orangeBrand),
              _buildBadgeWithIcon('99+', Icons.message, AppColors.greenFree),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDotBadge('Activo', AppColors.greenFree),
              _buildDotBadge('Pendiente', AppColors.yellow),
              _buildDotBadge('Inactivo', AppColors.grayMedium),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBadgeWithIcon(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotBadge(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSizeExamples() {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSizeItem('Pequeño', 16),
              _buildSizeItem('Mediano', 20),
              _buildSizeItem('Grande', 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSizeItem(String size, double dimension) {
    return Column(
      children: [
        Container(
          width: dimension,
          height: dimension,
          decoration: BoxDecoration(
            color: AppColors.orangeBrand,
            borderRadius: BorderRadius.circular(dimension / 2),
          ),
          child: Center(
            child: Text(
              '3',
              style: TextStyle(
                color: AppColors.white,
                fontSize: dimension * 0.4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          size,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '${dimension.toInt()}px',
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.grayMedium,
          ),
        ),
      ],
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
              '// Badge simple\n'
              'Container(\n'
              '  padding: EdgeInsets.symmetric(\n'
              '    horizontal: 12, vertical: 6\n'
              '  ),\n'
              '  decoration: BoxDecoration(\n'
              '    color: AppColors.greenFree,\n'
              '    borderRadius: BorderRadius.circular(16),\n'
              '  ),\n'
              '  child: Text(\n'
              '    "Nuevo",\n'
              '    style: TextStyle(\n'
              '      color: AppColors.white,\n'
              '      fontSize: 12,\n'
              '      fontWeight: FontWeight.w600,\n'
              '    ),\n'
              '  ),\n'
              ')\n\n'
              '// Badge con Stack\n'
              'Stack(\n'
              '  children: [\n'
              '    Icon(Icons.notifications),\n'
              '    Positioned(\n'
              '      right: 0,\n'
              '      top: 0,\n'
              '      child: Container(\n'
              '        width: 16,\n'
              '        height: 16,\n'
              '        decoration: BoxDecoration(\n'
              '          color: AppColors.digitalRed,\n'
              '          borderRadius: BorderRadius.circular(8),\n'
              '        ),\n'
              '        child: Center(\n'
              '          child: Text("3", style: TextStyle(color: AppColors.white)),\n'
              '        ),\n'
              '      ),\n'
              '    ),\n'
              '  ],\n'
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
                  '• Usa colores consistentes para cada tipo de badge\n'
                  '• Mantén el texto corto y legible\n'
                  '• Considera el contraste para accesibilidad\n'
                  '• Usa tamaños apropiados para el contexto\n'
                  '• Evita usar demasiados badges en una pantalla',
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