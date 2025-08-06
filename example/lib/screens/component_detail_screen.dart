import 'package:flutter/material.dart';
import '../models/navigation_item.dart';
import '../widgets/app_bar_widget.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ComponentDetailScreen extends StatelessWidget {
  final NavigationItem component;

  const ComponentDetailScreen({
    super.key,
    required this.component,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGray,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            _buildHeaderSection(context),
            
            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildContentSection(context),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBarWidget(
      title: component.title,
      showMenuButton: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline, color: AppColors.black),
          onPressed: () => _showComponentInfo(context),
        ),
      ],
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and Title
          Row(
            children: [
              _buildComponentIcon(),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  component.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Description
          Text(
            component.description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.darkGray,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          // Category Badge
          _buildCategoryBadge(),
        ],
      ),
    );
  }

  Widget _buildComponentIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: component.iconType == IconType.material
            ? Icon(
                component.icon,
                size: 24,
                color: AppColors.black,
              )
            : Icon(
                Icons.widgets,
                size: 24,
                color: AppColors.black,
              ),
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final categoryText = component.category == NavigationCategory.designGuides
        ? 'Guía de Diseño'
        : 'Componente UI';
    
    final categoryColor = component.category == NavigationCategory.designGuides
        ? AppColors.orangeBrand
        : AppColors.greenFree;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: categoryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: categoryColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        categoryText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: categoryColor,
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    if (component.content != null) {
      return component.content!;
    } else {
      return _buildPlaceholderContent(context);
    }
  }

  Widget _buildPlaceholderContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.construction,
            size: 48,
            color: AppColors.grayMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Contenido en desarrollo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'El contenido para ${component.title.toLowerCase()} estará disponible próximamente.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Volver'),
          ),
        ],
      ),
    );
  }

  void _showComponentInfo(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Información del Componente',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('ID', component.id),
              _buildInfoRow('Título', component.title),
              _buildInfoRow('Descripción', component.description),
              _buildInfoRow('Categoría', 
                component.category == NavigationCategory.designGuides
                    ? 'Guía de Diseño'
                    : 'Componente UI'
              ),
              _buildInfoRow('Tipo de Icono', 
                component.iconType == IconType.material
                    ? 'Material Icon'
                    : 'SVG Icon'
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cerrar',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 