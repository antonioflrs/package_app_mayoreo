import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Datos de información del producto
class ProductInfoData {
  final String title;
  final String description;
  final int maxLines;

  const ProductInfoData({
    required this.title,
    required this.description,
    this.maxLines = 4,
  });
}

/// Colores personalizables para el ProductInfoWidget
class ProductInfoColors {
  final Color titleColor;
  final Color descriptionColor;
  final Color boldTextColor;
  final Color expandButtonColor;
  final Color gradientStartColor;
  final Color gradientMiddleColor;
  final Color gradientEndColor;

  const ProductInfoColors({
    this.titleColor = AppColors.black,
    this.descriptionColor = AppColors.black,
    this.boldTextColor = AppColors.black,
    this.expandButtonColor = AppColors.orangeBrand,
    this.gradientStartColor = Colors.white,
    this.gradientMiddleColor = Colors.white,
    this.gradientEndColor = Colors.white,
  });

  /// Tema oscuro predefinido
  factory ProductInfoColors.darkTheme() {
    return const ProductInfoColors(
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      boldTextColor: Colors.white,
      expandButtonColor: Colors.amber,
      gradientStartColor: Color(0xFF2C2C2C),
      gradientMiddleColor: Color(0xFF2C2C2C),
      gradientEndColor: Color(0xFF2C2C2C),
    );
  }

  /// Tema de marca predefinido
  factory ProductInfoColors.brandTheme() {
    return ProductInfoColors(
      titleColor: Colors.green,
      descriptionColor: Colors.green[800]!,
      boldTextColor: Colors.green,
      expandButtonColor: Colors.green,
      gradientStartColor: Colors.white,
      gradientMiddleColor: Colors.white,
      gradientEndColor: Colors.white,
    );
  }
}

/// Widget personalizable de información de producto con texto expandible y formato rico
class ProductInfoWidget extends StatefulWidget {
  final ProductInfoData productInfo;
  
  // Personalización de colores
  final ProductInfoColors? colors;
  
  // Personalización de estilos
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? boldTextStyle;
  final TextStyle? expandButtonStyle;
  
  // Personalización de tamaños
  final double? titleFontSize;
  final double? descriptionFontSize;
  final double? expandButtonFontSize;
  final double? gradientHeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? expandButtonTopPadding;
  
  // Personalización de funcionalidad
  final bool showTitle;
  final bool enableTextExpansion;
  final bool showGradientFade;
  final String? expandText;
  final String? collapseText;
  final int? maxLines;
  
  // Personalización de bordes y espaciado
  final double? borderRadius;
  final double? titleBottomSpacing;
  final double? descriptionBottomSpacing;

  const ProductInfoWidget({
    super.key,
    required this.productInfo,
    this.colors,
    this.titleStyle,
    this.descriptionStyle,
    this.boldTextStyle,
    this.expandButtonStyle,
    this.titleFontSize,
    this.descriptionFontSize,
    this.expandButtonFontSize,
    this.gradientHeight,
    this.horizontalPadding,
    this.verticalPadding,
    this.expandButtonTopPadding,
    this.showTitle = true,
    this.enableTextExpansion = true,
    this.showGradientFade = true,
    this.expandText,
    this.collapseText,
    this.maxLines,
    this.borderRadius,
    this.titleBottomSpacing,
    this.descriptionBottomSpacing,
  });

  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  bool _isExpanded = false;
  late ProductInfoColors _colors;
  late double _titleFontSize;
  late double _descriptionFontSize;
  late double _expandButtonFontSize;
  late double _gradientHeight;
  late double _horizontalPadding;
  late double _verticalPadding;
  late double _expandButtonTopPadding;
  late int _maxLines;
  late double _titleBottomSpacing;

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  void _initializeValues() {
    _colors = widget.colors ?? const ProductInfoColors();
    _titleFontSize = widget.titleFontSize ?? 18.0;
    _descriptionFontSize = widget.descriptionFontSize ?? 16.0;
    _expandButtonFontSize = widget.expandButtonFontSize ?? 14.0;
    _gradientHeight = widget.gradientHeight ?? 40.0;
    _horizontalPadding = widget.horizontalPadding ?? 0.0;
    _verticalPadding = widget.verticalPadding ?? 0.0;
    _expandButtonTopPadding = widget.expandButtonTopPadding ?? 0.0;
    _maxLines = widget.maxLines ?? widget.productInfo.maxLines;
    _titleBottomSpacing = widget.titleBottomSpacing ?? 16.0;
  }

  // Función para parsear texto con formato **negrita** y saltos de línea
  List<TextSpan> _parseTextWithBold(String text) {
    final List<TextSpan> spans = [];
    final RegExp boldPattern = RegExp(r'\*\*(.*?)\*\*');
    int currentIndex = 0;

    for (final Match match in boldPattern.allMatches(text)) {
      // Agregar texto antes de la parte en negrita
      if (match.start > currentIndex) {
        spans.add(TextSpan(
          text: text.substring(currentIndex, match.start),
          style: widget.descriptionStyle ?? TextStyle(
            fontSize: _descriptionFontSize,
            fontFamily: "InterVariable",
            fontWeight: FontWeight.w400,
            color: _colors.descriptionColor,
            fontFeatures: const [
              FontFeature('ss01'),
              FontFeature('cv11'),
            ],
          ),
        ));
      }

      // Agregar el texto en negrita
      spans.add(TextSpan(
        text: match.group(1),
        style: widget.boldTextStyle ?? TextStyle(
          fontSize: _descriptionFontSize,
          fontFamily: "InterVariable",
          fontWeight: FontWeight.w700,
          color: _colors.boldTextColor,
          fontFeatures: const [
            FontFeature('ss01'),
            FontFeature('cv11'),
          ],
        ),
      ));

      currentIndex = match.end;
    }

    // Agregar texto restante después de la última parte en negrita
    if (currentIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentIndex),
        style: widget.descriptionStyle ?? TextStyle(
          fontSize: _descriptionFontSize,
          fontFamily: "InterVariable",
          fontWeight: FontWeight.w400,
          color: _colors.descriptionColor,
          fontFeatures: const [
            FontFeature('ss01'),
            FontFeature('cv11'),
          ],
        ),
      ));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: _verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del producto
          if (widget.showTitle)
            Padding(
              padding: EdgeInsets.only(bottom: _titleBottomSpacing),
              child: Text(
                widget.productInfo.title,
                style: widget.titleStyle ?? TextStyle(
                  fontSize: _titleFontSize,
                  fontFamily: "InterVariable",
                  fontWeight: FontWeight.w700,
                  color: _colors.titleColor,
                  fontFeatures: const [
                    FontFeature('ss01'),
                    FontFeature('cv11'),
                  ],
                ),
              ),
            ),
          
          // Descripción con efecto de gradiente
          Stack(
            children: [
              // Texto principal con formato en negrita
              RichText(
                text: TextSpan(
                  children: _parseTextWithBold(widget.productInfo.description),
                ),
                maxLines: _isExpanded ? null : _maxLines,
                overflow: _isExpanded ? TextOverflow.clip : TextOverflow.visible,
              ),
              
              // Efecto de gradiente (solo cuando está colapsado)
              if (!_isExpanded && widget.showGradientFade)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: _gradientHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _colors.gradientStartColor.withValues(alpha: 0),
                          _colors.gradientMiddleColor.withValues(alpha: 0.8),
                          _colors.gradientEndColor,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          
          // Botón "Ver más"
          if (!_isExpanded && widget.enableTextExpansion)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = true;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: _expandButtonTopPadding),
                  child: Text(
                    widget.expandText ?? 'Ver más',
                    style: widget.expandButtonStyle ?? TextStyle(
                      fontSize: _expandButtonFontSize,
                      fontFamily: "InterVariable",
                      fontWeight: FontWeight.w600,
                      color: _colors.expandButtonColor,
                      fontFeatures: const [
                        FontFeature('ss01'),
                        FontFeature('cv11'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          
          // Botón "Ver menos"
          if (_isExpanded && widget.enableTextExpansion)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: _expandButtonTopPadding),
                  child: Text(
                    widget.collapseText ?? 'Ver menos',
                    style: widget.expandButtonStyle ?? TextStyle(
                      fontSize: _expandButtonFontSize,
                      fontFamily: "InterVariable",
                      fontWeight: FontWeight.w600,
                      color: _colors.expandButtonColor,
                      fontFeatures: const [
                        FontFeature('ss01'),
                        FontFeature('cv11'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Widget predefinido con tema oscuro
class ProductInfoDark extends StatelessWidget {
  final ProductInfoData productInfo;
  final bool showTitle;
  final bool enableTextExpansion;
  final bool showGradientFade;
  final String? expandText;
  final String? collapseText;
  final int? maxLines;

  const ProductInfoDark({
    super.key,
    required this.productInfo,
    this.showTitle = true,
    this.enableTextExpansion = true,
    this.showGradientFade = true,
    this.expandText,
    this.collapseText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return ProductInfoWidget(
      productInfo: productInfo,
      colors: ProductInfoColors.darkTheme(),
      showTitle: showTitle,
      enableTextExpansion: enableTextExpansion,
      showGradientFade: showGradientFade,
      expandText: expandText,
      collapseText: collapseText,
      maxLines: maxLines,
    );
  }
}

/// Widget predefinido con tema de marca
class ProductInfoBrand extends StatelessWidget {
  final ProductInfoData productInfo;
  final bool showTitle;
  final bool enableTextExpansion;
  final bool showGradientFade;
  final String? expandText;
  final String? collapseText;
  final int? maxLines;

  const ProductInfoBrand({
    super.key,
    required this.productInfo,
    this.showTitle = true,
    this.enableTextExpansion = true,
    this.showGradientFade = true,
    this.expandText,
    this.collapseText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return ProductInfoWidget(
      productInfo: productInfo,
      colors: ProductInfoColors.brandTheme(),
      showTitle: showTitle,
      enableTextExpansion: enableTextExpansion,
      showGradientFade: showGradientFade,
      expandText: expandText,
      collapseText: collapseText,
      maxLines: maxLines,
    );
  }
}
