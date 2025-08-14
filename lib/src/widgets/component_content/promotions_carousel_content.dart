import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../promotions_carousel.dart';

/// Contenido de documentación para el widget PromotionsCarousel
class PromotionsCarouselContent extends StatelessWidget {
  const PromotionsCarouselContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Promotions Carousel',
      componentDescription: 'Widget de carrusel de promociones completamente personalizable con autoplay, controles de play/pause, indicadores de página y dimensiones ajustables.',
      examples: [
        ComponentExample(
          id: 'carousel-basico',
          title: 'Carrusel básico',
          description: 'Carrusel simple con 3 imágenes y configuración por defecto',
          previewWidget: PromotionsCarousel(
            images: [
              'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
              'https://blife.mx/_next/image?url=https%3A%2F%2Fbanners-microservices.s3.amazonaws.com%2FBANNER-SLIDER-67c9e1c60e66b73197d9a5f9-Full-1752271277817.webp&w=3840&q=75',
              'https://productos-imagenes-megamenu.s3.us-east-1.amazonaws.com/pure-berbine-vitamina.webp',
            ],
          ),
          codeExample: '''
PromotionsCarousel(
  images: [
    'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
    'https://blife.mx/_next/image?url=https%3A%2F%2Fbanners-microservices.s3.amazonaws.com%2FBANNER-SLIDER-67c9e1c60e66b73197d9a5f9-Full-1752271277817.webp&w=3840&q=75',
    'https://productos-imagenes-megamenu.s3.us-east-1.amazonaws.com/pure-berbine-vitamina.webp',
  ],
)
          ''',
        ),
        ComponentExample(
          id: 'carousel-sin-controles',
          title: 'Carrusel sin controles de play/pause',
          description: 'Carrusel con múltiples imágenes pero sin botones de control',
          previewWidget: PromotionsCarousel(
            images: [
              'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
              'https://blife.mx/_next/image?url=https%3A%2F%2Fbanners-microservices.s3.amazonaws.com%2FBANNER-SLIDER-67c9e1c60e66b73197d9a5f9-Full-1752271277817.webp&w=3840&q=75',
              'https://productos-imagenes-megamenu.s3.us-east-1.amazonaws.com/pure-berbine-vitamina.webp',
              'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
            ],
            showPlayPauseControls: false,
          ),
          codeExample: '''
PromotionsCarousel(
  images: [
    'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
    'https://blife.mx/_next/image?url=https%3A%2F%2Fbanners-microservices.s3.amazonaws.com%2FBANNER-SLIDER-67c9e1c60e66b73197d9a5f9-Full-1752271277817.webp&w=3840&q=75',
    'https://productos-imagenes-megamenu.s3.us-east-1.amazonaws.com/pure-berbine-vitamina.webp',
    'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
  ],
  showPlayPauseControls: false,
)
          ''',
        ),
        ComponentExample(
          id: 'carousel-personalizado',
          title: 'Carrusel completamente personalizado',
          description: 'Carrusel con colores personalizados, dimensiones específicas y configuración avanzada',
          previewWidget: PromotionsCarousel(
            images: [
              'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
              'https://blife.mx/_next/image?url=https%3A%2F%2Fbanners-microservices.s3.amazonaws.com%2FBANNER-SLIDER-67c9e1c60e66b73197d9a5f9-Full-1752271277817.webp&w=3840&q=75',
              'https://productos-imagenes-megamenu.s3.us-east-1.amazonaws.com/pure-berbine-vitamina.webp',
            ],
            height: 150,
            width: 350,
            activeIndicatorColor: Colors.red,
            inactiveIndicatorColor: Colors.red.withOpacity(0.3),
            playPauseBackgroundColor: Colors.red.withOpacity(0.8),
            playPauseIconColor: Colors.white,
            autoplayDuration: 5,
            transitionDuration: 800,
            transitionCurve: Curves.bounceOut,
            indicatorSpacing: 8.0,
            activeIndicatorWidth: 32.0,
            inactiveIndicatorWidth: 12.0,
            indicatorHeight: 8.0,
            indicatorBorderRadius: 5.0,
          ),
          codeExample: '''
PromotionsCarousel(
  images: [
    'https://banners-microservices.s3.amazonaws.com/BANNER-SLIDER-6852feffee10b879548037fa-Full-1754546577814.webp',
    'https://blife.mx/_next/image?url=https%3A%2F%2Fbanners-microservices.s3.amazonaws.com%2FBANNER-SLIDER-67c9e1c60e66b73197d9a5f9-Full-1752271277817.webp&w=3840&q=75',
    'https://productos-imagenes-megamenu.s3.us-east-1.amazonaws.com/pure-berbine-vitamina.webp',
  ],
  height: 150,
  width: 350,
  activeIndicatorColor: Colors.red,
  inactiveIndicatorColor: Colors.red.withOpacity(0.3),
  playPauseBackgroundColor: Colors.red.withOpacity(0.8),
  playPauseIconColor: Colors.white,
  autoplayDuration: 5,
  transitionDuration: 800,
  transitionCurve: Curves.bounceOut,
  indicatorSpacing: 8.0,
  activeIndicatorWidth: 32.0,
  inactiveIndicatorWidth: 12.0,
  indicatorHeight: 10.0,
  indicatorBorderRadius: 5.0,
)
          ''',
        ),
      ], 
      properties: [
        ComponentProperty(
          name: 'images',
          type: 'List<String>',
          required: true,
          description: 'Lista de URLs de imágenes para el carrusel',
        ),
        ComponentProperty(
          name: 'height',
          type: 'double',
          required: false,
          defaultValue: '190.0',
          description: 'Altura del carrusel en píxeles',
        ),
        ComponentProperty(
          name: 'width',
          type: 'double?',
          required: false,
          description: 'Ancho del carrusel en píxeles (null = ancho completo)',
        ),
        ComponentProperty(
          name: 'showPlayPauseControls',
          type: 'bool',
          required: false,
          defaultValue: 'true',
          description: 'Mostrar controles de play/pause (solo si hay más de 1 imagen)',
        ),
        ComponentProperty(
          name: 'activeIndicatorColor',
          type: 'Color?',
          required: false,
          defaultValue: 'AppColors.grayMedium',
          description: 'Color de los indicadores de página activos',
        ),
        ComponentProperty(
          name: 'inactiveIndicatorColor',
          type: 'Color?',
          required: false,
          description: 'Color de los indicadores de página inactivos (por defecto activo con 0.3 opacidad)',
        ),
        ComponentProperty(
          name: 'playPauseBackgroundColor',
          type: 'Color?',
          required: false,
          defaultValue: 'AppColors.black con 0.5 opacidad',
          description: 'Color de fondo del botón play/pause',
        ),
        ComponentProperty(
          name: 'playPauseIconColor',
          type: 'Color?',
          required: false,
          defaultValue: 'AppColors.white',
          description: 'Color del icono play/pause',
        ),
        ComponentProperty(
          name: 'horizontalMargin',
          type: 'double',
          required: false,
          defaultValue: '16.0',
          description: 'Margen horizontal del carrusel',
        ),
        ComponentProperty(
          name: 'verticalMargin',
          type: 'double',
          required: false,
          defaultValue: '8.0',
          description: 'Margen vertical del carrusel',
        ),
        ComponentProperty(
          name: 'borderRadius',
          type: 'double',
          required: false,
          defaultValue: '12.0',
          description: 'Radio de borde del carrusel',
        ),
        ComponentProperty(
          name: 'autoplayDuration',
          type: 'int',
          required: false,
          defaultValue: '3',
          description: 'Duración del autoplay en segundos',
        ),
        ComponentProperty(
          name: 'transitionDuration',
          type: 'int',
          required: false,
          defaultValue: '500',
          description: 'Duración de la transición entre imágenes en milisegundos',
        ),
        ComponentProperty(
          name: 'transitionCurve',
          type: 'Curve',
          required: false,
          defaultValue: 'Curves.easeInOut',
          description: 'Curva de animación para las transiciones',
        ),
        ComponentProperty(
          name: 'showIndicators',
          type: 'bool?',
          required: false,
          description: 'Mostrar indicadores de página (null = automático basado en cantidad de imágenes)',
        ),
        ComponentProperty(
          name: 'indicatorSpacing',
          type: 'double',
          required: false,
          defaultValue: '4.0',
          description: 'Espaciado entre indicadores en píxeles',
        ),
        ComponentProperty(
          name: 'activeIndicatorWidth',
          type: 'double',
          required: false,
          defaultValue: '24.0',
          description: 'Ancho del indicador activo en píxeles',
        ),
        ComponentProperty(
          name: 'inactiveIndicatorWidth',
          type: 'double',
          required: false,
          defaultValue: '8.0',
          description: 'Ancho del indicador inactivo en píxeles',
        ),
        ComponentProperty(
          name: 'indicatorHeight',
          type: 'double',
          required: false,
          defaultValue: '8.0',
          description: 'Altura de los indicadores en píxeles',
        ),
        ComponentProperty(
          name: 'indicatorBorderRadius',
          type: 'double',
          required: false,
          defaultValue: '4.0',
          description: 'Radio de borde de los indicadores',
        ),
      ],
      usageNotes: '''
## Características principales

El widget `PromotionsCarousel` es un carrusel de imágenes completamente personalizable que incluye:

- **Autoplay inteligente**: Solo se activa cuando hay más de 1 imagen
- **Controles opcionales**: Botón play/pause que se puede ocultar
- **Indicadores personalizables**: Colores, tamaños y espaciado ajustables
- **Dimensiones flexibles**: Altura y ancho configurables
- **Manejo de errores**: Placeholder para imágenes que fallan al cargar
- **Transiciones suaves**: Animaciones configurables entre imágenes

## Comportamiento automático

- **Una imagen**: No hay autoplay, controles ni indicadores
- **Múltiples imágenes**: Autoplay activo, controles visibles e indicadores
- **Sin imágenes**: Muestra placeholder con borde y icono

## Casos de uso

- **Banners promocionales**: Carrusel de ofertas y promociones
- **Galerías de productos**: Múltiples vistas de un mismo producto
- **Sliders informativos**: Contenido que cambia automáticamente
- **Presentaciones**: Imágenes con transiciones automáticas

## Consideraciones técnicas

- **Performance**: Timer solo cuando es necesario (más de 1 imagen)
- **Responsivo**: Se adapta al ancho disponible por defecto
- **Accesibilidad**: Controles táctiles para pausar/reanudar
- **Manejo de errores**: Fallback visual para URLs inválidas

## Ejemplos de implementación

### Carrusel básico
```dart
PromotionsCarousel(
  images: [
    'https://ejemplo.com/imagen1.jpg',
    'https://ejemplo.com/imagen2.jpg',
    'https://ejemplo.com/imagen3.jpg',
  ],
)
```

### Carrusel sin controles
```dart
PromotionsCarousel(
  images: [
    'https://ejemplo.com/imagen1.jpg',
    'https://ejemplo.com/imagen2.jpg',
  ],
  showPlayPauseControls: false,
)
```

### Carrusel personalizado
```dart
PromotionsCarousel(
  images: [
    'https://ejemplo.com/imagen1.jpg',
    'https://ejemplo.com/imagen2.jpg',
  ],
  height: 200,
  width: 400,
  activeIndicatorColor: Colors.blue,
  autoplayDuration: 5,
  transitionCurve: Curves.bounceOut,
)
```

### Carrusel minimalista
```dart
PromotionsCarousel(
  images: [
    'https://ejemplo.com/imagen1.jpg',
    'https://ejemplo.com/imagen2.jpg',
  ],
  showIndicators: false,
  showPlayPauseControls: false,
  height: 150,
)
```
      ''',
    );
  }
}
