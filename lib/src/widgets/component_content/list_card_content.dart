import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el ListCard
class ListCardContent extends StatelessWidget {
  const ListCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'List Card',
      componentDescription:
          'Widget para mostrar cards de listas de favoritos con opciones de menú y tarjetas apiladas',
      examples: [
        ComponentExample(
          id: 'basic-usage',
          title: 'Uso básico',
          description:
              'Card de lista con configuración básica y menú de opciones',
          codeExample: '''
ListCard(
  list: {
    'name': 'Mi Lista de Favoritos',
    'productCount': 5,
    'isDefault': false,
  },
  onTap: () => print('Card tocada'),
  onChangeName: () => print('Cambiar nombre'),
  onDelete: () => print('Eliminar lista'),
)
          ''',
          previewWidget: _buildBasicExample(),
        ),
        ComponentExample(
          id: 'default-list',
          title: 'Lista por defecto',
          description: 'Card de lista por defecto sin menú de opciones',
          codeExample: '''
ListCard(
  list: {
    'name': 'Lista por Defecto',
    'productCount': 3,
    'isDefault': true,
  },
  onTap: () => print('Card tocada'),
  onChangeName: () {},
  onDelete: () {},
)
          ''',
          previewWidget: _buildDefaultListExample(),
        ),

        ComponentExample(
          id: 'with-images',
          title: 'Con imágenes y textos personalizados',
          description:
              'Card con imágenes reales de productos y textos personalizados en las tarjetas',
          codeExample: '''
ListCard(
  list: {
    'name': 'Suplementos Favoritos',
    'productCount': 3,
    'isDefault': false,
  },
  onTap: () => print('Card tocada'),
  onChangeName: () => print('Cambiar nombre'),
  onDelete: () => print('Eliminar lista'),
  stackedCardsSize: 60.0,
  productImageUrls: [
    'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
    'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
    'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  ],
  customTexts: ['+3', '2', '1'],
  customTextStyles: [
    TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
    TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
    TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
  ],
  customTextBackgroundColors: [Colors.green, Colors.orange, Colors.red],
  customTextBackgroundOpacities: [0.9, 0.7, 0.7],
)
          ''',
          previewWidget: _buildWithImagesExample(),
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Column(
      children: [
        ListCard(
          list: {
            'name': 'Mi Lista de Favoritos',
            'productCount': 5,
            'isDefault': false,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
        ),
        const SizedBox(height: 12),
        ListCard(
          list: {
            'name': 'Lista de Compras',
            'productCount': 2,
            'isDefault': false,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
        ),
      ],
    );
  }

  Widget _buildDefaultListExample() {
    return Column(
      children: [
        ListCard(
          list: {
            'name': 'Lista por Defecto',
            'productCount': 3,
            'isDefault': true,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
        ),
        const SizedBox(height: 12),
        ListCard(
          list: {
            'name': 'Favoritos del Sistema',
            'productCount': 1,
            'isDefault': true,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
        ),
      ],
    );
  }

  Widget _buildCustomStylingExample() {
    return Column(
      children: [
        ListCard(
          list: {
            'name': 'Lista Personalizada',
            'productCount': 8,
            'isDefault': false,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
          height: 100.0,
          backgroundColor: Colors.blue[50],
          borderColor: Colors.blue[200],
          borderRadius: 16.0,
          stackedCardsSize: 60.0,
          stackedCardsSpacing: 6.0,
        ),
        const SizedBox(height: 12),
        ListCard(
          list: {
            'name': 'Lista con Colores',
            'productCount': 4,
            'isDefault': false,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
          backgroundColor: Colors.green[50],
          borderColor: Colors.green[200],
          borderRadius: 20.0,
          stackedCardsSize: 55.0,
        ),
      ],
    );
  }

  Widget _buildWithImagesExample() {
    return Column(
      children: [
        ListCard(
          list: {
            'name': 'Suplementos Favoritos',
            'productCount': 3,
            'isDefault': false,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
          stackedCardsSize: 60.0,
          productImageUrls: const [
            'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
          ],
          customTexts: const ['+3', '2', '1'],
          customTextStyles: const [
            TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ],
          customTextBackgroundColors: const [
            AppColors.white,
            AppColors.white,
            AppColors.white,
          ],
          customTextBackgroundOpacities: const [0.7, 0.7, 0.7],
        ),
        const SizedBox(height: 12),
        ListCard(
          list: {
            'name': 'Productos Variados',
            'productCount': 2,
            'isDefault': false,
          },
          onTap: () {},
          onChangeName: () {},
          onDelete: () {},
          productImageUrls: const [
            'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
          ],
          stackedCardsSize: 55.0,
          customTexts: const ['+2', '1'],
          customTextStyles: const [
            TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ],
          customTextBackgroundColors: const [AppColors.white, AppColors.white],
          customTextBackgroundOpacities: const [0.7, 0.7],
        ),
      ],
    );
  }
}
