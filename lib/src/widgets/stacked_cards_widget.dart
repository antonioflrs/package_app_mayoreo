import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Widget personalizable para mostrar tarjetas apiladas con efecto de rotación
/// 
/// Este widget permite mostrar de 1 a múltiples tarjetas apiladas con efectos visuales
/// personalizables. Soporta:
/// 
/// - **Dimensiones personalizadas**: width y height independientes
/// - **Imágenes múltiples**: URLs individuales para cada tarjeta
/// - **Textos personalizados**: textos específicos para tarjeta principal y del fondo
/// - **Estilos completos**: colores, bordes, sombras, rotaciones
/// - **Placeholders personalizados**: widgets personalizados para cada tarjeta
/// - **Callbacks**: eventos de toque para tarjeta principal y del fondo
/// 
/// Ejemplos de uso:
/// 
/// ```dart
/// // Una tarjeta básica
/// StackedCardsWidget(
///   productCount: 1,
///   imageUrl: 'https://example.com/image.jpg',
/// )
/// 
/// // Dos tarjetas con texto personalizado
/// StackedCardsWidget(
///   productCount: 2,
///   imageUrls: ['url1.jpg', 'url2.jpg'],
///   mainCardText: '+2',
///   backgroundCardText: '1',
/// )
/// 
/// // Tres tarjetas con dimensiones personalizadas
/// StackedCardsWidget(
///   productCount: 3,
///   width: 80.0,
///   height: 100.0,
///   customTexts: ['+3', '2', '1'],
///   customTextBackgroundColors: [Colors.green, Colors.orange, Colors.red],
/// )
/// ```
class StackedCardsWidget extends StatelessWidget {
  /// Número de productos a mostrar
  final int productCount;
  
  /// Tamaño base de las tarjetas (ancho y alto)
  final double size;
  
  /// Ancho personalizado de las tarjetas (sobrescribe size para el ancho)
  final double? width;
  
  /// Alto personalizado de las tarjetas (sobrescribe size para el alto)
  final double? height;
  
  /// Espaciado entre tarjetas
  final double spacing;
  
  /// URL de la imagen a mostrar en las tarjetas
  final String? imageUrl;
  
  /// Lista de URLs de imágenes para múltiples tarjetas
  final List<String>? imageUrls;
  
  /// Widget personalizado para mostrar cuando no hay imagen
  final Widget? placeholderWidget;
  
  /// Lista de widgets personalizados para cada tarjeta
  final List<Widget>? placeholderWidgets;
  
  /// Color de fondo de las tarjetas
  final Color? cardBackgroundColor;
  
  /// Color del borde de las tarjetas
  final Color? cardBorderColor;
  
  /// Radio del borde de las tarjetas
  final double? cardBorderRadius;
  
  /// Color de la sombra
  final Color? shadowColor;
  
  /// Radio de desenfoque de la sombra
  final double? shadowBlurRadius;
  
  /// Offset de la sombra
  final Offset? shadowOffset;
  
  /// Estilo del texto de cantidad (para compatibilidad)
  final TextStyle? quantityTextStyle;
  
  /// Color de fondo del texto de cantidad (para compatibilidad)
  final Color? quantityBackgroundColor;
  
  /// Opacidad del fondo del texto de cantidad (para compatibilidad)
  final double? quantityBackgroundOpacity;
  
  /// Máximo número de tarjetas a mostrar
  final int? maxDisplayCount;
  
  /// Ángulos de rotación personalizados para cada tarjeta
  final List<double>? customRotationAngles;
  
  /// Offsets personalizados para cada tarjeta
  final List<double>? customLeftOffsets;
  
  /// Callback cuando se toca una tarjeta
  final VoidCallback? onCardTap;
  
  /// Callback cuando se toca la tarjeta principal
  final VoidCallback? onMainCardTap;
  
  /// Texto a mostrar en la tarjeta principal (cuando hay 2 o más)
  final String? mainCardText;
  
  /// Lista de textos personalizados para cada tarjeta (solo se usa el último para la tarjeta principal)
  final List<String>? customTexts;
  
  /// Estilo del texto principal
  final TextStyle? mainTextStyle;
  
  /// Lista de estilos personalizados para cada tarjeta (solo se usa el último para la tarjeta principal)
  final List<TextStyle>? customTextStyles;
  
  /// Color de fondo del texto principal
  final Color? mainTextBackgroundColor;
  
  /// Lista de colores de fondo personalizados para cada texto (solo se usa el último para la tarjeta principal)
  final List<Color>? customTextBackgroundColors;
  
  /// Opacidad del fondo del texto principal
  final double? mainTextBackgroundOpacity;
  
  /// Lista de opacidades personalizadas para cada fondo de texto (solo se usa el último para la tarjeta principal)
  final List<double>? customTextBackgroundOpacities;

  const StackedCardsWidget({
    super.key,
    required this.productCount,
    this.size = 60.0,
    this.width = 55.0,
    this.height = 65.0,
    this.spacing = 4.0,
    this.imageUrl,
    this.imageUrls,
    this.placeholderWidget,
    this.placeholderWidgets,
    this.cardBackgroundColor,
    this.cardBorderColor,
    this.cardBorderRadius,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowOffset,
    this.quantityTextStyle,
    this.quantityBackgroundColor,
    this.quantityBackgroundOpacity,
    this.maxDisplayCount,
    this.customRotationAngles,
    this.customLeftOffsets,
    this.onCardTap,
    this.onMainCardTap,
    this.mainCardText,
    this.customTexts,
    this.mainTextStyle,
    this.customTextStyles,
    this.mainTextBackgroundColor,
    this.customTextBackgroundColors,
    this.mainTextBackgroundOpacity,
    this.customTextBackgroundOpacities,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = width ?? size;
    final cardHeight = height ?? size;
    
    if (productCount <= 0) {
      return SizedBox(width: cardWidth, height: cardHeight);
    }

    if (productCount == 1) {
      return _buildSingleCard();
    }

    return _buildMultipleCards();
  }

  /// Construye una sola tarjeta
  Widget _buildSingleCard() {
    final cardWidth = width ?? size;
    final cardHeight = height ?? size;
    
    return SizedBox(
      width: cardWidth + 80,
      height: cardHeight + 20,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            top: 1,
            child: Transform.rotate(
              angle: 0.0,
              child: _buildCard(
                isMain: true,
                index: 0,
                totalCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye múltiples tarjetas apiladas
  Widget _buildMultipleCards() {
    final cardWidth = width ?? size;
    final cardHeight = height ?? size;
    final displayCount = maxDisplayCount != null 
        ? (productCount > maxDisplayCount! ? maxDisplayCount! : productCount)
        : (productCount > 3 ? 3 : productCount);

    return SizedBox(
      width: cardWidth + (spacing * (displayCount - 1)) + 100,
      height: cardHeight + 20,
      child: Stack(
        children: List.generate(displayCount, (index) {
          final isLast = index == displayCount - 1;

          // Calcular ángulos y offsets
          double leftOffset = _calculateLeftOffset(index, displayCount);
          double rotationAngle = _calculateRotationAngle(index, displayCount);

          return Positioned(
            left: leftOffset + 60,
            top: 1,
            child: Transform.rotate(
              angle: rotationAngle * (3.14159 / 180),
              child: _buildCard(
                isMain: isLast,
                index: index,
                totalCount: displayCount,
              ),
            ),
          );
        }),
      ),
    );
  }

  /// Construye una tarjeta individual
  Widget _buildCard({
    required bool isMain,
    required int index,
    required int totalCount,
  }) {
    final cardWidth = width ?? size;
    final cardHeight = height ?? size;
    
    return GestureDetector(
      onTap: isMain ? onMainCardTap : onCardTap,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: cardBackgroundColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(cardBorderRadius ?? 8.0),
          border: Border.all(color: cardBorderColor ?? AppColors.backCards),
          boxShadow: [
            BoxShadow(
              color: (shadowColor ?? Colors.black).withValues(alpha: 0.05),
              blurRadius: shadowBlurRadius ?? 3.0,
              offset: shadowOffset ?? const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cardBorderRadius ?? 8.0),
          child: Stack(
            children: [
              // Imagen o placeholder
              _buildImageOrPlaceholder(index),

              // Overlay para tarjetas del fondo (removido para mostrar las imágenes)

              // Texto personalizado solo para la tarjeta principal
              if (isMain) _buildCustomText(isMain, index),
            ],
          ),
        ),
      ),
    );
  }

  /// Construye la imagen o el placeholder
  Widget _buildImageOrPlaceholder(int index) {
    final cardWidth = width ?? size;
    final cardHeight = height ?? size;
    
    // Priorizar imagen específica para esta tarjeta
    String? currentImageUrl;
    if (imageUrls != null && index < imageUrls!.length) {
      currentImageUrl = imageUrls![index];
    } else if (imageUrl != null) {
      currentImageUrl = imageUrl;
    }
    
    if (currentImageUrl != null) {
      return Image.network(
        currentImageUrl,
        width: cardWidth,
        height: cardHeight,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: cardWidth,
            height: cardHeight,
            color: AppColors.backCards,
            child: const Icon(Icons.image, color: AppColors.grayMedium),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          width: cardWidth,
          height: cardHeight,
          color: AppColors.backCards,
          child: const Icon(Icons.error, color: AppColors.fadedRed),
        ),
      );
    }

    // Si no hay imagen, usar el placeholder personalizado o crear uno con colores
    if (placeholderWidgets != null && index < placeholderWidgets!.length) {
      return placeholderWidgets![index];
    } else if (placeholderWidget != null) {
      return placeholderWidget!;
    }

    // Placeholder por defecto que simula una tarjeta de producto
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: cardBackgroundColor ?? AppColors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (cardBackgroundColor ?? AppColors.white).withValues(alpha: 0.9),
            (cardBackgroundColor ?? AppColors.white).withValues(alpha: 0.7),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Simular una imagen de producto con rectángulos
          Positioned(
            top: cardHeight * 0.1,
            left: cardWidth * 0.1,
            right: cardWidth * 0.1,
            bottom: cardHeight * 0.3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backCards,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Icon(
                Icons.shopping_bag,
                color: AppColors.grayMedium,
                size: (cardWidth * cardHeight) * 0.25 / 60, // Escalar basado en el área
              ),
            ),
          ),
          // Simular texto del producto
          Positioned(
            bottom: cardHeight * 0.15,
            left: cardWidth * 0.1,
            right: cardWidth * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: cardHeight * 0.08,
                  decoration: BoxDecoration(
                    color: AppColors.grayMedium.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                SizedBox(height: cardHeight * 0.02),
                Container(
                  height: cardHeight * 0.06,
                  width: cardWidth * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.grayMedium.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el texto personalizado para la tarjeta principal
  Widget _buildCustomText(bool isMain, int index) {
    // Solo mostrar texto en la tarjeta principal
    if (!isMain) return const SizedBox.shrink();
    
    // Determinar el texto a mostrar
    String? textToShow;
    if (customTexts != null && customTexts!.isNotEmpty) {
      // Usar el último texto de la lista para la tarjeta principal
      textToShow = customTexts!.last;
    } else if (mainCardText != null) {
      textToShow = mainCardText;
    }
    
    if (textToShow == null) return const SizedBox.shrink();
    
    // Determinar el estilo del texto
    TextStyle? textStyle;
    if (customTextStyles != null && customTextStyles!.isNotEmpty) {
      textStyle = customTextStyles!.last;
    } else {
      textStyle = mainTextStyle ?? quantityTextStyle;
    }
    
    // Determinar el color de fondo del texto
    Color? backgroundColor;
    if (customTextBackgroundColors != null && customTextBackgroundColors!.isNotEmpty) {
      backgroundColor = customTextBackgroundColors!.last;
    } else {
      backgroundColor = mainTextBackgroundColor ?? quantityBackgroundColor;
    }
    
    // Determinar la opacidad del fondo del texto
    double? backgroundOpacity;
    if (customTextBackgroundOpacities != null && customTextBackgroundOpacities!.isNotEmpty) {
      backgroundOpacity = customTextBackgroundOpacities!.last;
    } else {
      backgroundOpacity = mainTextBackgroundOpacity ?? quantityBackgroundOpacity;
    }
    
    // Overlay completo para la tarjeta principal
    return Container(
      decoration: BoxDecoration(
        color: (backgroundColor ?? AppColors.white).withValues(
          alpha: backgroundOpacity ?? 0.8,
        ),
        borderRadius: BorderRadius.circular(cardBorderRadius ?? 8.0),
      ),
      child: Center(
        child: Text(
          textToShow,
          style: textStyle ?? const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Calcula el offset izquierdo para cada tarjeta
  double _calculateLeftOffset(int index, int totalCount) {
    if (customLeftOffsets != null && index < customLeftOffsets!.length) {
      return customLeftOffsets![index];
    }

    if (totalCount == 2) {
      return index == 0 ? -30 : spacing * -5.5 + 15;
    }

    if (index == 0) return -50;
    if (index == 1) return spacing * -6.5;
    return spacing * 0;
  }

  /// Calcula el ángulo de rotación para cada tarjeta
  double _calculateRotationAngle(int index, int totalCount) {
    if (customRotationAngles != null && index < customRotationAngles!.length) {
      return customRotationAngles![index];
    }

    if (totalCount == 2) {
      return index == 0 ? -12.0 : 0.0;
    }

    if (index == 0) return -12.0;
    if (index == 1) return 0.0;
    return 12.0;
  }
}
