# Sistema de Fuentes - Inter

Este documento describe cómo usar la fuente Inter en el paquete `app_mayoreo`.

## Configuración

### Fuentes Incluidas

El paquete incluye las siguientes variantes de la fuente Inter:

- **Inter-Light.ttf** (300) - Para texto fino y elegante
- **Inter-Regular.ttf** (400) - Para texto normal
- **Inter-Medium.ttf** (500) - Para texto medio
- **Inter-SemiBold.ttf** (600) - Para texto semi-negrita
- **Inter-Bold.ttf** (700) - Para texto negrita

### Configuración en pubspec.yaml

```yaml
fonts:
  - family: Inter
    fonts:
      - asset: assets/fonts/Inter-Light.ttf
        weight: 300
      - asset: assets/fonts/Inter-Regular.ttf
        weight: 400
      - asset: assets/fonts/Inter-Medium.ttf
        weight: 500
      - asset: assets/fonts/Inter-SemiBold.ttf
        weight: 600
      - asset: assets/fonts/Inter-Bold.ttf
        weight: 700
```

## Uso

### 1. Usando AppFonts

```dart
import 'package:app_mayoreo/src/theme/fonts/app_fonts.dart';

// Estilos predefinidos
Text('Texto Light', style: AppFonts.interLight);
Text('Texto Regular', style: AppFonts.interRegular);
Text('Texto Medium', style: AppFonts.interMedium);
Text('Texto SemiBold', style: AppFonts.interSemiBold);
Text('Texto Bold', style: AppFonts.interBold);

// Estilos personalizados
Text(
  'Texto Personalizado',
  style: AppFonts.interStyle(
    fontSize: 20,
    fontWeight: AppFonts.semiBold,
    color: Colors.blue,
    letterSpacing: 0.5,
  ),
);
```

### 2. Usando AppTypography (Recomendado)

```dart
import 'package:app_mayoreo/src/theme/typography/app_typography.dart';

// Los estilos ya incluyen Inter automáticamente
Text('Título', style: AppTypography.headlineLarge);
Text('Subtítulo', style: AppTypography.titleMedium);
Text('Cuerpo', style: AppTypography.bodyMedium);
```

### 3. En Widgets

```dart
// En TextField
TextField(
  style: AppFonts.interStyle(fontSize: 16, fontWeight: AppFonts.regular),
  decoration: InputDecoration(
    labelText: 'Etiqueta',
    labelStyle: AppFonts.interStyle(fontSize: 14, fontWeight: AppFonts.medium),
  ),
)

// En Botones (automático)
UiButton(
  label: 'Mi Botón',
  size: UiButtonSize.medium, // Usa Inter automáticamente
  onPressed: () {},
)
```

## Pesos de Fuente Disponibles

| Peso | Valor | Uso Recomendado |
|------|-------|-----------------|
| Light | 300 | Texto decorativo, subtítulos finos |
| Regular | 400 | Texto principal, cuerpo de texto |
| Medium | 500 | Títulos pequeños, etiquetas |
| SemiBold | 600 | Títulos medianos, precios |
| Bold | 700 | Títulos principales, elementos destacados |

## Constantes Disponibles

```dart
// Familias de fuente
AppFonts.inter        // 'Inter'
AppFonts.robotoMono   // 'RobotoMono'

// Pesos de fuente
AppFonts.light        // FontWeight.w300
AppFonts.regular      // FontWeight.w400
AppFonts.medium       // FontWeight.w500
AppFonts.semiBold     // FontWeight.w600
AppFonts.bold         // FontWeight.w700
```

## Métodos Helper

### AppFonts.interStyle()
Crea un TextStyle con la fuente Inter:

```dart
AppFonts.interStyle({
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  double? height,
  Color? color,
  TextDecoration? decoration,
})
```

### AppFonts.monoStyle()
Crea un TextStyle con la fuente RobotoMono:

```dart
AppFonts.monoStyle({
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  double? height,
  Color? color,
  TextDecoration? decoration,
})
```

## Ejemplos de Uso

### Tarjeta de Producto

```dart
Card(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título con Inter Bold
        Text(
          'Producto Destacado',
          style: AppFonts.interStyle(
            fontSize: 20,
            fontWeight: AppFonts.bold,
          ),
        ),
        
        // Descripción con Inter Regular
        Text(
          'Descripción del producto',
          style: AppFonts.interStyle(
            fontSize: 14,
            fontWeight: AppFonts.regular,
          ),
        ),
        
        // Precio con Inter SemiBold
        Text(
          '\$99.99',
          style: AppFonts.interStyle(
            fontSize: 18,
            fontWeight: AppFonts.semiBold,
            color: Colors.green,
          ),
        ),
      ],
    ),
  ),
)
```

### Formulario

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Nombre',
    labelStyle: AppFonts.interStyle(
      fontSize: 14,
      fontWeight: AppFonts.medium,
    ),
    hintText: 'Ingresa tu nombre',
    hintStyle: AppFonts.interStyle(
      fontSize: 14,
      fontWeight: AppFonts.regular,
      color: Colors.grey,
    ),
  ),
  style: AppFonts.interStyle(
    fontSize: 16,
    fontWeight: AppFonts.regular,
  ),
)
```

## Integración con el Sistema de Tipografía

El sistema de tipografía (`AppTypography`) ya está configurado para usar Inter automáticamente. Todos los estilos predefinidos utilizan la fuente Inter con los pesos apropiados:

- **Display styles**: Inter Regular
- **Headline styles**: Inter Regular
- **Title styles**: Inter Medium
- **Body styles**: Inter Regular
- **Label styles**: Inter Medium
- **Button styles**: Inter Medium/SemiBold

## Mejores Prácticas

1. **Usa AppTypography** para estilos estándar
2. **Usa AppFonts** para estilos personalizados
3. **Mantén consistencia** en los pesos de fuente
4. **Usa Inter Regular** para texto principal
5. **Usa Inter Medium/SemiBold** para títulos
6. **Usa Inter Bold** solo para elementos muy destacados

## Verificación

Para verificar que las fuentes están funcionando correctamente:

1. Ejecuta `flutter pub get`
2. Ejecuta `flutter analyze`
3. Prueba la aplicación y verifica que los textos usen Inter

## Troubleshooting

### Las fuentes no se cargan
- Verifica que los archivos estén en `assets/fonts/`
- Verifica la configuración en `pubspec.yaml`
- Ejecuta `flutter clean` y `flutter pub get`

### Las fuentes no se aplican
- Verifica que estés usando `AppTypography` o `AppFonts`
- Verifica que el tema esté configurado correctamente
- Verifica que no haya estilos inline que sobrescriban la fuente 