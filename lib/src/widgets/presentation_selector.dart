import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Datos de una presentación de producto
class PresentationData {
  final String name;
  final String description;
  final String imageUrl;
  final double originalPrice;
  final double discountedPrice;
  final int capsules;

  const PresentationData({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountedPrice,
    required this.capsules,
  });
}

/// Colores personalizables para el PresentationSelector
class PresentationSelectorColors {
  final Color titleColor;
  final Color descriptionColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color originalPriceColor;
  final Color discountedPriceColor;
  final Color selectedNameBackgroundColor;
  final Color unselectedNameBackgroundColor;
  final Color selectedNameTextColor;
  final Color unselectedNameTextColor;
  final Color cardBackgroundColor;

  const PresentationSelectorColors({
    this.titleColor = AppColors.black,
    this.descriptionColor = AppColors.black,
    this.selectedBorderColor = AppColors.orangeBrand,
    this.unselectedBorderColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.unselectedBackgroundColor = AppColors.softGray,
    this.originalPriceColor = AppColors.warmGray,
    this.discountedPriceColor = AppColors.black,
    this.selectedNameBackgroundColor = AppColors.orangeBrand,
    this.unselectedNameBackgroundColor = AppColors.backCards,
    this.selectedNameTextColor = AppColors.white,
    this.unselectedNameTextColor = AppColors.black,
    this.cardBackgroundColor = Colors.white,
  });

  /// Tema oscuro predefinido
  factory PresentationSelectorColors.darkTheme() {
    return PresentationSelectorColors(
      titleColor: Colors.white,
      descriptionColor: Colors.white70,
      selectedBorderColor: Colors.blue,
      unselectedBorderColor: Colors.grey,
      selectedBackgroundColor: Colors.transparent,
      unselectedBackgroundColor: Colors.grey[800]!,
      originalPriceColor: Colors.grey[400]!,
      discountedPriceColor: Colors.white,
      selectedNameBackgroundColor: Colors.blue,
      unselectedNameBackgroundColor: Colors.grey[700]!,
      selectedNameTextColor: Colors.white,
      unselectedNameTextColor: Colors.white70,
      cardBackgroundColor: Colors.grey[900]!,
    );
  }

  /// Tema de marca predefinido
  factory PresentationSelectorColors.brandTheme() {
    return PresentationSelectorColors(
      titleColor: Colors.white,
      descriptionColor: Colors.white70,
      selectedBorderColor: Colors.green,
      unselectedBorderColor: Colors.green.withValues(alpha: 0.3),
      selectedBackgroundColor: Colors.transparent,
      unselectedBackgroundColor: Colors.green.withValues(alpha: 0.1),
      originalPriceColor: Colors.grey[400]!,
      discountedPriceColor: Colors.white,
      selectedNameBackgroundColor: Colors.green,
      unselectedNameBackgroundColor: Colors.green.withValues(alpha: 0.2),
      selectedNameTextColor: Colors.white,
      unselectedNameTextColor: Colors.green[800]!,
      cardBackgroundColor: Colors.white,
    );
  }
}

/// Widget personalizable para seleccionar tipo de presentación de producto
class PresentationSelector extends StatefulWidget {
  final List<PresentationData> presentations;
  final int selectedIndex;
  final Function(int) onPresentationChanged;
  
  // Personalización de colores
  final PresentationSelectorColors? colors;
  
  // Personalización de estilos
  final String? titleText;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? originalPriceStyle;
  final TextStyle? discountedPriceStyle;
  final TextStyle? nameStyle;
  
  // Personalización de tamaños
  final double? cardWidth;
  final double? cardHeight;
  final double? cardSpacing;
  final double? imagePadding;
  final double? pricePadding;
  final double? namePadding;
  
  // Personalización de bordes
  final double? borderRadius;
  final double? selectedBorderWidth;
  final double? unselectedBorderWidth;
  
  // Personalización de funcionalidad
  final bool showTitle;
  final bool showDescription;
  final bool showCapsules;
  final bool showOriginalPrice;
  final bool showDiscountedPrice;
  final bool showImage;
  final bool showName;
  final bool enableHorizontalScroll;
  final bool enableSelection;

  const PresentationSelector({
    super.key,
    required this.presentations,
    required this.selectedIndex,
    required this.onPresentationChanged,
    this.colors,
    this.titleText,
    this.titleStyle,
    this.descriptionStyle,
    this.originalPriceStyle,
    this.discountedPriceStyle,
    this.nameStyle,
    this.cardWidth,
    this.cardHeight,
    this.cardSpacing,
    this.imagePadding,
    this.pricePadding,
    this.namePadding,
    this.borderRadius,
    this.selectedBorderWidth,
    this.unselectedBorderWidth,
    this.showTitle = true,
    this.showDescription = true,
    this.showCapsules = false,
    this.showOriginalPrice = true,
    this.showDiscountedPrice = true,
    this.showImage = true,
    this.showName = true,
    this.enableHorizontalScroll = true,
    this.enableSelection = true,
  });

  @override
  State<PresentationSelector> createState() => _PresentationSelectorState();
}

class _PresentationSelectorState extends State<PresentationSelector> {
  late PresentationSelectorColors _colors;
  late double _cardWidth;
  late double _cardHeight;
  late double _cardSpacing;
  late double _imagePadding;
  late double _pricePadding;
  late double _namePadding;
  late double _borderRadius;
  late double _selectedBorderWidth;
  late double _unselectedBorderWidth;

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  void _initializeValues() {
    _colors = widget.colors ?? const PresentationSelectorColors();
    _cardWidth = widget.cardWidth ?? 120.0;
    _cardHeight = widget.cardHeight ?? 160.0;
    _cardSpacing = widget.cardSpacing ?? 10.0;
    _imagePadding = widget.imagePadding ?? 4.0;
    _pricePadding = widget.pricePadding ?? 8.0;
    _namePadding = widget.namePadding ?? 6.0;
    _borderRadius = widget.borderRadius ?? 12.0;
    _selectedBorderWidth = widget.selectedBorderWidth ?? 2.0;
    _unselectedBorderWidth = widget.unselectedBorderWidth ?? 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título de la sección
        if (widget.showTitle) ...[
          Text(
            widget.titleText ?? 'Presentación seleccionada',
            style: widget.titleStyle ?? TextStyle(
              fontSize: 16.0,
              fontFamily: "InterVariable",
              fontWeight: FontWeight.w300,
              color: _colors.titleColor,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
          const SizedBox(height: 2),
        ],
        
        // Mostrar la presentación seleccionada
        if (widget.showDescription && widget.presentations.isNotEmpty) ...[
          Text(
            '${widget.presentations[widget.selectedIndex].name} | ${widget.presentations[widget.selectedIndex].description}',
            style: widget.descriptionStyle ?? TextStyle(
              fontSize: 18.0,
              fontFamily: "InterVariable",
              fontWeight: FontWeight.w700,
              color: _colors.descriptionColor,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
        
        // Tarjetas de presentaciones
        if (widget.enableHorizontalScroll)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildPresentationCards(),
          )
        else
          _buildPresentationCards(),
      ],
    );
  }

  Widget _buildPresentationCards() {
    return Row(
      children: List.generate(widget.presentations.length, (index) {
        final presentation = widget.presentations[index];
        final isSelected = widget.selectedIndex == index;
        
        return GestureDetector(
          onTap: widget.enableSelection 
            ? () => widget.onPresentationChanged(index)
            : null,
          child: Container(
            width: _cardWidth,
            height: _cardHeight,
            margin: EdgeInsets.only(right: index < widget.presentations.length - 1 ? _cardSpacing : 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? _colors.selectedBorderColor : _colors.unselectedBorderColor,
                width: isSelected ? _selectedBorderWidth : _unselectedBorderWidth,
              ),
              borderRadius: BorderRadius.circular(_borderRadius),
              color: isSelected ? _colors.selectedBackgroundColor : _colors.unselectedBackgroundColor,
            ),
            child: Column(
              children: [
                // Sección superior con precios
                if (widget.showOriginalPrice || widget.showDiscountedPrice)
                  Container(
                    padding: EdgeInsets.fromLTRB(_pricePadding, 2, _pricePadding, 2),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Precio original tachado
                        if (widget.showOriginalPrice)
                          Text(
                            '\$${presentation.originalPrice.toStringAsFixed(2)}',
                            textAlign: TextAlign.left,
                            style: widget.originalPriceStyle ?? TextStyle(
                              fontSize: 12.0,
                              fontFamily: "InterVariable",
                              decoration: TextDecoration.lineThrough,
                              decorationColor: _colors.originalPriceColor,
                              color: _colors.originalPriceColor,
                              fontFeatures: const [
                                FontFeature('ss01'),
                                FontFeature('cv11'),
                              ],
                            ),
                          ),
                        if (widget.showOriginalPrice && widget.showDiscountedPrice)
                          const SizedBox(height: 0),
                        // Precio con descuento
                        if (widget.showDiscountedPrice)
                          Text(
                            '\$${presentation.discountedPrice.toStringAsFixed(2)}',
                            textAlign: TextAlign.left,
                            style: widget.discountedPriceStyle ?? TextStyle(
                              fontSize: 16.0,
                              fontFamily: "InterVariable",
                              fontWeight: FontWeight.w700,
                              color: _colors.discountedPriceColor,
                              fontFeatures: const [
                                FontFeature('ss01'),
                                FontFeature('cv11'),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                
                // Imagen del producto
                if (widget.showImage)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: _imagePadding, vertical: 2),
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        presentation.imageUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: _colors.cardBackgroundColor,
                            child: Icon(
                              Icons.image,
                              size: 30,
                              color: _colors.originalPriceColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                
                
                // Sección inferior con nombre de presentación
                if (widget.showName)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: _namePadding),
                    decoration: BoxDecoration(
                      color: isSelected ? _colors.selectedNameBackgroundColor : _colors.unselectedNameBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(_borderRadius - 2),
                        bottomRight: Radius.circular(_borderRadius - 2),
                      ),
                    ),
                    child: Text(
                      presentation.name,
                      textAlign: TextAlign.center,
                      style: widget.nameStyle ?? TextStyle(
                        fontSize: 14.0,
                        fontFamily: "InterVariable",
                        fontWeight: FontWeight.w600,
                        color: isSelected ? _colors.selectedNameTextColor : _colors.unselectedNameTextColor,
                        fontFeatures: const [
                          FontFeature('ss01'),
                          FontFeature('cv11'),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/// Widget predefinido con tema oscuro
class PresentationSelectorDark extends StatelessWidget {
  final List<PresentationData> presentations;
  final int selectedIndex;
  final Function(int) onPresentationChanged;
  final String? titleText;
  final bool showTitle;
  final bool showDescription;

  const PresentationSelectorDark({
    super.key,
    required this.presentations,
    required this.selectedIndex,
    required this.onPresentationChanged,
    this.titleText,
    this.showTitle = true,
    this.showDescription = true,
  });

  @override
  Widget build(BuildContext context) {
    return PresentationSelector(
      presentations: presentations,
      selectedIndex: selectedIndex,
      onPresentationChanged: onPresentationChanged,
      colors: PresentationSelectorColors.darkTheme(),
      titleText: titleText,
      showTitle: showTitle,
      showDescription: showDescription,
    );
  }
}

/// Widget predefinido con tema de marca
class PresentationSelectorBrand extends StatelessWidget {
  final List<PresentationData> presentations;
  final int selectedIndex;
  final Function(int) onPresentationChanged;
  final String? titleText;
  final bool showTitle;
  final bool showDescription;

  const PresentationSelectorBrand({
    super.key,
    required this.presentations,
    required this.selectedIndex,
    required this.onPresentationChanged,
    this.titleText,
    this.showTitle = true,
    this.showDescription = true,
  });

  @override
  Widget build(BuildContext context) {
    return PresentationSelector(
      presentations: presentations,
      selectedIndex: selectedIndex,
      onPresentationChanged: onPresentationChanged,
      colors: PresentationSelectorColors.brandTheme(),
      titleText: titleText,
      showTitle: showTitle,
      showDescription: showDescription,
    );
  }
}
