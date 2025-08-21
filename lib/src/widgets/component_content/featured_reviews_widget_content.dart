import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget FeaturedReviewsWidget
class FeaturedReviewsWidgetContent extends StatelessWidget {
  const FeaturedReviewsWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Featured Reviews Widget',
      componentDescription: 'Widget personalizable de reseñas destacadas con carrusel automático, estrellas y indicadores de página',
      examples: [
        ComponentExample(
          id: 'reviews-basico',
          title: 'Reseñas básico',
          description: 'Widget de reseñas con funcionalidad básica y colores por defecto',
          previewWidget: _buildPreview(
            FeaturedReviewsWidget(
              reviews: _getSampleReviews(),
            ),
          ),
          codeExample: '''
FeaturedReviewsWidget(
  reviews: [
    ReviewData(
      name: 'Aleida Rodriguez',
      rating: 5.0,
      review: 'Excelente. Rápido noté sus beneficios: el cansancio de mis piernas desapareció y en mi esposo disminuyeron los calambres nocturnos.',
    ),
    // Más reseñas...
  ],
)
          ''',
        ),

        ComponentExample(
          id: 'reviews-completamente-personalizado',
          title: 'Reseñas personalizado',
          description: 'Widget con todas las opciones personalizables, colores específicos y funcionalidades',
          previewWidget: _buildPreview(
            FeaturedReviewsWidget(
              reviews: _getSampleReviews(),
              colors: FeaturedReviewsColors(
                headerBackgroundColor: Colors.purple,
                headerTextColor: Colors.white,
                starColor: Colors.yellow,
                cardBackgroundColor: Colors.purple[50]!,
                cardTextColor: Colors.purple[800]!,
                cardNameColor: Colors.purple,
                indicatorActiveColor: Colors.purple,
                indicatorInactiveColor: Colors.purple[200]!,
              ),
              headerTitle: 'Reseñas',
              cardHeight: 170.0,
              horizontalPadding: 24.0,
              headerPadding: 12.0,
              cardPadding: 16.0,
              starSize: 22.0,
              indicatorSize: 10.0,
              indicatorActiveWidth: 30.0,
              indicatorInactiveWidth: 10.0,
              headerBorderRadius: 16.0,
              cardBorderRadius: 16.0,
              indicatorBorderRadius: 5.0,
              maxStars: 5,
              autoScrollDelay: const Duration(seconds: 8),
              pageTransitionDuration: const Duration(milliseconds: 800),
              pageTransitionCurve: Curves.easeOutCubic,
            ),
          ),
          codeExample: '''
FeaturedReviewsWidget(
  reviews: _reviews,
  colors: FeaturedReviewsColors(
    headerBackgroundColor: Colors.purple,
    headerTextColor: Colors.white,
    starColor: Colors.yellow,
    cardBackgroundColor: Colors.purple[50]!,
    cardTextColor: Colors.purple[800]!,
    cardNameColor: Colors.purple,
    indicatorActiveColor: Colors.purple,
    indicatorInactiveColor: Colors.purple[200]!,
  ),
  headerTitle: 'Reseñas Premium',
  cardHeight: 180.0,
  horizontalPadding: 24.0,
  headerPadding: 12.0,
  cardPadding: 24.0,
  starSize: 24.0,
  indicatorSize: 10.0,
  indicatorActiveWidth: 30.0,
  indicatorInactiveWidth: 10.0,
  headerBorderRadius: 16.0,
  cardBorderRadius: 16.0,
  indicatorBorderRadius: 5.0,
  maxStars: 5,
  autoScrollDelay: Duration(seconds: 8),
  pageTransitionDuration: Duration(milliseconds: 800),
  pageTransitionCurve: Curves.easeOutCubic,
)
          ''',
        ),
        ComponentExample(
          id: 'reviews-sin-estrellas',
          title: 'Reseñas sin estrellas',
          description: 'Widget que muestra reseñas sin estrellas en el header',
          previewWidget: _buildPreview(
            FeaturedReviewsWidget(
              reviews: _getSampleReviews(),
              headerTitle: 'Comentarios de usuarios',
              showStars: false,
              cardHeight: 120.0,
            ),
          ),
          codeExample: '''
FeaturedReviewsWidget(
  reviews: _reviews,
  headerTitle: 'Comentarios de usuarios',
  showStars: false,
  cardHeight: 120.0,
)
          ''',
        ),
        ComponentExample(
          id: 'reviews-sin-indicadores',
          title: 'Reseñas sin indicadores',
          description: 'Widget que muestra reseñas sin indicadores de página',
          previewWidget: _buildPreview(
            FeaturedReviewsWidget(
              reviews: _getSampleReviews(),
              headerTitle: 'Opiniones',
              showIndicators: false,
              enableAutoScroll: false,
            ),
          ),
          codeExample: '''
FeaturedReviewsWidget(
  reviews: _reviews,
  headerTitle: 'Opiniones destacadas',
  showIndicators: false,
  enableAutoScroll: false,
)
          ''',
        ),
      ],
    );
  }

  Widget _buildPreview(Widget reviewsWidget) {
    return Container(
      height: 305,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: reviewsWidget,
    );
  }

  List<ReviewData> _getSampleReviews() {
    return [
      const ReviewData(
        name: 'Aleida Rodriguez',
        rating: 5.0,
        review: 'Excelente. Rápido noté sus beneficios: el cansancio de mis piernas desapareció y en mi esposo disminuyeron los calambres nocturnos, a la semana de tomarlas desaparecieron. Esta marca me ha sorprendido.',
      ),
      const ReviewData(
        name: 'María González',
        rating: 5.0,
        review: 'Increíble producto. Desde que empecé a tomarlo, mi energía ha mejorado significativamente y ya no me siento tan cansada durante el día. Definitivamente lo recomiendo.',
      ),
      const ReviewData(
        name: 'Carlos Mendoza',
        rating: 5.0,
        review: 'Los resultados fueron evidentes desde la primera semana. Mi concentración mejoró y me siento más activo. Excelente calidad y entrega rápida.',
      ),
      const ReviewData(
        name: 'Ana Martínez',
        rating: 5.0,
        review: 'Producto de alta calidad. He notado mejoras en mi bienestar general y la atención al cliente es excepcional. Muy recomendado.',
      ),
    ];
  }
}
