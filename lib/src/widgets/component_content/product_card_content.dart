import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../product_card.dart';

class ProductCardContent extends StatefulWidget {
  const ProductCardContent({super.key});

  @override
  State<ProductCardContent> createState() => _ProductCardContentState();
}

class _ProductCardContentState extends State<ProductCardContent> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Product Card',
      componentDescription: 'Tarjeta de producto para mostrar información básica de productos en listas o grids. Incluye imagen, nombre, precio, rating, estado de favorito y opciones de comparación de descuentos.',
      examples: [
        ComponentExample(
          id: 'basic',
          title: 'Product Card Básica',
          description: 'Tarjeta de producto con información básica y placeholder de imagen.',
          previewWidget: _buildBasicExample(),
          codeExample: '''
ProductCard(
  imageUrl: 'https://example.com/product.jpg',
  productName: 'Producto de ejemplo',
  price: 99.99,
  rating: 4.5,
  isFavorite: false,
  onFavoriteToggle: () {
    // Manejar toggle de favorito
  },
  onCompareDiscounts: () {
    // Manejar comparación de descuentos
  },
  onProductTap: () {
    // Navegar al detalle del producto
  },
)
''',
        ),
        ComponentExample(
          id: 'favorite',
          title: 'Product Card con Favorito',
          description: 'Tarjeta de producto marcada como favorita.',
          previewWidget: _buildFavoriteExample(),
          codeExample: '''
ProductCard(
  imageUrl: 'https://example.com/product.jpg',
  productName: 'Producto favorito',
  price: 149.99,
  rating: 5.0,
  isFavorite: true,
  onFavoriteToggle: () {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  },
  onCompareDiscounts: () {
    // Manejar comparación de descuentos
  },
  onProductTap: () {
    // Navegar al detalle del producto
  },
)
''',
        ),
        ComponentExample(
          id: 'grid',
          title: 'Grid de Product Cards',
          description: 'Múltiples tarjetas de producto en un grid horizontal.',
          previewWidget: _buildGridExample(),
          codeExample: '''
SizedBox(
  height: 200,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
      return ProductCard(
        imageUrl: 'https://example.com/product\${index + 1}.jpg',
        productName: 'Producto \${index + 1}',
        price: 99.99 + (index * 10),
        rating: 4.0 + (index * 0.2),
        isFavorite: index % 2 == 0,
        onFavoriteToggle: () {
          // Manejar toggle de favorito
        },
        onCompareDiscounts: () {
          // Manejar comparación de descuentos
        },
        onProductTap: () {
          // Navegar al detalle del producto
        },
      );
    },
  ),
)
''',
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'imageUrl',
          type: 'String',
          description: 'URL de la imagen del producto. Actualmente se usa un placeholder.',
          required: true,
        ),
        ComponentProperty(
          name: 'productName',
          type: 'String',
          description: 'Nombre del producto que se mostrará en la tarjeta.',
          required: true,
        ),
        ComponentProperty(
          name: 'price',
          type: 'double',
          description: 'Precio del producto que se mostrará con formato de moneda.',
          required: true,
        ),
        ComponentProperty(
          name: 'rating',
          type: 'double',
          description: 'Calificación del producto (0.0 a 5.0) que se mostrará como estrellas.',
          required: false,
          defaultValue: '5.0',
        ),
        ComponentProperty(
          name: 'isFavorite',
          type: 'bool',
          description: 'Estado de favorito del producto que determina el icono del corazón.',
          required: false,
          defaultValue: 'false',
        ),
        ComponentProperty(
          name: 'onFavoriteToggle',
          type: 'VoidCallback?',
          description: 'Callback que se ejecuta cuando se toca el botón de favorito.',
          required: false,
        ),
        ComponentProperty(
          name: 'onCompareDiscounts',
          type: 'VoidCallback?',
          description: 'Callback que se ejecuta cuando se toca la opción de comparar descuentos.',
          required: false,
        ),
        ComponentProperty(
          name: 'onProductTap',
          type: 'VoidCallback?',
          description: 'Callback que se ejecuta cuando se toca la tarjeta del producto.',
          required: false,
        ),
      ],
      usageNotes: '''
## Características del Componente

- **Diseño Responsivo**: La tarjeta tiene dimensiones fijas de 180x180 píxeles optimizadas para grids.
- **Placeholder de Imagen**: Actualmente usa un placeholder en lugar de cargar imágenes reales.
- **Interactividad**: Incluye gestos para favorito, comparación de descuentos y navegación al producto.
- **Estilos Consistentes**: Usa la tipografía InterVariable y colores del sistema de diseño.
- **Estados Visuales**: Maneja estados de favorito con iconos diferentes.

## Casos de Uso

- **Listas de Productos**: En catálogos y resultados de búsqueda.
- **Grids de Productos**: En páginas de categorías o recomendaciones.
- **Carritos de Compras**: Para mostrar productos agregados.
- **Wishlists**: Para listas de productos favoritos.

## Consideraciones

- El componente está optimizado para mostrar información básica del producto.
- Para información más detallada, se recomienda navegar a una pantalla de detalle.
- Los callbacks permiten personalizar la funcionalidad según las necesidades de la aplicación.
''',
    );
  }

  Widget _buildBasicExample() {
    return Center(
      child: ProductCard(
        imageUrl: 'https://example.com/product.jpg',
        productName: 'Producto de ejemplo',
        price: 99.99,
        rating: 4.5,
        isFavorite: false,
        onFavoriteToggle: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Favorito toggled')),
          );
        },
        onCompareDiscounts: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Comparar descuentos')),
          );
        },
        onProductTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Producto seleccionado')),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteExample() {
    return Center(
      child: ProductCard(
        imageUrl: 'https://example.com/product.jpg',
        productName: 'Producto favorito',
        price: 149.99,
        rating: 5.0,
        isFavorite: true,
        onFavoriteToggle: () {
          setState(() {
            _isFavorite = !_isFavorite;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Favorito: ${_isFavorite ? 'Agregado' : 'Removido'}')),
          );
        },
        onCompareDiscounts: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Comparar descuentos')),
          );
        },
        onProductTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Producto seleccionado')),
          );
        },
      ),
    );
  }

  Widget _buildGridExample() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: 'https://example.com/product${index + 1}.jpg',
            productName: 'Producto ${index + 1}',
            price: 99.99 + (index * 10),
            rating: 4.0 + (index * 0.2),
            isFavorite: index % 2 == 0,
            onFavoriteToggle: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Favorito toggled en producto ${index + 1}')),
              );
            },
            onCompareDiscounts: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Comparar descuentos del producto ${index + 1}')),
              );
            },
            onProductTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Producto ${index + 1} seleccionado')),
              );
            },
          );
        },
      ),
    );
  }
}
