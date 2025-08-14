import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget BienestarBanner
class BienestarBannerContent extends StatelessWidget {
  const BienestarBannerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Bienestar Banner',
      componentDescription: 'Widget de banner promocional con dos modos: modo imagen (con imagen de fondo) y modo texto (con fondo negro y texto blanco). El contador solo aparece cuando hay tiempo activo.',
      examples: [
        ComponentExample(
          id: 'banner-imagen-basico',
          title: 'Banner modo imagen básico',
          description: 'Banner con imagen de fondo sin contador (tiempo inactivo)',
          previewWidget: const BienestarBanner(
            imageUrl: 'https://blife-mx-categorias.s3.amazonaws.com/precios-de-lanzamiento-%F0%9F%92%A5-45cd92-movil.webp',
          ),
          codeExample: '''
BienestarBanner(
  imageUrl: 'https://blife-mx-categorias.s3.amazonaws.com/precios-de-lanzamiento-%F0%9F%92%A5-45cd92-movil.webp',
)
          ''',
        ),
        ComponentExample(
          id: 'banner-imagen-con-contador',
          title: 'Banner modo imagen con contador',
          description: 'Banner con imagen de fondo y contador activo (tiempo válido)',
          previewWidget: BienestarBanner(
            imageUrl: 'https://blife-mx-categorias.s3.amazonaws.com/precios-de-lanzamiento-%F0%9F%92%A5-45cd92-movil.webp',
            expirationDate: DateTime.now().add(const Duration(days: 2, hours: 5, minutes: 30)),
          ),
          codeExample: '''
BienestarBanner(
  imageUrl: 'https://blife-mx-categorias.s3.amazonaws.com/precios-de-lanzamiento-%F0%9F%92%A5-45cd92-movil.webp',
  expirationDate: DateTime.now().add(
    Duration(days: 2, hours: 5, minutes: 30)
  ),
)
          ''',
        ),
        ComponentExample(
          id: 'banner-texto-basico',
          title: 'Banner modo texto básico',
          description: 'Banner con fondo negro y texto blanco sin contador (tiempo inactivo)',
          previewWidget: const BienestarBanner(
            title: '¡Oferta Especial!',
            subtitle: 'Hasta 50% de descuento',
          ),
          codeExample: '''
BienestarBanner(
  title: '¡Oferta Especial!',
  subtitle: 'Hasta 50% de descuento',
)
          ''',
        ),
        ComponentExample(
          id: 'banner-texto-con-contador',
          title: 'Banner modo texto con contador',
          description: 'Banner con fondo negro, texto blanco y contador activo (tiempo válido)',
          previewWidget: BienestarBanner(
            title: '¡Últimas Horas!',
            subtitle: 'Oferta por tiempo limitado',
            expirationDate: DateTime.now().add(const Duration(hours: 24)),
          ),
          codeExample: '''
BienestarBanner(
  title: '¡Últimas Horas!',
  subtitle: 'Oferta por tiempo limitado',
  expirationDate: DateTime.now().add(Duration(hours: 24)),
)
          ''',
        ),

        ComponentExample(
          id: 'banner-personalizado',
          title: 'Banner completamente personalizado',
          description: 'Banner modo texto con colores, etiquetas y dimensiones personalizadas',
          previewWidget: BienestarBanner(
            title: 'Black Friday',
            subtitle: '¡No te lo pierdas!',
            expirationDate: DateTime.now().add(const Duration(days: 7)),
            counterBackgroundColor: Colors.red,
            counterTextColor: Colors.yellow,
            counterLabels: {
              'days': 'Días',
              'hours': 'Hs',
              'minutes': 'Min',
              'seconds': 'Seg',
            },
            bannerHeight: 60,
            bannerWidth: 400,
            counterHeight: 35,
            counterWidth: 250,
          ),
          codeExample: '''
BienestarBanner(
  title: 'Black Friday',
  subtitle: '¡No te lo pierdas!',
  expirationDate: DateTime.now().add(Duration(days: 7)),
  counterBackgroundColor: Colors.red,
  counterTextColor: Colors.yellow,
  counterLabels: {
    'days': 'Días',
    'hours': 'Hs',
    'minutes': 'Min',
    'seconds': 'Seg',
  },
  bannerHeight: 80,
  bannerWidth: 300,
  counterHeight: 35,
  counterWidth: 250,
)
          ''',
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'imageUrl',
          type: 'String?',
          required: false,
          description: 'URL de la imagen de fondo del banner (modo imagen)',
        ),
        ComponentProperty(
          name: 'imageAsset',
          type: 'String?',
          required: false,
          description: 'Asset local de la imagen (modo imagen, alternativa a imageUrl)',
        ),
        ComponentProperty(
          name: 'title',
          type: 'String?',
          required: false,
          description: 'Título principal del banner (modo texto)',
        ),
        ComponentProperty(
          name: 'subtitle',
          type: 'String?',
          required: false,
          description: 'Subtítulo o descripción del banner (modo texto)',
        ),
        ComponentProperty(
          name: 'expirationDate',
          type: 'DateTime?',
          required: false,
          description: 'Fecha de vencimiento de la promoción para el contador regresivo',
        ),
        ComponentProperty(
          name: 'showCounter',
          type: 'bool',
          required: false,
          defaultValue: 'true',
          description: 'Mostrar u ocultar el contador regresivo',
        ),
        ComponentProperty(
          name: 'counterBackgroundColor',
          type: 'Color?',
          required: false,
          defaultValue: 'AppColors.orangeBrand',
          description: 'Color de fondo del contador',
        ),
        ComponentProperty(
          name: 'counterTextColor',
          type: 'Color?',
          required: false,
          defaultValue: 'Colors.white',
          description: 'Color del texto del contador',
        ),
        ComponentProperty(
          name: 'counterLabels',
          type: 'Map<String, String>?',
          required: false,
          description: 'Etiquetas personalizadas para días, horas, minutos y segundos',
        ),
        ComponentProperty(
          name: 'bannerHeight',
          type: 'double',
          required: false,
          defaultValue: '60.0',
          description: 'Altura del banner principal en píxeles',
        ),
        ComponentProperty(
          name: 'bannerWidth',
          type: 'double?',
          required: false,
          description: 'Ancho del banner principal en píxeles (null = ancho completo)',
        ),
        ComponentProperty(
          name: 'counterHeight',
          type: 'double',
          required: false,
          defaultValue: '28.0',
          description: 'Altura del contador en píxeles',
        ),
        ComponentProperty(
          name: 'counterWidth',
          type: 'double?',
          required: false,
          description: 'Ancho del contador en píxeles (null = ancho completo)',
        ),
        ComponentProperty(
          name: 'bannerMargin',
          type: 'double',
          required: false,
          defaultValue: '16.0',
          description: 'Margen horizontal del banner principal',
        ),
        ComponentProperty(
          name: 'counterMargin',
          type: 'double',
          required: false,
          defaultValue: '34.0',
          description: 'Margen horizontal del contador',
        ),
        ComponentProperty(
          name: 'borderRadius',
          type: 'double',
          required: false,
          defaultValue: '12.0',
          description: 'Radio de borde del banner principal',
        ),
        ComponentProperty(
          name: 'counterBorderRadius',
          type: 'double',
          required: false,
          defaultValue: '12.0',
          description: 'Radio de borde del contador',
        ),
      ],
      usageNotes: '''
## Modos de funcionamiento

El widget `BienestarBanner` tiene **dos modos exclusivos** que no pueden usarse simultáneamente:

### 🖼️ **Modo Imagen**
- **Propiedades**: `imageUrl` o `imageAsset` (obligatorio)
- **Apariencia**: Banner con imagen de fondo
- **Contador**: Solo aparece si hay `expirationDate` válida Y `showCounter = true`
- **Sin contador**: Solo se muestra la imagen de fondo

### 📝 **Modo Texto**
- **Propiedades**: `title` y/o `subtitle` (al menos uno obligatorio)
- **Apariencia**: Banner con fondo negro y texto blanco
- **Contador**: Solo aparece si hay `expirationDate` válida Y `showCounter = true`
- **Sin contador**: Solo se muestra el texto sobre fondo negro

## Casos de uso

- **Promociones con imagen**: Usa modo imagen para banners visuales atractivos
- **Promociones de texto**: Usa modo texto para mensajes claros y directos
- **Contador inteligente**: El contador solo aparece cuando hay tiempo activo
- **Banners estáticos**: Sin contador para promociones permanentes

## Características principales

- **Dos modos exclusivos**: Imagen O texto, no ambos
- **Contador inteligente**: Solo aparece cuando hay tiempo válido
- **Validación automática**: Previene configuraciones incorrectas
- **Responsivo**: Se adapta a diferentes tamaños de pantalla
- **Performance optimizada**: Timer solo cuando es necesario

## Consideraciones técnicas

- **Modos mutuamente excluyentes**: Debes elegir entre imagen o texto
- **Contador automático**: Solo se muestra si `expirationDate` es futura
- **Validación**: El assert previene configuraciones inválidas
- **Timer inteligente**: Se cancela automáticamente cuando no es necesario

## Ejemplos de implementación

### Modo imagen básico
```dart
BienestarBanner(
  imageUrl: 'https://ejemplo.com/imagen.jpg',
)
```

### Modo imagen con contador
```dart
BienestarBanner(
  imageUrl: 'https://ejemplo.com/imagen.jpg',
  expirationDate: DateTime.now().add(Duration(days: 1)),
)
```

### Modo texto básico
```dart
BienestarBanner(
  title: '¡Oferta Especial!',
  subtitle: 'Hasta 50% de descuento',
)
```

### Modo texto con contador
```dart
BienestarBanner(
  title: '¡Último día!',
  subtitle: 'Oferta por tiempo limitado',
  expirationDate: DateTime.now().add(Duration(hours: 24)),
)
```

### Modo texto personalizado
```dart
BienestarBanner(
  title: 'Black Friday',
  subtitle: '¡No te lo pierdas!',
  expirationDate: DateTime.now().add(Duration(days: 7)),
  counterBackgroundColor: Colors.black,
  counterTextColor: Colors.white,
  counterLabels: {
    'days': 'Días',
    'hours': 'Hs',
    'minutes': 'Min',
    'seconds': 'Seg',
  },
  bannerHeight: 80,
  bannerWidth: 300,
  counterHeight: 35,
  counterWidth: 250,
)
```

### Banner con dimensiones personalizadas
```dart
BienestarBanner(
  imageUrl: 'https://ejemplo.com/imagen.jpg',
  bannerHeight: 100,
  bannerWidth: 400,
  counterHeight: 40,
  counterWidth: 350,
)
```
      ''',
    );
  }
}
