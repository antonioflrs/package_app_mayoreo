import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Modelo para representar una opción del menú
class MenuOption {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const MenuOption({
    required this.title,
    this.icon,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });
}

/// Widget personalizable de menú de opciones con overlay
class OptionsMenu extends StatefulWidget {
  /// Lista de opciones del menú
  final List<MenuOption> options;
  
  /// Icono del botón trigger (por defecto: Icons.more_vert)
  final IconData? triggerIcon;
  
  /// Color del icono cuando está inactivo
  final Color? inactiveIconColor;
  
  /// Color del icono cuando está activo
  final Color? activeIconColor;
  
  /// Tamaño del icono del botón trigger
  final double iconSize;
  
  /// Ancho del overlay del menú
  final double overlayWidth;
  
  /// Offset del overlay respecto al botón trigger
  final Offset overlayOffset;
  
  /// Elevación del overlay
  final double elevation;
  
  /// Radio de los bordes del overlay
  final double borderRadius;
  
  /// Color de fondo del overlay
  final Color? overlayBackgroundColor;
  
  /// Color de los separadores entre opciones
  final Color? separatorColor;
  
  /// Padding horizontal de las opciones
  final double horizontalPadding;
  
  /// Padding vertical de las opciones
  final double verticalPadding;
  
  /// Tamaño de fuente del texto de las opciones
  final double fontSize;
  
  /// Familia de fuente del texto de las opciones
  final String? fontFamily;
  
  /// Color de fondo del overlay cuando se presiona una opción
  final Color? pressedBackgroundColor;

  const OptionsMenu({
    super.key,
    required this.options,
    this.triggerIcon,
    this.inactiveIconColor,
    this.activeIconColor,
    this.iconSize = 20.0,
    this.overlayWidth = 170.0,
    this.overlayOffset = const Offset(-143, 35),
    this.elevation = 8.0,
    this.borderRadius = 8.0,
    this.overlayBackgroundColor,
    this.separatorColor,
    this.horizontalPadding = 12.0,
    this.verticalPadding = 12.0,
    this.fontSize = 14.0,
    this.fontFamily,
    this.pressedBackgroundColor,
  });

  @override
  State<OptionsMenu> createState() => _OptionsMenuState();
}

class _OptionsMenuState extends State<OptionsMenu> {
  final LayerLink _layerLink = LayerLink();
  bool _showOptionsMenu = false;
  OverlayEntry? _overlayEntry;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    _closeOverlay();
    super.dispose();
  }

  void _showOptionsOverlay() {
    if (_isDisposed || !mounted) return;
    
    final overlay = Overlay.of(context);
    
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _closeOverlay(),
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                width: widget.overlayWidth,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: widget.overlayOffset,
                  child: Material(
                    elevation: widget.elevation,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.overlayBackgroundColor ?? AppColors.white,
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4.0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _buildMenuOptions(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  List<Widget> _buildMenuOptions() {
    final List<Widget> optionWidgets = [];
    
    for (int i = 0; i < widget.options.length; i++) {
      final option = widget.options[i];
      final isFirst = i == 0;
      final isLast = i == widget.options.length - 1;
      
      // Agregar separador si no es la primera opción
      if (!isFirst) {
        optionWidgets.add(
          Container(
            height: 1,
            color: widget.separatorColor ?? AppColors.backCards,
          ),
        );
      }
      
             // Agregar la opción
       optionWidgets.add(
         InkWell(
           onTap: () {
             if (!_isDisposed && mounted) {
               option.onTap();
               _closeOverlay();
             }
           },
           borderRadius: _getBorderRadius(isFirst, isLast),
           child: Container(
             padding: EdgeInsets.symmetric(
               horizontal: widget.horizontalPadding,
               vertical: widget.verticalPadding,
             ),
             child: Row(
               children: [
                 if (option.icon != null) ...[
                   Icon(
                     option.icon,
                     color: option.iconColor ?? AppColors.black,
                     size: 18,
                   ),
                   const SizedBox(width: 12.0),
                 ],
                 Expanded(
                   child: Text(
                     option.title,
                     style: TextStyle(
                       fontSize: widget.fontSize,
                       color: option.textColor ?? AppColors.black,
                       fontFamily: widget.fontFamily ?? 'InterVariable',
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       );
    }
    
    return optionWidgets;
  }

  BorderRadius _getBorderRadius(bool isFirst, bool isLast) {
    if (isFirst && isLast) {
      // Solo una opción
      return BorderRadius.circular(widget.borderRadius);
    } else if (isFirst) {
      // Primera opción
      return const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      );
    } else if (isLast) {
      // Última opción
      return const BorderRadius.only(
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      );
    } else {
      // Opción del medio
      return BorderRadius.zero;
    }
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (!_isDisposed && mounted) {
      setState(() {
        _showOptionsMenu = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IconButton(
        onPressed: () {
          if (_isDisposed || !mounted) return;
          
          if (_showOptionsMenu) {
            _closeOverlay();
          } else {
            if (mounted) {
              setState(() {
                _showOptionsMenu = true;
              });
              _showOptionsOverlay();
            }
          }
        },
        icon: Icon(
          widget.triggerIcon ?? Icons.more_vert,
          color: _showOptionsMenu
              ? (widget.activeIconColor ?? AppColors.greenFree)
              : (widget.inactiveIconColor ?? AppColors.grayMedium),
          size: widget.iconSize,
        ),
      ),
    );
  }
}
