import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Widget de menú expandible personalizable con subcategorías
class ExpandableMenuItem extends StatefulWidget {
  /// Título del menú principal
  final String title;
  
  /// Icono Material activo (opcional)
  final IconData? activeIcon;
  
  /// Icono Material inactivo (opcional)
  final IconData? inactiveIcon;
  
  /// Lista de subcategorías
  final List<SubcategoryItem> children;
  
  /// Ancho del widget (por defecto ocupa todo el ancho disponible)
  final double? width;
  
  /// Altura del menú principal (por defecto 37.0)
  final double mainHeight;
  
  /// Altura de las subcategorías (por defecto 32.0)
  final double subcategoryHeight;
  
  /// Padding del menú principal
  final EdgeInsets mainPadding;
  
  /// Padding de las subcategorías
  final EdgeInsets subcategoryPadding;
  
  /// Padding izquierdo de las subcategorías
  final double subcategoryLeftPadding;
  
  /// Espacio entre subcategorías
  final double subcategorySpacing;
  
  /// Colores personalizables
  final ExpandableMenuItemColors? colors;
  
  /// Estilo del texto del menú principal
  final TextStyle? mainTextStyle;
  
  /// Estilo del texto de las subcategorías
  final TextStyle? subcategoryTextStyle;
  
  /// Callback cuando se expande/colapsa el menú
  final Function(bool isExpanded)? onExpansionChanged;
  
  /// Callback cuando se selecciona una subcategoría
  final Function(int index, SubcategoryItem item)? onSubcategorySelected;

  const ExpandableMenuItem({
    super.key,
    required this.title,
    this.activeIcon,
    this.inactiveIcon,
    required this.children,
    this.width,
    this.mainHeight = 37.0,
    this.subcategoryHeight = 32.0,
    this.mainPadding = const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
    this.subcategoryPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.subcategoryLeftPadding = 30.0,
    this.subcategorySpacing = 5.0,
    this.colors,
    this.mainTextStyle,
    this.subcategoryTextStyle,
    this.onExpansionChanged,
    this.onSubcategorySelected,
  });

  @override
  State<ExpandableMenuItem> createState() => _ExpandableMenuItemState();
}

class _ExpandableMenuItemState extends State<ExpandableMenuItem> {
  bool _isExpanded = false;
  int _selectedIndex = -1;

  final IconData _expandedIcon = Icons.keyboard_arrow_up;
  final IconData _collapsedIcon = Icons.keyboard_arrow_down;

  @override
  Widget build(BuildContext context) {
    final colors = widget.colors ?? ExpandableMenuItemColors.defaultColors();
    
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Column(
        children: [
          // Menú principal
          Container(
            width: double.infinity,
            height: widget.mainHeight,
            decoration: BoxDecoration(
              color: _isExpanded ? colors.expandedBackgroundColor : colors.collapsedBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(colors.mainBorderRadius),
                topRight: Radius.circular(colors.mainBorderRadius),
                bottomLeft: Radius.circular(colors.mainBorderRadius),
                bottomRight: Radius.circular(colors.mainBorderRadius),
              ),
            ),
            alignment: Alignment.center,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                  if (!_isExpanded) {
                    _selectedIndex = -1;
                  }
                });
                widget.onExpansionChanged?.call(_isExpanded);
              },
              child: Padding(
                padding: widget.mainPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icono principal (opcional)
                    if (widget.activeIcon != null && widget.inactiveIcon != null)
                      Icon(
                        _isExpanded ? widget.activeIcon! : widget.inactiveIcon!,
                        size: colors.mainIconSize,
                        color: _isExpanded ? colors.expandedIconColor : colors.collapsedIconColor,
                      ),
                    
                    if (widget.activeIcon != null && widget.inactiveIcon != null)
                      const SizedBox(width: 12.0),
                    
                    // Título
                    Expanded(
                      child: Text(
                        widget.title,
                        style: widget.mainTextStyle?.copyWith(
                          color: _isExpanded ? colors.expandedTextColor : colors.collapsedTextColor,
                        ) ?? TextStyle(
                          fontFamily: "InterVariable",
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: _isExpanded ? colors.expandedTextColor : colors.collapsedTextColor,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 12.0),
                    
                    // Icono de flecha
                    Icon(
                      _isExpanded ? _expandedIcon : _collapsedIcon,
                      size: colors.arrowIconSize,
                      color: _isExpanded ? colors.expandedArrowColor : colors.collapsedArrowColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Subcategorías expandidas
          if (_isExpanded)
            Container(
              color: colors.subcategoriesBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children.asMap().entries.map((entry) {
                  final index = entry.key;
                  final subcategory = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(left: widget.subcategoryLeftPadding),
                    child: SubcategoryItem(
                      text: subcategory.text,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        widget.onSubcategorySelected?.call(index, subcategory);
                        if (subcategory.onTap != null) {
                          subcategory.onTap!();
                        }
                      },
                      isSelected: _selectedIndex == index,
                      title: Text(subcategory.text),
                      height: widget.subcategoryHeight,
                      padding: widget.subcategoryPadding,
                      margin: EdgeInsets.symmetric(vertical: widget.subcategorySpacing),
                      colors: colors,
                      textStyle: widget.subcategoryTextStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

/// Clase para personalizar colores del ExpandableMenuItem
class ExpandableMenuItemColors {
  final Color expandedBackgroundColor;
  final Color collapsedBackgroundColor;
  final Color expandedTextColor;
  final Color collapsedTextColor;
  final Color expandedIconColor;
  final Color collapsedIconColor;
  final Color expandedArrowColor;
  final Color collapsedArrowColor;
  final Color subcategoriesBackgroundColor;
  final Color selectedSubcategoryBackgroundColor;
  final Color unselectedSubcategoryBackgroundColor;
  final Color subcategoryTextColor;
  final double mainBorderRadius;
  final double mainIconSize;
  final double arrowIconSize;

  const ExpandableMenuItemColors({
    required this.expandedBackgroundColor,
    required this.collapsedBackgroundColor,
    required this.expandedTextColor,
    required this.collapsedTextColor,
    required this.expandedIconColor,
    required this.collapsedIconColor,
    required this.expandedArrowColor,
    required this.collapsedArrowColor,
    required this.subcategoriesBackgroundColor,
    required this.selectedSubcategoryBackgroundColor,
    required this.unselectedSubcategoryBackgroundColor,
    required this.subcategoryTextColor,
    this.mainBorderRadius = 50.0,
    this.mainIconSize = 22.0,
    this.arrowIconSize = 22.0,
  });

  /// Colores por defecto usando AppColors
  factory ExpandableMenuItemColors.defaultColors() {
    return const ExpandableMenuItemColors(
      expandedBackgroundColor: AppColors.backCards,
      collapsedBackgroundColor: AppColors.white,
      expandedTextColor: AppColors.black,
      collapsedTextColor: AppColors.black,
      expandedIconColor: AppColors.orangeBrand,
      collapsedIconColor: AppColors.black,
      expandedArrowColor: AppColors.black,
      collapsedArrowColor: AppColors.black,
      subcategoriesBackgroundColor: AppColors.white,
      selectedSubcategoryBackgroundColor: AppColors.backCards,
      unselectedSubcategoryBackgroundColor: AppColors.white,
      subcategoryTextColor: AppColors.black,
    );
  }

  /// Colores personalizados con tema oscuro
  factory ExpandableMenuItemColors.darkTheme() {
    return const ExpandableMenuItemColors(
      expandedBackgroundColor: Color(0xFF2C2C2C),
      collapsedBackgroundColor: Color(0xFF1E1E1E),
      expandedTextColor: Colors.white,
      collapsedTextColor: Colors.white70,
      expandedIconColor: Colors.white,
      collapsedIconColor: Colors.white70,
      expandedArrowColor: Colors.white,
      collapsedArrowColor: Colors.white70,
      subcategoriesBackgroundColor: Color(0xFF1E1E1E),
      selectedSubcategoryBackgroundColor: Color(0xFF3C3C3C),
      unselectedSubcategoryBackgroundColor: Color(0xFF1E1E1E),
      subcategoryTextColor: Colors.white,
    );
  }

  /// Colores personalizados con tema de marca
  factory ExpandableMenuItemColors.brandTheme({
    required Color primaryColor,
    required Color secondaryColor,
  }) {
    return ExpandableMenuItemColors(
      expandedBackgroundColor: primaryColor.withValues(alpha: 0.1),
      collapsedBackgroundColor: Colors.white,
      expandedTextColor: primaryColor,
      collapsedTextColor: Colors.black87,
      expandedIconColor: primaryColor,
      collapsedIconColor: Colors.black54,
      expandedArrowColor: primaryColor,
      collapsedArrowColor: Colors.black54,
      subcategoriesBackgroundColor: Colors.white,
      selectedSubcategoryBackgroundColor: secondaryColor.withValues(alpha: 0.1),
      unselectedSubcategoryBackgroundColor: Colors.white,
      subcategoryTextColor: Colors.black87,
    );
  }
}

/// Elemento de subcategoría personalizable
class SubcategoryItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final Text title;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final ExpandableMenuItemColors? colors;
  final TextStyle? textStyle;

  const SubcategoryItem({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelected,
    required this.title,
    this.height = 32.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.margin = const EdgeInsets.symmetric(vertical: 5.0),
    this.colors,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final itemColors = colors ?? ExpandableMenuItemColors.defaultColors();
    
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: isSelected 
            ? itemColors.selectedSubcategoryBackgroundColor 
            : itemColors.unselectedSubcategoryBackgroundColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: textStyle?.copyWith(
            color: itemColors.subcategoryTextColor,
          ) ?? TextStyle(
            fontFamily: "InterVariable",
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: itemColors.subcategoryTextColor,
            fontFeatures: [
              FontFeature('ss01'),
              FontFeature('cv11'),
            ],
          ),
        ),
      ),
    );
  }
}
