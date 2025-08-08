import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BreadcrumbsContent extends StatelessWidget {
  const BreadcrumbsContent({super.key});

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
        _buildBreadcrumbExamples(),
        const SizedBox(height: 24),
        _buildSectionTitle('Variaciones'),
        const SizedBox(height: 16),
        _buildVariations(),
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
        'Los componentes Breadcrumbs proporcionan navegación jerárquica, mostrando la ubicación actual '
        'del usuario dentro de la estructura del sitio. Ayudan a los usuarios a entender dónde están y '
        'cómo regresar a niveles anteriores.',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.darkGray,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildBreadcrumbExamples() {
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
          _buildBreadcrumbItem([
            'Inicio',
            'Productos',
            'Electrónicos',
            'Smartphones',
          ]),
          const SizedBox(height: 16),
          _buildBreadcrumbItem([
            'Dashboard',
            'Ventas',
            'Reportes',
            'Mensual',
          ]),
          const SizedBox(height: 16),
          _buildBreadcrumbItem([
            'Configuración',
            'Perfil',
            'Seguridad',
          ]),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(List<String> items) {
    return Row(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: AppColors.grayMedium,
                ),
              ),
            GestureDetector(
              onTap: isLast ? null : () {
                // Navegación simulada
              },
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  color: isLast ? AppColors.black : AppColors.orangeBrand,
                  fontWeight: isLast ? FontWeight.w600 : FontWeight.w500,
                  decoration: isLast ? null : TextDecoration.underline,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildVariations() {
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
          _buildVariationItem(
            'Con iconos',
            [
              Icon(Icons.home, size: 16, color: AppColors.orangeBrand),
              Icon(Icons.inventory, size: 16, color: AppColors.orangeBrand),
              Icon(Icons.phone_android, size: 16, color: AppColors.black),
            ],
          ),
          const SizedBox(height: 16),
          _buildVariationItem(
            'Compacto',
            [
              Text('Inicio > Productos > Electrónicos > Smartphones'),
            ],
            isCompact: true,
          ),
          const SizedBox(height: 16),
          _buildVariationItem(
            'Con dropdown',
            [
              Text('Inicio'),
              Text('Productos'),
              Text('Más categorías...'),
            ],
            hasDropdown: true,
          ),
        ],
      ),
    );
  }

  Widget _buildVariationItem(String title, List<Widget> items, {
    bool isCompact = false,
    bool hasDropdown = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGray,
          ),
        ),
        const SizedBox(height: 8),
        if (isCompact)
          Text(
            items.first.toString(),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
            ),
          )
        else
          Row(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (index > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.chevron_right,
                        size: 16,
                        color: AppColors.grayMedium,
                      ),
                    ),
                  if (hasDropdown && index == items.length - 1)
                    Row(
                      children: [
                        Text(
                          'Más categorías',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.orangeBrand,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: AppColors.orangeBrand,
                        ),
                      ],
                    )
                  else
                    item,
                ],
              );
            }).toList(),
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
              '// Breadcrumb básico\n'
              'Row(\n'
              '  children: breadcrumbItems.map((item, index) {\n'
              '    final isLast = index == breadcrumbItems.length - 1;\n'
              '    return Row(\n'
              '      children: [\n'
              '        if (index > 0)\n'
              '          Icon(Icons.chevron_right, color: AppColors.grayMedium),\n'
              '        GestureDetector(\n'
              '          onTap: isLast ? null : () => navigateTo(item),\n'
              '          child: Text(\n'
              '            item,\n'
              '            style: TextStyle(\n'
              '              color: isLast ? AppColors.black : AppColors.orangeBrand,\n'
              '              fontWeight: isLast ? FontWeight.w600 : FontWeight.w500,\n'
              '            ),\n'
              '          ),\n'
              '        ),\n'
              '      ],\n'
              '    );\n'
              '  }).toList(),\n'
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
                  '• Mantén la jerarquía clara y lógica\n'
                  '• Usa nombres descriptivos para cada nivel\n'
                  '• Limita el número de niveles (máximo 5)\n'
                  '• Proporciona navegación funcional\n'
                  '• Considera el espacio disponible en móviles\n'
                  '• Usa separadores consistentes',
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