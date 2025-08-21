import 'package:flutter/material.dart';

/// Colores personalizables para el RatingStars
class RatingStarsColors {
  final Color activeStarColor;
  final Color halfStarColor;
  final Color inactiveStarColor;
  final Color? backgroundColor;

  const RatingStarsColors({
    this.activeStarColor = Colors.amber,
    this.halfStarColor = Colors.amber,
    this.inactiveStarColor = Colors.grey,
    this.backgroundColor,
  });

  /// Tema oscuro predefinido
  factory RatingStarsColors.darkTheme() {
    return const RatingStarsColors(
      activeStarColor: Colors.amber,
      halfStarColor: Colors.amber,
      inactiveStarColor: Colors.grey,
      backgroundColor: Color(0xFF2C2C2C),
    );
  }

  /// Tema de marca predefinido
  factory RatingStarsColors.brandTheme() {
    return const RatingStarsColors(
      activeStarColor: Colors.green,
      halfStarColor: Colors.green,
      inactiveStarColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }

  /// Tema premium predefinido
  factory RatingStarsColors.premiumTheme() {
    return RatingStarsColors(
      activeStarColor: Colors.orange,
      halfStarColor: Colors.orange,
      inactiveStarColor: Colors.grey[400]!,
      backgroundColor: Colors.white,
    );
  }
}

/// Widget personalizable de estrellas de calificación
class RatingStars extends StatelessWidget {
  final double rating;
  
  // Personalización de colores
  final RatingStarsColors? colors;
  
  // Personalización de tamaños
  final double? size;
  final double? gap;
  
  // Personalización de funcionalidad
  final int? totalStars;
  final bool showHalfStars;
  final bool showRating;
  final bool showBackground;
  final bool enableInteraction;
  final Function(double)? onRatingChanged;
  
  // Personalización de estilos
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextStyle? ratingTextStyle;
  final double? ratingTextSize;
  final Color? ratingTextColor;
  final double? ratingTextSpacing;
  
  // Personalización de bordes y espaciado
  final double? borderRadius;
  final double? padding;
  final double? margin;
  final BoxBorder? border;

  const RatingStars({
    super.key,
    required this.rating,
    this.colors,
    this.size,
    this.gap,
    this.totalStars,
    this.showHalfStars = true,
    this.showRating = false,
    this.showBackground = false,
    this.enableInteraction = false,
    this.onRatingChanged,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.ratingTextStyle,
    this.ratingTextSize,
    this.ratingTextColor,
    this.ratingTextSpacing,
    this.borderRadius,
    this.padding,
    this.margin,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColors = colors ?? const RatingStarsColors();
    final effectiveSize = size ?? 17.0;
    final effectiveGap = gap ?? 4.0;
    final effectiveTotalStars = totalStars ?? 5;

    final effectiveMainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start;
    final effectiveCrossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center;
    final effectiveRatingTextSize = ratingTextSize ?? 14.0;
    final effectiveRatingTextColor = ratingTextColor ?? effectiveColors.activeStarColor;
    final effectiveRatingTextSpacing = ratingTextSpacing ?? 8.0;
    final effectiveBorderRadius = borderRadius ?? 8.0;
    final effectivePadding = padding ?? 8.0;
    final effectiveMargin = margin ?? 0.0;

    Widget starsWidget = Row(
      mainAxisAlignment: effectiveMainAxisAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      children: List.generate(effectiveTotalStars, (index) {
        double starRating = rating - index;
        
        Widget starWidget;
        if (starRating >= 1.0) {
          // Estrella completamente llena
          starWidget = Icon(
            Icons.star,
            size: effectiveSize,
            color: effectiveColors.activeStarColor,
          );
        } else if (starRating > 0.0 && starRating < 1.0 && showHalfStars) {
          // Estrella mitad llena
          starWidget = Icon(
            Icons.star_half,
            size: effectiveSize,
            color: effectiveColors.halfStarColor,
          );
        } else {
          // Estrella vacía
          starWidget = Icon(
            Icons.star_border,
            size: effectiveSize,
            color: effectiveColors.inactiveStarColor,
          );
        }
        
        // Hacer la estrella interactiva si está habilitado
        if (enableInteraction && onRatingChanged != null) {
          starWidget = GestureDetector(
            onTap: () => onRatingChanged!(index + 1.0),
            child: starWidget,
          );
        }
        
        // Agregar gap después de cada estrella excepto la última
        if (index < effectiveTotalStars - 1) {
          return Row(
            children: [
              starWidget,
              SizedBox(width: effectiveGap),
            ],
          );
        } else {
          return starWidget;
        }
      }),
    );

    // Agregar texto de calificación si está habilitado
    if (showRating) {
      starsWidget = Row(
        mainAxisAlignment: effectiveMainAxisAlignment,
        crossAxisAlignment: effectiveCrossAxisAlignment,
        children: [
          starsWidget,
          SizedBox(width: effectiveRatingTextSpacing),
          Text(
            rating.toStringAsFixed(1),
            style: ratingTextStyle ?? TextStyle(
              fontSize: effectiveRatingTextSize,
              fontWeight: FontWeight.w600,
              color: effectiveRatingTextColor,
            ),
          ),
        ],
      );
    }

    // Agregar fondo si está habilitado
    if (showBackground) {
      starsWidget = Container(
        padding: EdgeInsets.all(effectivePadding),
        margin: EdgeInsets.all(effectiveMargin),
        decoration: BoxDecoration(
          color: effectiveColors.backgroundColor,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          border: border,
        ),
        child: starsWidget,
      );
    }

    return starsWidget;
  }
}

/// Widget predefinido con tema oscuro
class RatingStarsDark extends StatelessWidget {
  final double rating;
  final double? size;
  final double? gap;
  final int? totalStars;
  final bool showHalfStars;
  final bool showRating;
  final bool showBackground;
  final bool enableInteraction;
  final Function(double)? onRatingChanged;
  final MainAxisAlignment? mainAxisAlignment;

  const RatingStarsDark({
    super.key,
    required this.rating,
    this.size,
    this.gap,
    this.totalStars,
    this.showHalfStars = true,
    this.showRating = false,
    this.showBackground = false,
    this.enableInteraction = false,
    this.onRatingChanged,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      rating: rating,
      colors: RatingStarsColors.darkTheme(),
      size: size,
      gap: gap,
      totalStars: totalStars,
      showHalfStars: showHalfStars,
      showRating: showRating,
      showBackground: showBackground,
      enableInteraction: enableInteraction,
      onRatingChanged: onRatingChanged,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}

/// Widget predefinido con tema de marca
class RatingStarsBrand extends StatelessWidget {
  final double rating;
  final double? size;
  final double? gap;
  final int? totalStars;
  final bool showHalfStars;
  final bool showRating;
  final bool showBackground;
  final bool enableInteraction;
  final Function(double)? onRatingChanged;
  final MainAxisAlignment? mainAxisAlignment;

  const RatingStarsBrand({
    super.key,
    required this.rating,
    this.size,
    this.gap,
    this.totalStars,
    this.showHalfStars = true,
    this.showRating = false,
    this.showBackground = false,
    this.enableInteraction = false,
    this.onRatingChanged,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      rating: rating,
      colors: RatingStarsColors.brandTheme(),
      size: size,
      gap: gap,
      totalStars: totalStars,
      showHalfStars: showHalfStars,
      showRating: showRating,
      showBackground: showBackground,
      enableInteraction: enableInteraction,
      onRatingChanged: onRatingChanged,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}

/// Widget predefinido con tema premium
class RatingStarsPremium extends StatelessWidget {
  final double rating;
  final double? size;
  final double? gap;
  final int? totalStars;
  final bool showHalfStars;
  final bool showRating;
  final bool showBackground;
  final bool enableInteraction;
  final Function(double)? onRatingChanged;
  final MainAxisAlignment? mainAxisAlignment;

  const RatingStarsPremium({
    super.key,
    required this.rating,
    this.size,
    this.gap,
    this.totalStars,
    this.showHalfStars = true,
    this.showRating = false,
    this.showBackground = false,
    this.enableInteraction = false,
    this.onRatingChanged,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      rating: rating,
      colors: RatingStarsColors.premiumTheme(),
      size: size,
      gap: gap,
      totalStars: totalStars,
      showHalfStars: showHalfStars,
      showRating: showRating,
      showBackground: showBackground,
      enableInteraction: enableInteraction,
      onRatingChanged: onRatingChanged,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}
