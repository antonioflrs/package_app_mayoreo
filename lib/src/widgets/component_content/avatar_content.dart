import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class AvatarContent extends StatelessWidget {
  const AvatarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Descripción'),
        _buildDescription(),
        const SizedBox(height: 24),
        _buildSectionTitle('Tipos de Avatar'),
        const SizedBox(height: 16),
        _buildAvatarExamples(),
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
        'Los componentes Avatar se utilizan para mostrar imágenes de perfil de usuarios. '
        'Pueden mostrar fotos reales, iniciales, o iconos por defecto cuando no hay imagen disponible.',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.darkGray,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildAvatarExamples() {
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
            children: [
              _buildAvatarItem('Con imagen', Icons.person, hasImage: true),
              const SizedBox(width: 16),
              _buildAvatarItem('Con iniciales', Icons.person, hasInitials: true),
              const SizedBox(width: 16),
              _buildAvatarItem('Icono por defecto', Icons.person, hasDefaultIcon: true),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildAvatarItem('Estado activo', Icons.person, isActive: true),
              const SizedBox(width: 16),
              _buildAvatarItem('Estado inactivo', Icons.person, isInactive: true),
              const SizedBox(width: 16),
              _buildAvatarItem('Con badge', Icons.person, hasBadge: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarItem(String label, IconData icon, {
    bool hasImage = false,
    bool hasInitials = false,
    bool hasDefaultIcon = false,
    bool isActive = false,
    bool isInactive = false,
    bool hasBadge = false,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: hasImage 
                    ? AppColors.orangeBrand 
                    : hasInitials 
                        ? AppColors.greenFree 
                        : AppColors.grayMedium,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isActive 
                      ? AppColors.greenFree 
                      : isInactive 
                          ? AppColors.grayMedium 
                          : AppColors.white,
                  width: 2,
                ),
              ),
              child: Center(
                child: hasImage 
                    ? const Icon(Icons.person, color: AppColors.white, size: 30)
                    : hasInitials 
                        ? const Text(
                            'JD',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Icon(icon, color: AppColors.white, size: 30),
              ),
            ),
            if (hasBadge)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.digitalRed,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.darkGray,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
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
              _buildSizeItem('XS', 32),
              _buildSizeItem('S', 40),
              _buildSizeItem('M', 48),
              _buildSizeItem('L', 56),
              _buildSizeItem('XL', 64),
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
            child: Icon(
              Icons.person,
              color: AppColors.white,
              size: dimension * 0.5,
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
              '// Avatar con imagen\n'
              'CircleAvatar(\n'
              '  radius: 24,\n'
              '  backgroundImage: NetworkImage(imageUrl),\n'
              '  child: imageUrl == null\n'
              '    ? Icon(Icons.person, color: AppColors.white)\n'
              '    : null,\n'
              ')\n\n'
              '// Avatar con iniciales\n'
              'CircleAvatar(\n'
              '  radius: 24,\n'
              '  backgroundColor: AppColors.greenFree,\n'
              '  child: Text(\n'
              '    "JD",\n'
              '    style: TextStyle(color: AppColors.white),\n'
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
                  '• Usa imágenes cuadradas para mejores resultados\n'
                  '• Proporciona fallbacks para cuando no hay imagen\n'
                  '• Mantén consistencia en los tamaños\n'
                  '• Considera la accesibilidad con alt text\n'
                  '• Usa colores de marca para avatares por defecto',
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