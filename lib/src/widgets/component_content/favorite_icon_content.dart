import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget FavoriteIcon
class FavoriteIconContent extends StatelessWidget {
  const FavoriteIconContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Favorite Icon',
      componentDescription:
          'Widget personalizable de icono de favorito con animación de escala y temas predefinidos',
      examples: [
        ComponentExample(
          id: 'favorite-icon-basico',
          title: 'Icono básico',
          description:
              'Widget de favorito con funcionalidad básica y colores por defecto',
          previewWidget: _buildPreview(FavoriteIcon(isFavorite: false)),
          codeExample: '''
FavoriteIcon(
  isFavorite: false,
)
          ''',
        ),
        ComponentExample(
          id: 'favorite-icon-activo',
          title: 'Icono activo',
          description: 'Widget de favorito en estado activo (me gusta)',
          previewWidget: _buildPreview(FavoriteIcon(isFavorite: true)),
          codeExample: '''
FavoriteIcon(
  isFavorite: true,
)
          ''',
        ),

        ComponentExample(
          id: 'favorite-icon-completamente-personalizado',
          title: 'Icono completamente personalizado',
          description:
              'Widget con todas las opciones personalizables, colores específicos y funcionalidades',
          previewWidget: _buildPreview(
            FavoriteIcon(
              isFavorite: true,
              colors: FavoriteIconColors(
                activeColor: Colors.pink,
                inactiveColor: Colors.grey[400]!,
                backgroundColor: Colors.pink[50]!,
                borderColor: Colors.pink,
              ),
              size: 64.0,
              iconSize: 32.0,
              padding: 16.0,
              margin: 8.0,
              enableTap: true,
              showBackground: true,
              showBorder: true,
              borderRadius: 16.0,
              borderWidth: 2.0,
              activeIcon: Icons.favorite,
              inactiveIcon: Icons.favorite_border,
            ),
          ),
          codeExample: '''
FavoriteIcon(
  isFavorite: true,
  colors: FavoriteIconColors(
    activeColor: Colors.pink,
    inactiveColor: Colors.grey[400]!,
    backgroundColor: Colors.pink[50]!,
    borderColor: Colors.pink,
  ),
  size: 64.0,
  iconSize: 32.0,
  padding: 16.0,
  margin: 8.0,
  enableTap: true,
  showBackground: true,
  showBorder: true,
  borderRadius: 16.0,
  borderWidth: 2.0,
  activeIcon: Icons.favorite,
  inactiveIcon: Icons.favorite_border,
)
          ''',
        ),

        ComponentExample(
          id: 'favorite-icon-interactivo',
          title: 'Icono interactivo',
          description:
              'Widget que permite al usuario cambiar el estado tocando el icono',
          previewWidget: _buildPreview(_InteractiveFavoriteIconExample()),
          codeExample: '''
FavoriteIcon(
  isFavorite: _isFavorite,
  enableTap: true,
  onPressed: () {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  },
  showBackground: true,
  size: 56.0,
  iconSize: 28.0,
)
          ''',
        ),
        ComponentExample(
          id: 'favorite-icon-diferentes-tamanos',
          title: 'Iconos con diferentes tamaños',
          description:
              'Widget que muestra iconos de diferentes tamaños para comparar',
          previewWidget: _buildPreview(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavoriteIcon(isFavorite: true, size: 32.0, iconSize: 16.0),
                SizedBox(height: 16),
                FavoriteIcon(isFavorite: true, size: 48.0, iconSize: 24.0),
                SizedBox(height: 16),
                FavoriteIcon(isFavorite: true, size: 64.0, iconSize: 32.0),
                SizedBox(height: 16),
                FavoriteIcon(isFavorite: true, size: 80.0, iconSize: 40.0),
              ],
            ),
          ),
          codeExample: '''
Column(
  children: [
    FavoriteIcon(isFavorite: true, size: 32.0, iconSize: 16.0),
    SizedBox(height: 16),
    FavoriteIcon(isFavorite: true, size: 48.0, iconSize: 24.0),
    SizedBox(height: 16),
    FavoriteIcon(isFavorite: true, size: 64.0, iconSize: 32.0),
    SizedBox(height: 16),
    FavoriteIcon(isFavorite: true, size: 80.0, iconSize: 40.0),
  ],
)
          ''',
        ),
      ],
    );
  }

  Widget _buildPreview(Widget favoriteIconWidget) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: favoriteIconWidget,
    );
  }
}

/// Widget de ejemplo para mostrar iconos interactivos
class _InteractiveFavoriteIconExample extends StatefulWidget {
  @override
  State<_InteractiveFavoriteIconExample> createState() =>
      _InteractiveFavoriteIconExampleState();
}

class _InteractiveFavoriteIconExampleState
    extends State<_InteractiveFavoriteIconExample> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FavoriteIcon(
          isFavorite: _isFavorite,
          enableTap: true,
          onPressed: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
          showBackground: true,
          size: 56.0,
          iconSize: 28.0,
          colors: FavoriteIconColors(
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            backgroundColor: Colors.white,
            borderColor: Colors.red,
          ),
        ),
        SizedBox(height: 16),
        Text(
          _isFavorite ? 'Te gusta' : 'No te gusta',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _isFavorite ? Colors.red : Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Toca el corazón para cambiar',
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
