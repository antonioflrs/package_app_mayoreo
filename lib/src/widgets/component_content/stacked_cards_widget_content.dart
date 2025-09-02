import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el StackedCardsWidget
class StackedCardsWidgetContent extends StatelessWidget {
  const StackedCardsWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Stacked Cards Widget',
      componentDescription: 'Widget personalizable para mostrar tarjetas apiladas con efecto de rotación. Soporta personalización completa de dimensiones, imágenes, colores y textos.',
      examples: [
        ComponentExample(
          id: 'basic-usage',
          title: 'Uso básico - Una tarjeta',
          description: 'Ejemplo básico con una sola tarjeta',
          codeExample: '''
StackedCardsWidget(
  productCount: 1,
  size: 50.0,
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
)
          ''',
          previewWidget: _buildBasicExample(),
        ),
        ComponentExample(
          id: 'two-cards',
          title: 'Dos tarjetas con texto personalizado',
          description: 'Ejemplo con dos tarjetas y texto personalizado',
          codeExample: '''
StackedCardsWidget(
  productCount: 2,
  size: 50.0,
  imageUrls: [
    'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
    'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  ],
  mainCardText: '+2',
  mainTextStyle: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  mainTextBackgroundColor: Colors.blue,
  mainTextBackgroundOpacity: 0.8,
)
          ''',
          previewWidget: _buildTwoCardsExample(),
        ),
        ComponentExample(
          id: 'three-cards',
          title: 'Tres tarjetas con dimensiones personalizadas',
          description: 'Ejemplo con tres tarjetas, dimensiones personalizadas y colores',
          codeExample: '''
StackedCardsWidget(
  productCount: 3,
  width: 80.0,
  height: 100.0,
  imageUrls: [
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
  cardBackgroundColor: Colors.grey[50],
  cardBorderColor: Colors.grey[300],
  cardBorderRadius: 12.0,
)
          ''',
          previewWidget: _buildThreeCardsExample(),
        ),
        ComponentExample(
          id: 'custom-styling',
          title: 'Estilo completamente personalizado',
          description: 'Ejemplo con personalización completa de colores, sombras y rotaciones',
          codeExample: '''
StackedCardsWidget(
  productCount: 4,
  width: 90.0,
  height: 120.0,
  spacing: 8.0,
  cardBackgroundColor: Colors.indigo[50],
  cardBorderColor: Colors.indigo[400],
  cardBorderRadius: 20.0,
  shadowColor: Colors.indigo,
  shadowBlurRadius: 12.0,
  shadowOffset: Offset(0, 6),
  customRotationAngles: [-15.0, -5.0, 5.0, 15.0],
  customLeftOffsets: [-60.0, -20.0, 20.0, 60.0],
  customTexts: ['+4', '3', '2', '1'],
  customTextStyles: [
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
    TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
    TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
  ],
  customTextBackgroundColors: [
    Colors.indigo[800]!,
    Colors.indigo[600]!,
    Colors.indigo[600]!,
    Colors.indigo[600]!,
  ],
  onMainCardTap: () => print('Tarjeta principal tocada'),
  onCardTap: () => print('Tarjeta del fondo tocada'),
)
          ''',
          previewWidget: _buildCustomStylingExample(),
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Center(
      child: StackedCardsWidget(
        productCount: 1,
        size: 50.0,
        imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
      ),
    );
  }

  Widget _buildTwoCardsExample() {
    return Center(
      child: StackedCardsWidget(
        productCount: 2,
        size: 50.0,
        imageUrls: [
          'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
          'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
        ],
        mainCardText: '2',
        mainTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        mainTextBackgroundColor: AppColors.white,
        mainTextBackgroundOpacity: 0.8,
      ),
    );
  }

  Widget _buildThreeCardsExample() {
    return Center(
      child: StackedCardsWidget(
        productCount: 3,
        width: 55.0,
        height: 65.0,
        imageUrls: [
          'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
          'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
          'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
        ],
        customTexts: ['+3', '2', '1'],
        customTextStyles: const [
          TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
          TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w900),
          TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w900),
        ],
        customTextBackgroundColors: [Colors.white, Colors.white, Colors.white],
        customTextBackgroundOpacities: [0.7, 0.7, 0.7],
        cardBackgroundColor: AppColors.white,
        cardBorderColor: AppColors.backCards,
        cardBorderRadius: 12.0,
      ),
    );
  }

  Widget _buildCustomStylingExample() {
    return Center(
      child: StackedCardsWidget(
        productCount: 4,
        width: 70.0,
        height: 100.0,
        spacing: 8.0,
        cardBackgroundColor: Colors.indigo[50],
        cardBorderColor: Colors.indigo[400],
        cardBorderRadius: 20.0,
        shadowColor: Colors.indigo,
        shadowBlurRadius: 12.0,
        shadowOffset: const Offset(0, 6),

        customRotationAngles: [-15.0, -5.0, 5.0, 15.0],
        customLeftOffsets: [-60.0, -20.0, 20.0, 60.0],
        customTexts: ['+4', '3', '2', '1'],
        customTextStyles: const [
          TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ],
        customTextBackgroundColors: [
          Colors.indigo[800]!,
          Colors.indigo[600]!,
          Colors.indigo[600]!,
          Colors.indigo[600]!,
        ],
        onMainCardTap: () => print('Tarjeta principal tocada'),
        onCardTap: () => print('Tarjeta del fondo tocada'),
      ),
    );
  }
}