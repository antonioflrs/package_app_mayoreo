import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double price;
  final double rating;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onCompareDiscounts;
  final VoidCallback? onProductTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    this.rating = 5.0,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onCompareDiscounts,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductTap,
      child: Container(
        width: 180,
        height: 180,
        margin: const EdgeInsets.only(
          right: 20.0,
          left: 4.0,
          top: 4.0,
          bottom: 4.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Imagen del producto en la parte superior
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  // Fondo blanco para la imagen
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                  ),
                  // Placeholder en lugar de imagen
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inventory,
                              size: 40,
                              color: AppColors.grayMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Imagen del producto',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.grayMedium,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Botón de favorito (like) superpuesto en la esquina superior derecha
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: _FavoriteIcon(
                        isFavorite: isFavorite,
                        size: 18.0,
                        onPressed: onFavoriteToggle,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Información del producto en la parte inferior
            Container(
              height: 130,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Estrellas de rating
                  _RatingStars(
                    rating: rating,
                    size: 13.0,
                    gap: 2.0,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),

                  const SizedBox(height: 4.0),

                  // Nombre del producto (máximo 2 líneas)
                  Text(
                    productName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'InterVariable',
                      fontWeight: FontWeight.w900,
                      fontFeatures: [FontFeature('ss01'), FontFeature('cv11')],
                      color: AppColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4.0),

                  // Precio y etiqueta "Público"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                          color: AppColors.orangeBrand,
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        'Público',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.orangeBrand,
                          fontWeight: FontWeight.w400,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4.0),

                  // Opción de comparar descuentos con icono de info
                  GestureDetector(
                    onTap: onCompareDiscounts,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'COMPARAR DESCUENTOS',
                          style: TextStyle(
                            fontSize: 9.0,
                            color: AppColors.darkGray,
                            fontWeight: FontWeight.w500,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Icon(
                          Icons.info_outline,
                          size: 12,
                          color: AppColors.darkGray,
                        ),
                      ],
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
}

// Widget interno para el icono de favorito
class _FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final double size;
  final VoidCallback? onPressed;

  const _FavoriteIcon({
    required this.isFavorite,
    required this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: size,
        color: isFavorite ? AppColors.digitalRed : AppColors.grayMedium,
      ),
    );
  }
}

// Widget interno para las estrellas de rating
class _RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final double gap;
  final MainAxisAlignment mainAxisAlignment;

  const _RatingStars({
    required this.rating,
    required this.size,
    required this.gap,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        final isFilled = starValue <= rating;
        final isHalfFilled = starValue - 0.5 <= rating && starValue > rating;

        return Padding(
          padding: EdgeInsets.only(right: index < 4 ? gap : 0),
          child: Icon(
            isFilled
                ? Icons.star
                : isHalfFilled
                    ? Icons.star_half
                    : Icons.star_border,
            size: size,
            color: AppColors.orangeBrand,
          ),
        );
      }),
    );
  }
}
