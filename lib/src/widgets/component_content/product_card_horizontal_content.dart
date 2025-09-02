import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el ProductCardHorizontal
class ProductCardHorizontalContent extends StatelessWidget {
  const ProductCardHorizontalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Product Card Horizontal',
      componentDescription:
          'Widget para mostrar tarjetas de productos en formato horizontal con opciones de menú, precios y botón de agregar',
      examples: [
                 ComponentExample(
           id: 'basic-usage',
           title: 'Uso básico',
           description:
               'Tarjeta horizontal de producto con configuración básica sin menú de opciones',
           codeExample: '''
ProductCardHorizontal(
  product: {
    'name': 'Ashwagandha Root Powder',
    'publicPrice': 299.99,
    'wholesalePrice': 199.99,
    'rating': 5.0,
    'isFavorite': true,
    'imageUrl': 'https://example.com/product.jpg',
  },
  onAddToCart: () => print('Agregar al carrito'),
  onToggleFavorite: () => print('Toggle favorito'),
  userLists: [
    {'id': '1', 'name': 'Lista 1'},
    {'id': '2', 'name': 'Lista 2'},
  ],
  onMoveToList: (listId) => print('Mover a lista: \$listId'),
  showOptionsMenu: false,
)
           ''',
           previewWidget: _buildBasicExample(),
         ),
                 ComponentExample(
           id: 'with-options-menu',
           title: 'Con menú de opciones',
           description: 'Tarjeta con menú de opciones habilitado (Mover y Compartir)',
           codeExample: '''
ProductCardHorizontal(
  product: {
    'name': 'Producto con Opciones',
    'publicPrice': 299.99,
    'wholesalePrice': 199.99,
    'rating': 5.0,
    'isFavorite': true,
  },
  onAddToCart: () => print('Agregar al carrito'),
  onToggleFavorite: () => print('Toggle favorito'),
  userLists: [
    {'id': '1', 'name': 'Lista 1'},
    {'id': '2', 'name': 'Lista 2'},
  ],
  onMoveToList: (listId) => print('Mover a lista: \$listId'),
  showOptionsMenu: true, // Por defecto es true
)
           ''',
           previewWidget: _buildWithOptionsExample(),
         ),
         ComponentExample(
           id: 'with-custom-share',
           title: 'Con función de compartir personalizada',
           description: 'Tarjeta con función de compartir personalizada',
          codeExample: '''
ProductCardHorizontal(
  product: {
    'name': 'Producto con Compartir',
    'publicPrice': 150.50,
    'wholesalePrice': 120.00,
    'rating': 4.5,
    'isFavorite': false,
  },
  onAddToCart: () => print('Agregar al carrito'),
  onToggleFavorite: () => print('Toggle favorito'),
  userLists: [],
  onMoveToList: (listId) => print('Mover a lista'),
  onShare: () => print('Compartir personalizado'),
)
          ''',
          previewWidget: _buildCustomShareExample(),
        ),
      ],
    );
  }

     Widget _buildBasicExample() {
     return Column(
       children: [
         ProductCardHorizontal(
           product: {
             'name': 'Ashwagandha Root Powder',
             'publicPrice': 299.99,
             'wholesalePrice': 199.99,
             'rating': 5.0,
             'isFavorite': true,
             'imageUrl': 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
           },
           onAddToCart: () {},
           onToggleFavorite: () {},
           userLists: const [
             {'id': '1', 'name': 'Lista 1'},
             {'id': '2', 'name': 'Lista 2'},
           ],
           onMoveToList: (listId) {},
           showOptionsMenu: false,
         ),
         const SizedBox(height: 12),
         ProductCardHorizontal(
           product: {
             'name': 'Suplemento Vitamínico Premium',
             'publicPrice': 450.00,
             'wholesalePrice': 320.50,
             'rating': 4.8,
             'isFavorite': false,
           },
           onAddToCart: () {},
           onToggleFavorite: () {},
           userLists: const [],
           onMoveToList: (listId) {},
           showOptionsMenu: false,
         ),
       ],
     );
   }

  Widget _buildWithOptionsExample() {
    return Column(
      children: [
        ProductCardHorizontal(
          product: {
            'name': 'Producto con Opciones',
            'publicPrice': 299.99,
            'wholesalePrice': 199.99,
            'rating': 5.0,
            'isFavorite': true,
          },
          onAddToCart: () {},
          onToggleFavorite: () {},
          userLists: const [
            {'id': '1', 'name': 'Lista 1'},
            {'id': '2', 'name': 'Lista 2'},
          ],
          onMoveToList: (listId) {},
          showOptionsMenu: true,
        ),
        const SizedBox(height: 12),
        ProductCardHorizontal(
          product: {
            'name': 'Otro Producto con Opciones',
            'publicPrice': 150.50,
            'wholesalePrice': 120.00,
            'rating': 4.5,
            'isFavorite': false,
          },
          onAddToCart: () {},
          onToggleFavorite: () {},
          userLists: const [],
          onMoveToList: (listId) {},
          showOptionsMenu: true,
        ),
      ],
    );
  }

  Widget _buildCustomShareExample() {
    return Column(
      children: [
        ProductCardHorizontal(
          product: {
            'name': 'Producto con Compartir',
            'publicPrice': 150.50,
            'wholesalePrice': 120.00,
            'rating': 4.5,
            'isFavorite': false,
          },
          onAddToCart: () {},
          onToggleFavorite: () {},
          userLists: const [],
          onMoveToList: (listId) {},
          onShare: () {
            // Función personalizada de compartir
          },
        ),
        const SizedBox(height: 12),
        ProductCardHorizontal(
          product: {
            'name': 'Producto sin Compartir',
            'publicPrice': 89.99,
            'wholesalePrice': 65.00,
            'rating': 4.2,
            'isFavorite': true,
          },
          onAddToCart: () {},
          onToggleFavorite: () {},
          userLists: const [],
          onMoveToList: (listId) {},
        ),
      ],
    );
  }
}