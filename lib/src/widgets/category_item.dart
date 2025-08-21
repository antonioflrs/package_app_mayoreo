import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Widget CategoryItem con tres variantes de implementación y estado interno
class CategoryItem extends StatefulWidget {
  final String title;
  final String? activeIconPath; // Ruta del SVG activo (opcional)
  final String? inactiveIconPath; // Ruta del SVG inactivo (opcional)
  final VoidCallback? onTap;
  final bool initialSelected; // Estado inicial
  final CategoryItemVariant variant;
  final bool allowToggle; // Si permite cambiar estado al hacer clic

  const CategoryItem({
    super.key,
    required this.title,
    this.activeIconPath,
    this.inactiveIconPath,
    this.onTap,
    this.initialSelected = false,
    this.variant = CategoryItemVariant.basic,
    this.allowToggle = true,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialSelected;
  }

  void _handleTap() {
    if (widget.allowToggle) {
      setState(() {
        _isSelected = !_isSelected;
      });
    }
    
    // Llamar al callback original si existe
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
        top: 0.0,
        right: 16.0,
        bottom: 0.0,
      ),
      child: Container(
        width: double.infinity,
        height: 37.0,
        decoration: _buildDecoration(),
        alignment: Alignment.center,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: _handleTap,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 8.0,
              right: 16.0,
              bottom: 8.0,
            ),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    switch (widget.variant) {
      case CategoryItemVariant.basic:
        return BoxDecoration(
          color: _isSelected ? AppColors.backCards : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
        );
      
      case CategoryItemVariant.withIcon:
        return BoxDecoration(
          color: _isSelected ? AppColors.backCards : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
        );
      
      case CategoryItemVariant.colorful:
        return BoxDecoration(
          color: _isSelected ? AppColors.orangeBrand : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
          border: _isSelected 
            ? Border.all(color: AppColors.ochreBrand, width: 1.0)
            : Border.all(color: AppColors.silverGrayMedium, width: 1.0),
        );
    }
  }

  Widget _buildContent() {
    switch (widget.variant) {
      case CategoryItemVariant.basic:
        return _buildBasicContent();
      
      case CategoryItemVariant.withIcon:
        return _buildIconContent();
      
      case CategoryItemVariant.colorful:
        return _buildColorfulContent();
    }
  }

  Widget _buildBasicContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Espacio para mantener la alineación (sin icono)
        const SizedBox(width: 18.0),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "InterVariable",
              fontSize: 14.0,
              fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w300,
              color: _isSelected ? AppColors.black : Colors.black,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        // Espacio para mantener la alineación (sin flecha)
        const SizedBox(width: 8.0),
      ],
    );
  }

  Widget _buildIconContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icono SVG o fallback
        _buildSvgIcon(),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "InterVariable",
              fontSize: 14.0,
              fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w300,
              color: _isSelected ? AppColors.black : Colors.black,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        // Espacio para mantener la alineación (sin flecha)
        const SizedBox(width: 8.0),
      ],
    );
  }

  Widget _buildColorfulContent() {
    final textColor = _isSelected ? AppColors.white : AppColors.black;
    final iconColor = _isSelected ? AppColors.white : AppColors.grayMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icono con color dinámico
        if (widget.activeIconPath != null && widget.inactiveIconPath != null)
          _buildSvgIconWithColor(iconColor)
        else
          Icon(
            Icons.category,
            size: 18.0,
            color: iconColor,
          ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "InterVariable",
              fontSize: 14.0,
              fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w300,
              color: textColor,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        // Flecha con color dinámico
        Icon(
          Icons.arrow_forward_ios,
          size: 12.0,
          color: iconColor,
        ),
      ],
    );
  }

  Widget _buildSvgIcon() {
    // Aquí usarías flutter_svg si estuviera disponible
    // Por ahora uso un Icon como fallback
    return Icon(
      Icons.category,
      size: 18.0,
      color: _isSelected ? AppColors.orangeBrand : AppColors.grayMedium,
    );
  }

  Widget _buildSvgIconWithColor(Color color) {
    // Aquí usarías flutter_svg si estuviera disponible
    // Por ahora uso un Icon como fallback
    return Icon(
      Icons.category,
      size: 18.0,
      color: color,
    );
  }

  // Método público para obtener el estado actual
  bool get isSelected => _isSelected;
  
  // Método público para cambiar el estado programáticamente
  void setSelected(bool selected) {
    setState(() {
      _isSelected = selected;
    });
  }
}

/// Variantes del widget CategoryItem
enum CategoryItemVariant {
  /// Variante básica: solo texto, sin iconos
  basic,
  
  /// Variante con icono: incluye iconos SVG activo/inactivo
  withIcon,
  
  /// Variante colorida: cambia colores entre estados, incluye iconos y flecha
  colorful,
}

/// Widget CategoryItem con iconos SVG (requiere flutter_svg) y estado interno
class CategoryItemWithSvg extends StatefulWidget {
  final String title;
  final String activeIconPath;
  final String inactiveIconPath;
  final VoidCallback? onTap;
  final bool initialSelected;
  final CategoryItemVariant variant;
  final bool allowToggle;

  const CategoryItemWithSvg({
    super.key,
    required this.title,
    required this.activeIconPath,
    required this.inactiveIconPath,
    this.onTap,
    this.initialSelected = false,
    this.variant = CategoryItemVariant.withIcon,
    this.allowToggle = true,
  });

  @override
  State<CategoryItemWithSvg> createState() => _CategoryItemWithSvgState();
}

class _CategoryItemWithSvgState extends State<CategoryItemWithSvg> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialSelected;
  }

  void _handleTap() {
    if (widget.allowToggle) {
      setState(() {
        _isSelected = !_isSelected;
      });
    }
    
    // Llamar al callback original si existe
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
        top: 0.0,
        right: 16.0,
        bottom: 0.0,
      ),
      child: Container(
        width: double.infinity,
        height: 37.0,
        decoration: _buildDecoration(),
        alignment: Alignment.center,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: _handleTap,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 8.0,
              right: 16.0,
              bottom: 8.0,
            ),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    switch (widget.variant) {
      case CategoryItemVariant.basic:
        return BoxDecoration(
          color: _isSelected ? AppColors.backCards : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
        );
      
      case CategoryItemVariant.withIcon:
        return BoxDecoration(
          color: _isSelected ? AppColors.backCards : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
        );
      
      case CategoryItemVariant.colorful:
        return BoxDecoration(
          color: _isSelected ? AppColors.orangeBrand : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
          border: _isSelected 
            ? Border.all(color: AppColors.ochreBrand, width: 1.0)
            : Border.all(color: AppColors.silverGrayMedium, width: 1.0),
        );
    }
  }

  Widget _buildContent() {
    switch (widget.variant) {
      case CategoryItemVariant.basic:
        return _buildBasicContent();
      
      case CategoryItemVariant.withIcon:
        return _buildIconContent();
      
      case CategoryItemVariant.colorful:
        return _buildColorfulContent();
    }
  }

  Widget _buildBasicContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Espacio para mantener la alineación (sin icono)
        const SizedBox(width: 18.0),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "InterVariable",
              fontSize: 14.0,
              fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w300,
              color: _isSelected ? AppColors.black : Colors.black,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        // Espacio para mantener la alineación (sin flecha)
        const SizedBox(width: 8.0),
      ],
    );
  }

  Widget _buildIconContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icono SVG
        _buildSvgIcon(),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "InterVariable",
              fontSize: 14.0,
              fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w300,
              color: _isSelected ? AppColors.black : Colors.black,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        // Espacio para mantener la alineación (sin flecha)
        const SizedBox(width: 8.0),
      ],
    );
  }

  Widget _buildColorfulContent() {
    final textColor = _isSelected ? AppColors.white : AppColors.black;
    final iconColor = _isSelected ? AppColors.white : AppColors.grayMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icono SVG con color dinámico
        _buildSvgIconWithColor(iconColor),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "InterVariable",
              fontSize: 14.0,
              fontWeight: _isSelected ? FontWeight.w500 : FontWeight.w300,
              color: textColor,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        // Flecha con color dinámico
        Icon(
          Icons.arrow_forward_ios,
          size: 12.0,
          color: iconColor,
        ),
      ],
    );
  }

  Widget _buildSvgIcon() {
    // Comentado porque requiere flutter_svg
    // return SvgPicture.asset(
    //   _isSelected ? widget.activeIconPath : widget.inactiveIconPath,
    //   width: 18.0,
    //   height: 18.0,
    // );
    
    // Fallback con Icon
    return Icon(
      Icons.category,
      size: 18.0,
      color: _isSelected ? AppColors.orangeBrand : AppColors.grayMedium,
    );
  }

  Widget _buildSvgIconWithColor(Color color) {
    // Comentado porque requiere flutter_svg
    // return SvgPicture.asset(
    //   _isSelected ? widget.activeIconPath : widget.inactiveIconPath,
    //   width: 18.0,
    //   height: 18.0,
    //   colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    // );
    
    // Fallback con Icon
    return Icon(
      Icons.category,
      size: 18.0,
      color: color,
    );
  }

  // Método público para obtener el estado actual
  bool get isSelected => _isSelected;
  
  // Método público para cambiar el estado programáticamente
  void setSelected(bool selected) {
    setState(() {
      _isSelected = selected;
    });
  }
}
