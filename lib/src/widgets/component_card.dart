import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Card reutilizable para listar componentes del Design System.
/// Estructura optimizada y configurable para evitar dobles contenedores y overflows.
class ComponentCard extends StatelessWidget {
  final NavigationItem component;
  final VoidCallback? onTap;
  final String ctaText;
  final bool showCtaButton;
  
  // Variables de diseño configurables
  final double cardBorderRadius;
  final double cardBorderWidth;
  final Color cardBorderColor;
  final Color cardBackgroundColor;
  final double cardShadowBlur;
  final Offset cardShadowOffset;
  final Color cardShadowColor;
  final double cardPadding;
  final double iconSize;
  final double iconBorderRadius;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Color titleColor;
  final int titleMaxLines;
  final double descriptionFontSize;
  final Color descriptionColor;
  final double descriptionLineHeight;
  final int descriptionMaxLines;
  final double spacingBetweenElements;
  final double buttonHeight;
  final double buttonBorderRadius;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final double buttonFontSize;
  final FontWeight buttonFontWeight;

  const ComponentCard({
    super.key,
    required this.component,
    this.onTap,
    this.ctaText = 'Ver Detalles',
    this.showCtaButton = true,
    // Valores por defecto para diseño
    this.cardBorderRadius = 16.0,
    this.cardBorderWidth = 1.0,
    this.cardBorderColor = AppColors.grayMedium,
    this.cardBackgroundColor = AppColors.white,
    this.cardShadowBlur = 8.0,
    this.cardShadowOffset = const Offset(0, 2),
    this.cardShadowColor = AppColors.black,
    this.cardPadding = 10.0,
    this.iconSize = 40.0,
    this.iconBorderRadius = 10.0,
    this.titleFontSize = 16.0,
    this.titleFontWeight = FontWeight.w600,
    this.titleColor = AppColors.black,
    this.titleMaxLines = 2,
    this.descriptionFontSize = 14.0,
    this.descriptionColor = AppColors.darkGray,
    this.descriptionLineHeight = 1.4,
    this.descriptionMaxLines = 3,
    this.spacingBetweenElements = 10.0,
    this.buttonHeight = 36.0,
    this.buttonBorderRadius = 8.0,
    this.buttonBackgroundColor = AppColors.orangeBrand,
    this.buttonTextColor = AppColors.white,
    this.buttonFontSize = 12.0,
    this.buttonFontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(cardBorderRadius),
          border: Border.all(
            color: cardBorderColor.withValues(alpha: 0.2),
            width: cardBorderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: cardShadowColor.withValues(alpha: 0.05),
              blurRadius: cardShadowBlur,
              offset: cardShadowOffset,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header con icono y badge
              Row(
                children: [
                  _buildComponentIcon(),
                  const Spacer(),
                  _buildCategoryBadge(),
                ],
              ),
              
              SizedBox(height: spacingBetweenElements),
              
              // Título del componente
              Flexible(
                child: Text(
                  component.title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: titleFontWeight,
                    color: titleColor,
                  ),
                  maxLines: titleMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              SizedBox(height: spacingBetweenElements),
              
              // Descripción del componente
              Flexible(
                child: Text(
                  component.description,
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    color: descriptionColor,
                    height: descriptionLineHeight,
                  ),
                  maxLines: descriptionMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Botón CTA (opcional)
              if (showCtaButton) ...[
                SizedBox(height: spacingBetweenElements + 8),
                SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBackgroundColor,
                      foregroundColor: buttonTextColor,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonBorderRadius),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      ctaText,
                      style: TextStyle(
                        fontSize: buttonFontSize,
                        fontWeight: buttonFontWeight,
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
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(iconBorderRadius),
      ),
      child: Center(
        child: component.iconType == IconType.svg && component.svgIcon != null
            ? SafeSvgIcon(
                iconPath: component.svgIcon!,
                height: iconSize * 0.5, // 50% del tamaño del contenedor
                color: accent,
              )
            : Icon(
                component.icon ?? Icons.widgets, 
                size: iconSize * 0.5, // 50% del tamaño del contenedor
                color: accent
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
        border: Border.all(color: accent.withValues(alpha: 0.3), width: 1),
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
