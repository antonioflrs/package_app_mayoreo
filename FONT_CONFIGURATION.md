# Configuración de Fuentes - InterVariable + OpenType

## Resumen
La aplicación ahora usa exclusivamente **InterVariable.ttf** con características OpenType avanzadas:
- **Stylistic Set 01 (ss01)**: Mejora la legibilidad de caracteres específicos
- **Character Variant 11 (cv11)**: Optimiza el espaciado y proporciones

## Archivos de Fuentes
- ✅ **InterVariable.ttf** (859KB) - Fuente variable con todos los pesos (100-900)
- ❌ **Inter-*.ttf** - Fuentes estáticas eliminadas

## Configuración en pubspec.yaml

### Paquete Principal
```yaml
fonts:
  - family: InterVariable
    fonts:
      - asset: assets/fonts/InterVariable.ttf
        weight: 100
      - asset: assets/fonts/InterVariable.ttf
        weight: 200
      - asset: assets/fonts/InterVariable.ttf
        weight: 300
      - asset: assets/fonts/InterVariable.ttf
        weight: 400
      - asset: assets/fonts/InterVariable.ttf
        weight: 500
      - asset: assets/fonts/InterVariable.ttf
        weight: 600
      - asset: assets/fonts/InterVariable.ttf
        weight: 700
      - asset: assets/fonts/InterVariable.ttf
        weight: 800
      - asset: assets/fonts/InterVariable.ttf
        weight: 900
```

### Example App
```yaml
fonts:
  - family: InterVariable
    fonts:
      - asset: ../assets/fonts/InterVariable.ttf
        weight: 100
      # ... (misma configuración)
```

## API de AppFonts

### Método Principal: `AppFonts.get()`
```dart
// Con características OpenType por defecto (ss01 + cv11)
TextStyle style = AppFonts.get(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
```

### Método Básico: `AppFonts.getBasic()`
```dart
// Sin características OpenType
TextStyle style = AppFonts.getBasic(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
```

### Método Personalizado: `AppFonts.getWithFeatures()`
```dart
// Con características OpenType personalizadas
TextStyle style = AppFonts.getWithFeatures(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFeatures: [
    FontFeature.stylisticSet(2), // ss02
    FontFeature('cv01'),          // cv01
  ],
);
```

## AppTypography
Todos los estilos de texto usan `AppFonts.get()` automáticamente:

```dart
static TextTheme get textTheme => TextTheme(
  displayLarge: AppFonts.get(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  ),
  // ... más estilos
);
```

## AppTheme
```dart
static const String _fontFamily = 'InterVariable';
```

## Ventajas de InterVariable
1. **Un solo archivo**: Reemplaza múltiples archivos de fuentes
2. **Pesos variables**: Soporte completo de 100-900
3. **Características OpenType**: Mejora la legibilidad y estética
4. **Menor tamaño**: 859KB vs múltiples archivos de 284KB cada uno
5. **Mejor rendimiento**: Una sola fuente para cargar

## Características OpenType Aplicadas
- **ss01**: Stylistic Set 01 - Mejora caracteres específicos
- **cv11**: Character Variant 11 - Optimiza espaciado y proporciones

## Uso en Widgets
```dart
Text(
  'Texto con InterVariable + OpenType',
  style: AppTypography.headlineMedium,
)
```

## Verificación
- ✅ `flutter analyze` - Sin errores
- ✅ `flutter test` - Todas las pruebas pasan
- ✅ Fuentes configuradas correctamente en ambos pubspec.yaml
