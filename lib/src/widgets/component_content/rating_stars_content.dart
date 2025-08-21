import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget RatingStars
class RatingStarsContent extends StatelessWidget {
  const RatingStarsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Rating Stars',
      componentDescription: 'Widget personalizable de estrellas de calificación con soporte para estrellas completas, medias y vacías',
      examples: [
        ComponentExample(
          id: 'rating-stars-basico',
          title: 'Estrellas básico',
          description: 'Widget de estrellas con funcionalidad básica y colores por defecto',
          previewWidget: _buildPreview(
            RatingStars(
              rating: 4.5,
            ),
          ),
          codeExample: '''
RatingStars(
  rating: 4.5,
)
          ''',
        ),
       
        
        ComponentExample(
          id: 'rating-stars-completamente-personalizado',
          title: 'Estrellas completamente personalizado',
          description: 'Widget con todas las opciones personalizables, colores específicos y funcionalidades',
          previewWidget: _buildPreview(
            RatingStars(
              rating: 4.5,
              colors: RatingStarsColors(
                activeStarColor: Colors.purple,
                halfStarColor: Colors.purple,
                inactiveStarColor: Colors.purple[200]!,
                backgroundColor: Colors.purple[50]!,
              ),
              size: 24.0,
              gap: 6.0,
              totalStars: 5,
              showHalfStars: true,
              showRating: true,
              showBackground: true,
              enableInteraction: true,
              onRatingChanged: (rating) => debugPrint('Nueva calificación: \$rating'),
              mainAxisAlignment: MainAxisAlignment.center,
              ratingTextSize: 18.0,
              ratingTextColor: Colors.purple,
              ratingTextSpacing: 12.0,
              borderRadius: 12.0,
              padding: 16.0,
              margin: 8.0,
              border: Border.all(color: Colors.purple, width: 2),
            ),
          ),
          codeExample: '''
RatingStars(
  rating: 4.5,
  colors: RatingStarsColors(
    activeStarColor: Colors.purple,
    halfStarColor: Colors.purple,
    inactiveStarColor: Colors.purple[200]!,
    backgroundColor: Colors.purple[50]!,
  ),
  size: 24.0,
  gap: 6.0,
  totalStars: 5,
  showHalfStars: true,
  showRating: true,
  showBackground: true,
  enableInteraction: true,
  onRatingChanged: (rating) => print('Nueva calificación: \$rating'),
  mainAxisAlignment: MainAxisAlignment.center,
  ratingTextSize: 18.0,
  ratingTextColor: Colors.purple,
  ratingTextSpacing: 12.0,
  borderRadius: 12.0,
  padding: 16.0,
  margin: 8.0,
  border: Border.all(color: Colors.purple, width: 2),
)
          ''',
        ),
        ComponentExample(
          id: 'rating-stars-sin-estrellas-medias',
          title: 'Estrellas sin estrellas medias',
          description: 'Widget que muestra solo estrellas completas o vacías',
          previewWidget: _buildPreview(
            RatingStars(
              rating: 4.5,
              showHalfStars: false,
              showRating: true,
              size: 20.0,
            ),
          ),
          codeExample: '''
RatingStars(
  rating: 4.5,
  showHalfStars: false,
  showRating: true,
  size: 20.0,
)
          ''',
        ),
        ComponentExample(
          id: 'rating-stars-interactivo',
          title: 'Estrellas interactivo',
          description: 'Widget que permite al usuario cambiar la calificación tocando las estrellas',
          previewWidget: _buildPreview(
            _InteractiveRatingStarsExample(),
          ),
          codeExample: '''
RatingStars(
  rating: _currentRating,
  enableInteraction: true,
  onRatingChanged: (rating) {
    setState(() {
      _currentRating = rating;
    });
  },
  showRating: true,
  size: 28.0,
  gap: 8.0,
)
          ''',
        ),
        ComponentExample(
          id: 'rating-stars-diferentes-tamanos',
          title: 'Estrellas con diferentes tamaños',
          description: 'Widget que muestra estrellas de diferentes tamaños para comparar',
          previewWidget: _buildPreview(
            Column(
              children: [
                RatingStars(rating: 4.5, size: 16.0, showRating: true),
                SizedBox(height: 16),
                RatingStars(rating: 4.5, size: 20.0, showRating: true),
                SizedBox(height: 16),
                RatingStars(rating: 4.5, size: 24.0, showRating: true),
                SizedBox(height: 16),
                RatingStars(rating: 4.5, size: 32.0, showRating: true),
              ],
            ),
          ),
          codeExample: '''
Column(
  children: [
    RatingStars(rating: 4.5, size: 16.0, showRating: true),
    SizedBox(height: 16),
    RatingStars(rating: 4.5, size: 20.0, showRating: true),
    SizedBox(height: 16),
    RatingStars(rating: 4.5, size: 24.0, showRating: true),
    SizedBox(height: 16),
    RatingStars(rating: 4.5, size: 32.0, showRating: true),
  ],
)
          ''',
        ),
        ComponentExample(
          id: 'rating-stars-diferentes-calificaciones',
          title: 'Estrellas con diferentes calificaciones',
          description: 'Widget que muestra estrellas con diferentes calificaciones para comparar',
          previewWidget: _buildPreview(
            Column(
              children: [
                RatingStars(rating: 1.0, showRating: true),
                SizedBox(height: 16),
                RatingStars(rating: 2.5, showRating: true),
                SizedBox(height: 16),
                RatingStars(rating: 4.0, showRating: true),
                SizedBox(height: 16),
                RatingStars(rating: 5.0, showRating: true),
              ],
            ),
          ),
          codeExample: '''
Column(
  children: [
    RatingStars(rating: 1.0, showRating: true),
    SizedBox(height: 16),
    RatingStars(rating: 2.5, showRating: true),
    SizedBox(height: 16),
    RatingStars(rating: 4.0, showRating: true),
    SizedBox(height: 16),
    RatingStars(rating: 5.0, showRating: true),
  ],
)
          ''',
        ),
      ],
    );
  }

  Widget _buildPreview(Widget ratingStarsWidget) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ratingStarsWidget,
    );
  }
}

/// Widget de ejemplo para mostrar estrellas interactivas
class _InteractiveRatingStarsExample extends StatefulWidget {
  @override
  State<_InteractiveRatingStarsExample> createState() => _InteractiveRatingStarsExampleState();
}

class _InteractiveRatingStarsExampleState extends State<_InteractiveRatingStarsExample> {
  double _currentRating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingStars(
          rating: _currentRating,
          enableInteraction: true,
          onRatingChanged: (rating) {
            setState(() {
              _currentRating = rating;
            });
          },
          showRating: true,
          size: 28.0,
          gap: 8.0,
          showBackground: true,
          colors: RatingStarsColors(
            activeStarColor: Colors.amber,
            halfStarColor: Colors.amber,
            inactiveStarColor: Colors.grey,
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Toca las estrellas para cambiar la calificación',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
