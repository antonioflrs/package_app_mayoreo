# Sistema de Tipografía - App Mayoreo

Este documento describe cómo usar el sistema de tipografía unificado del paquete `app_mayoreo`.

## Estructura

El sistema de tipografía está organizado en el archivo `app_typography.dart` y proporciona:

- **TextTheme estándar de Material Design 3**
- **Estilos especializados** para casos de uso específicos
- **Métodos helper** para crear y modificar estilos
- **Constantes** para pesos y familias de fuentes

## Uso Básico

### 1. Estilos Predefinidos

```dart
import 'package:app_mayoreo/src/theme/typography/app_typography.dart';

// Usar estilos del TextTheme
Text('Título Principal', style: AppTypography.headlineLarge);
Text('Subtítulo', style: AppTypography.titleMedium);
Text('Cuerpo de texto', style: AppTypography.bodyMedium);

// Usar estilos especializados
Text('Precio: \$99.99', style: AppTypography.price);
Text('Código: const example = "test";', style: AppTypography.code);
Text('BADGE', style: AppTypography.badge);
```

### 2. Estilos para Botones

```dart
// El sistema automáticamente selecciona el estilo correcto según el tamaño
Text('Botón Pequeño', style: AppTypography.buttonTextSmall);
Text('Botón Mediano', style: AppTypography.buttonTextMedium);
Text('Botón Grande', style: AppTypography.buttonTextLarge);

// O usar el método helper
Text('Botón', style: AppTypography.getButtonTextStyle(UiButtonSize.medium));
```

### 3. Crear Estilos Personalizados

```dart
// Crear un estilo desde cero
TextStyle customStyle = AppTypography.custom(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
  letterSpacing: 0.5,
);

// Modificar un estilo existente
TextStyle boldTitle = AppTypography.withWeight(
  AppTypography.titleMedium!,
  FontWeight.bold,
);

TextStyle coloredBody = AppTypography.withColor(
  AppTypography.bodyLarge!,
  Colors.green,
);

TextStyle largerText = AppTypography.withSize(
  AppTypography.bodyMedium!,
  18,
);
```

## Estilos Disponibles

### TextTheme (Material Design 3)

| Estilo | Tamaño | Peso | Uso |
|--------|--------|------|-----|
| `displayLarge` | 57px | Regular | Títulos principales muy grandes |
| `displayMedium` | 45px | Regular | Títulos principales grandes |
| `displaySmall` | 36px | Regular | Títulos principales |
| `headlineLarge` | 32px | Regular | Encabezados grandes |
| `headlineMedium` | 28px | Regular | Encabezados medianos |
| `headlineSmall` | 24px | Regular | Encabezados pequeños |
| `titleLarge` | 22px | Medium | Títulos de sección |
| `titleMedium` | 16px | Medium | Títulos de contenido |
| `titleSmall` | 14px | Medium | Subtítulos |
| `bodyLarge` | 16px | Regular | Texto principal |
| `bodyMedium` | 14px | Regular | Texto secundario |
| `bodySmall` | 12px | Regular | Texto pequeño |
| `labelLarge` | 14px | Medium | Etiquetas grandes |
| `labelMedium` | 12px | Medium | Etiquetas medianas |
| `labelSmall` | 11px | Medium | Etiquetas pequeñas |

### Estilos Especializados

| Estilo | Descripción | Uso |
|--------|-------------|-----|
| `buttonTextSmall` | Texto para botones pequeños | Botones compactos |
| `buttonTextMedium` | Texto para botones medianos | Botones estándar |
| `buttonTextLarge` | Texto para botones grandes | Botones prominentes |
| `price` | Estilo para precios | Mostrar precios de productos |
| `priceLarge` | Estilo para precios grandes | Precios destacados |
| `badge` | Estilo para badges | Etiquetas y badges |
| `code` | Estilo monoespaciado | Código y números |
| `codeSmall` | Estilo monoespaciado pequeño | Código compacto |
| `caption` | Texto de caption | Textos explicativos |
| `overline` | Texto de overline | Textos decorativos |

## Constantes Disponibles

### Pesos de Fuente

```dart
FontWeight.w300  // Light
FontWeight.w400  // Regular
FontWeight.w500  // Medium
FontWeight.w600  // SemiBold
FontWeight.w700  // Bold
```

### Familias de Fuente

```dart
'Inter'        // Fuente principal
'RobotoMono'   // Fuente monoespaciada
```

## Integración con Widgets

### En Botones

El sistema se integra automáticamente con `UiButton`:

```dart
UiButton(
  label: 'Mi Botón',
  size: UiButtonSize.medium, // Automáticamente usa buttonTextMedium
  onPressed: () {},
)
```

### En Temas

El sistema está integrado en `AppTheme`:

```dart
MaterialApp(
  theme: AppTheme.theme, // Incluye AppTypography.textTheme
  // ...
)
```

## Mejores Prácticas

1. **Usa estilos predefinidos** en lugar de crear estilos inline
2. **Mantén consistencia** usando el mismo estilo para elementos similares
3. **Usa los métodos helper** para modificaciones menores
4. **Documenta estilos personalizados** cuando sea necesario
5. **Sigue la jerarquía visual** establecida por el TextTheme

## Ejemplos

Ver `typography_examples.dart` para ejemplos completos de uso en diferentes contextos:

- Showcase de todos los estilos
- Uso en cards
- Uso en list items
- Creación de estilos personalizados

## Migración

Si tienes estilos inline existentes, puedes migrarlos gradualmente:

```dart
// Antes
Text('Título', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400))

// Después
Text('Título', style: AppTypography.headlineSmall)
``` 