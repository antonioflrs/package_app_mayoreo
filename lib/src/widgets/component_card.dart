import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Card reutilizable para listar componentes del Design System.
/// Estructura optimizada y configurable para evitar dobles contenedores y overflows.
class ComponentCard extends StatefulWidget {
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
  final double descriptionFontSize;
  final Color descriptionColor;
  final double descriptionLineHeight;
  final double spacingBetweenElements;
  final double buttonHeight;
  final double buttonBorderRadius;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final double buttonFontSize;
  final FontWeight buttonFontWeight;
  final double cardHeight;

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
    this.cardPadding = 16.0,
    this.iconSize = 35.0,
    this.iconBorderRadius = 10.0,
    this.titleFontSize = 18.0,
    this.titleFontWeight = FontWeight.w600,
    this.titleColor = AppColors.black,
    this.descriptionFontSize = 14.0,
    this.descriptionColor = AppColors.darkGray,
    this.descriptionLineHeight = 1.4,
    this.spacingBetweenElements = 12.0,
    this.buttonHeight = 40.0,
    this.buttonBorderRadius = 8.0,
    this.buttonBackgroundColor = AppColors.orangeBrand,
    this.buttonTextColor = AppColors.white,
    this.buttonFontSize = 14.0,
    this.buttonFontWeight = FontWeight.w600,
    this.cardHeight = 210.0,
  });

  @override
  State<ComponentCard> createState() => _ComponentCardState();
}

class _ComponentCardState extends State<ComponentCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        height: widget.cardHeight,
        decoration: BoxDecoration(
          color: widget.cardBackgroundColor,
          borderRadius: BorderRadius.circular(widget.cardBorderRadius),
          border: Border.all(
            color: widget.cardBorderColor.withOpacity(0.2),
            width: widget.cardBorderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.cardShadowColor.withOpacity(0.05),
              blurRadius: widget.cardShadowBlur,
              offset: widget.cardShadowOffset,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con icono y badge
              Row(
                children: [
                  _buildComponentIcon(),
                  const Spacer(),
                  _buildCategoryBadge(),
                ],
              ),
              
              SizedBox(height: 8), // Gap reducido entre icono y título
              
              // Título del componente - UNA LÍNEA SIN ANIMACIÓN
              Text(
                widget.component.title,
                style: TextStyle(
                  fontSize: widget.titleFontSize,
                  fontWeight: widget.titleFontWeight,
                  color: widget.titleColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              SizedBox(height: 6), // Gap reducido entre título y descripción
              
              // Descripción del componente - MÁXIMO 2 LÍNEAS CON MÁS ESPACIO
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.component.description,
                      style: TextStyle(
                        fontSize: widget.descriptionFontSize,
                        color: widget.descriptionColor,
                        height: widget.descriptionLineHeight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    // Espacio adicional para la descripción
                    const Spacer(),
                    
                    // Indicador de información faltante
                    if (_hasTruncatedContent()) ...[
                      SizedBox(height: 8),
                      _buildExpandableIndicator(),
                    ],
                  ],
                ),
              ),

              // Botón CTA
              if (widget.showCtaButton) ...[
                SizedBox(height: widget.spacingBetweenElements),
                SizedBox(
                  width: double.infinity,
                  height: widget.buttonHeight,
                  child: ElevatedButton(
                    onPressed: widget.onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.buttonBackgroundColor,
                      foregroundColor: widget.buttonTextColor,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      widget.ctaText,
                      style: TextStyle(
                        fontSize: widget.buttonFontSize,
                        fontWeight: widget.buttonFontWeight,
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

  bool _hasTruncatedContent() {
    // Verificar si el título o descripción se están truncando
    final titleTextPainter = TextPainter(
      text: TextSpan(
        text: widget.component.title,
        style: TextStyle(
          fontSize: widget.titleFontSize,
          fontWeight: widget.titleFontWeight,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    titleTextPainter.layout();
    
    final descriptionTextPainter = TextPainter(
      text: TextSpan(
        text: widget.component.description,
        style: TextStyle(
          fontSize: widget.descriptionFontSize,
          height: widget.descriptionLineHeight,
        ),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );
    descriptionTextPainter.layout();
    
    return titleTextPainter.didExceedMaxLines || descriptionTextPainter.didExceedMaxLines;
  }

  Widget _buildExpandableIndicator() {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 decoration: BoxDecoration(
           color: AppColors.orangeBrand.withOpacity(0.1),
           borderRadius: BorderRadius.circular(12),
           border: Border.all(
             color: AppColors.orangeBrand.withOpacity(0.3),
             width: 1,
           ),
         ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              size: 12,
              color: AppColors.orangeBrand,
            ),
            const SizedBox(width: 4),
            Text(
              _isExpanded ? 'Menos' : 'Más info',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.orangeBrand,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentIcon() {
    final bool isGuide = widget.component.category == NavigationCategory.designGuides;
    final Color accent = isGuide ? AppColors.orangeBrand : AppColors.greenFree;

    return Container(
      width: widget.iconSize,
      height: widget.iconSize,
             decoration: BoxDecoration(
         color: accent.withOpacity(0.1),
         borderRadius: BorderRadius.circular(widget.iconBorderRadius),
       ),
      child: Center(
        child: widget.component.iconType == IconType.svg && widget.component.svgIcon != null
            ? SafeSvgIcon(
                iconPath: widget.component.svgIcon!,
                height: widget.iconSize * 0.5,
                color: accent,
              )
            : Icon(
                widget.component.icon ?? Icons.widgets, 
                size: widget.iconSize * 0.5,
                color: accent
              ),
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final bool isGuide = widget.component.category == NavigationCategory.designGuides;
    final String categoryText = isGuide ? 'Guía' : 'UI';
    final Color accent = isGuide ? AppColors.orangeBrand : AppColors.greenFree;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
             decoration: BoxDecoration(
         color: accent.withOpacity(0.1),
         borderRadius: BorderRadius.circular(12),
         border: Border.all(color: accent.withOpacity(0.3), width: 1),
       ),
      child: Text(
        categoryText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: accent,
        ),
      ),
    );
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
