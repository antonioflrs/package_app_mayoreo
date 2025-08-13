import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Card reutilizable para listar componentes del Design System.
/// Replica el diseño utilizado en `ComponentsSummaryScreen`.
class ComponentCard extends StatelessWidget {
  final NavigationItem component;
  final VoidCallback? onTap;
  final String ctaText;
  final bool showCtaButton;

  const ComponentCard({
    super.key,
    required this.component,
    this.onTap,
    this.ctaText = 'Ver Detalles',
    this.showCtaButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildComponentIcon(),
                  const Spacer(),
                  _buildCategoryBadge(),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                component.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  component.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGray,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showCtaButton) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeBrand,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      ctaText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComponentIcon() {
    final bool isGuide = component.category == NavigationCategory.designGuides;
    final Color accent = isGuide ? AppColors.orangeBrand : AppColors.greenFree;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: component.iconType == IconType.svg && component.svgIcon != null
            ? SafeSvgIcon(
                iconPath: component.svgIcon!,
                height: 20,
                color: accent,
              )
            : Icon(
                component.icon ?? Icons.widgets,
                size: 20,
                color: accent,
              ),
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final bool isGuide = component.category == NavigationCategory.designGuides;
    final String categoryText = isGuide ? 'Guía' : 'UI';
    final Color accent = isGuide ? AppColors.orangeBrand : AppColors.greenFree;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: accent.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        categoryText,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: accent,
        ),
      ),
    );
  }
}


