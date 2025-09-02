import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';
import 'options_menu.dart';
import 'stacked_cards_widget.dart';

/// Widget para las cards de lista de favoritos
/// Utiliza StackedCardsWidget y OptionsMenu del sistema de diseño
class ListCard extends StatelessWidget {
  /// Datos de la lista
  final Map<String, dynamic> list;
  
  /// Callback cuando se toca la card
  final VoidCallback onTap;
  
  /// Callback para cambiar el nombre de la lista
  final VoidCallback onChangeName;
  
  /// Callback para eliminar la lista
  final VoidCallback onDelete;
  
  /// Altura de la card
  final double height;
  
  /// Margen inferior de la card
  final EdgeInsetsGeometry? margin;
  
  /// Color de fondo de la card
  final Color? backgroundColor;
  
  /// Color del borde de la card
  final Color? borderColor;
  
  /// Radio de los bordes de la card
  final double borderRadius;
  
  /// Tamaño de las tarjetas apiladas
  final double stackedCardsSize;
  
  /// Espaciado entre tarjetas apiladas
  final double stackedCardsSpacing;
  
  /// URL de imagen para las tarjetas apiladas
  final String? stackedCardsImageUrl;
  
  /// Lista de URLs de imágenes de productos para las tarjetas apiladas
  final List<String>? productImageUrls;
  
  /// Lista de textos personalizados para cada tarjeta
  final List<String>? customTexts;
  
  /// Lista de estilos de texto personalizados para cada tarjeta
  final List<TextStyle>? customTextStyles;
  
  /// Lista de colores de fondo personalizados para cada texto
  final List<Color>? customTextBackgroundColors;
  
  /// Lista de opacidades personalizadas para cada fondo de texto
  final List<double>? customTextBackgroundOpacities;
  
  /// Widget placeholder para las tarjetas apiladas
  final Widget? stackedCardsPlaceholder;
  
  /// Estilo del texto del nombre de la lista
  final TextStyle? nameTextStyle;
  
  /// Estilo del texto del contador de productos
  final TextStyle? countTextStyle;
  
  /// Padding interno de la card
  final EdgeInsetsGeometry? padding;

  const ListCard({
    super.key,
    required this.list,
    required this.onTap,
    required this.onChangeName,
    required this.onDelete,
    this.height = 90.0,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 12.0,
    this.stackedCardsSize = 50.0,
    this.stackedCardsSpacing = 4.0,
    this.stackedCardsImageUrl,
    this.productImageUrls,
    this.customTexts,
    this.customTextStyles,
    this.customTextBackgroundColors,
    this.customTextBackgroundOpacities,
    this.stackedCardsPlaceholder,
    this.nameTextStyle,
    this.countTextStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 12.0),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        border: Border.all(color: borderColor ?? AppColors.backCards),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            // Botón de opciones en la parte superior derecha (solo para listas no por defecto)
            if (!list['isDefault'])
              Positioned(
                top: -7,
                right: -9,
                child: OptionsMenu(
                  options: [
                    MenuOption(
                      title: 'Cambiar nombre',
                      icon: Icons.edit,
                      onTap: onChangeName,
                    ),
                    MenuOption(
                      title: 'Eliminar',
                      icon: Icons.delete,
                      onTap: onDelete,
                    ),
                  ],
                  triggerIcon: Icons.more_vert,
                  inactiveIconColor: AppColors.grayMedium,
                  activeIconColor: AppColors.greenFree,
                  iconSize: 20.0,
                  overlayWidth: 170.0,
                  overlayOffset: const Offset(-143, 35),
                  elevation: 8.0,
                  borderRadius: 8.0,
                  overlayBackgroundColor: AppColors.white,
                  separatorColor: AppColors.backCards,
                  horizontalPadding: 12.0,
                  verticalPadding: 12.0,
                  fontSize: 14.0,
                  fontFamily: 'InterVariable',
                ),
              ),

            // Contenido principal
            Padding(
              padding: padding ?? const EdgeInsets.only(
                left: 16.0,
                right: 0.0, // Sin padding derecho para que las cards se peguen
                top: 16.0,
                bottom: 12.0,
              ),
              child: Row(
                children: [
                  // Información de la lista
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0.0), // Espacio mínimo entre texto y cards
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            list['name'] ?? 'Lista sin nombre',
                            style: nameTextStyle ?? const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontFamily: 'InterVariable',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            _getProductCountText(),
                            style: countTextStyle ?? const TextStyle(
                              fontSize: 14,
                              color: AppColors.grayMedium,
                              fontFamily: 'InterVariable',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Tarjetas apiladas pegadas al lado derecho
                  Transform.translate(
                    offset: const Offset(20, 0), // Mueve las cards más hacia la derecha
                    child: StackedCardsWidget(
                      productCount: list['productCount'] ?? 0,
                      width: 45,
                      height: 55,
                      spacing: stackedCardsSpacing,
                      imageUrl: stackedCardsImageUrl,
                      imageUrls: productImageUrls,
                      customTexts: customTexts,
                      customTextStyles: customTextStyles,
                      customTextBackgroundColors: customTextBackgroundColors,
                      customTextBackgroundOpacities: customTextBackgroundOpacities,
                      placeholderWidget: stackedCardsPlaceholder,
                      cardBackgroundColor: backgroundColor ?? Colors.grey[50],
                      cardBorderColor: borderColor ?? Colors.grey[300],
                      cardBorderRadius: borderRadius,
                      onCardTap: onTap,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  /// Genera el texto del contador de productos
  String _getProductCountText() {
    final count = list['productCount'] ?? 0;
    return '$count producto${count != 1 ? 's' : ''}';
  }
}
