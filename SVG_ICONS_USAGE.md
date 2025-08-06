# Uso de Iconos SVG Propios

Este documento explica cómo usar los iconos SVG propios del paquete `flutter_package_app_mayoreo`.

## 📦 Instalación

Asegúrate de tener `flutter_svg` como dependencia:

```yaml
dependencies:
  flutter_svg: ^2.0.10+1
```

## 🎯 Widgets Disponibles

### 1. CustomSvgIcon

Widget básico para renderizar iconos SVG:

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

CustomSvgIcon(
  iconPath: SvgIconHelper.bToolkit,
  height: 32,
  color: Colors.black,
)
```

### 2. SafeSvgIcon

Widget con manejo de errores y fallback:

```dart
SafeSvgIcon(
  iconPath: SvgIconHelper.userActive,
  height: 24,
  color: Colors.blue,
  fallback: Icon(Icons.person, size: 24),
)
```

## 🗂️ Iconos Disponibles

### Navegación
```dart
SvgIconHelper.burgerMenu    // Menú hamburguesa
SvgIconHelper.arrowLeft     // Flecha izquierda
SvgIconHelper.arrowDown     // Flecha abajo
SvgIconHelper.close         // Cerrar
SvgIconHelper.check         // Verificar
SvgIconHelper.plus          // Más
SvgIconHelper.reset         // Restaurar
```

### Usuario
```dart
SvgIconHelper.userActive    // Usuario activo
SvgIconHelper.userInactive  // Usuario inactivo
```

### Pedidos y Carrito
```dart
SvgIconHelper.ordersActive    // Pedidos activo
SvgIconHelper.ordersInactive  // Pedidos inactivo
SvgIconHelper.cartActive      // Carrito activo
SvgIconHelper.cartInactive    // Carrito inactivo
```

### Categorías
```dart
SvgIconHelper.categoriesActive   // Categorías activo
SvgIconHelper.categoriesInactive // Categorías inactivo
```

### Favoritos
```dart
SvgIconHelper.favoritesActive   // Favoritos activo
SvgIconHelper.favoritesInactive // Favoritos inactivo
SvgIconHelper.favActive         // Favorito activo
SvgIconHelper.favInactive       // Favorito inactivo
```

### Documentos
```dart
SvgIconHelper.documentActive   // Documento activo
SvgIconHelper.documentInactive // Documento inactivo
```

### Tarjetas
```dart
SvgIconHelper.cardActive   // Tarjeta activa
SvgIconHelper.cardInactive // Tarjeta inactiva
```

### Ayuda
```dart
SvgIconHelper.helpActive   // Ayuda activo
SvgIconHelper.helpInactive // Ayuda inactivo
```

### Ubicación
```dart
SvgIconHelper.locationActive   // Ubicación activa
SvgIconHelper.locationInactive // Ubicación inactiva
```

### Comunicación
```dart
SvgIconHelper.mail  // Correo
SvgIconHelper.share // Compartir
```

### Acciones
```dart
SvgIconHelper.delete // Eliminar
SvgIconHelper.alert  // Alerta
```

### Sistema de Diseño
```dart
SvgIconHelper.colors      // Colores
SvgIconHelper.typography  // Tipografía
SvgIconHelper.shadows     // Sombras
SvgIconHelper.spacing     // Espaciado
SvgIconHelper.breakpoints // Breakpoints
SvgIconHelper.zIndex      // Z Index
```

### Marca
```dart
SvgIconHelper.bToolkit     // B Toolkit
SvgIconHelper.logoActive   // Logo activo
SvgIconHelper.logoInactive // Logo inactivo
SvgIconHelper.appleLogo    // Logo Apple
```

### Redes Sociales
```dart
SvgIconHelper.whatsapp // WhatsApp
```

## 📋 Ejemplos de Uso

### Ejemplo 1: Icono básico
```dart
CustomSvgIcon(
  iconPath: SvgIconHelper.userActive,
  height: 24,
  color: Colors.blue,
)
```

### Ejemplo 2: Icono con fallback
```dart
SafeSvgIcon(
  iconPath: SvgIconHelper.cartActive,
  height: 32,
  color: Colors.orange,
  fallback: Icon(Icons.shopping_cart, size: 32),
)
```

### Ejemplo 3: Icono con tamaño personalizado
```dart
CustomSvgIcon(
  iconPath: SvgIconHelper.favoritesActive,
  width: 48,
  height: 48,
  color: Colors.red,
  fit: BoxFit.contain,
)
```

### Ejemplo 4: Icono en botón
```dart
ElevatedButton.icon(
  onPressed: () {},
  icon: CustomSvgIcon(
    iconPath: SvgIconHelper.check,
    height: 20,
    color: Colors.white,
  ),
  label: Text('Confirmar'),
)
```

### Ejemplo 5: Icono en AppBar
```dart
AppBar(
  title: Text('Mi App'),
  actions: [
    IconButton(
      icon: CustomSvgIcon(
        iconPath: SvgIconHelper.search,
        height: 24,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
  ],
)
```

## 🔍 Búsqueda de Iconos

### Obtener todos los iconos por categoría
```dart
Map<String, List<String>> iconsByCategory = SvgIconHelper.getAllIconsByCategory();
```

### Obtener todos los iconos
```dart
List<String> allIcons = SvgIconHelper.getAllIcons();
```

### Buscar iconos por nombre
```dart
List<String> searchResults = SvgIconHelper.searchIcons('user');
```

## 🎨 Personalización

### Cambiar color
```dart
CustomSvgIcon(
  iconPath: SvgIconHelper.userActive,
  color: Colors.blue, // Cambia el color del icono
)
```

### Cambiar tamaño
```dart
CustomSvgIcon(
  iconPath: SvgIconHelper.cartActive,
  width: 32,
  height: 32,
)
```

### Cambiar fit
```dart
CustomSvgIcon(
  iconPath: SvgIconHelper.bToolkit,
  fit: BoxFit.cover, // contain, cover, fill, etc.
)
```

## ⚠️ Consideraciones

1. **Rendimiento**: Los SVG se renderizan de forma eficiente
2. **Escalabilidad**: Los iconos se escalan sin pérdida de calidad
3. **Tamaño**: Los archivos SVG son ligeros
4. **Compatibilidad**: Funciona en todas las plataformas

## 🐛 Solución de Problemas

### El icono no se muestra
1. Verifica que la ruta del icono sea correcta
2. Asegúrate de que el archivo SVG existe
3. Usa `SafeSvgIcon` para ver el fallback

### El icono se ve mal
1. Verifica el `BoxFit`
2. Ajusta el `width` y `height`
3. Revisa el archivo SVG original

### Error de compilación
1. Verifica que `flutter_svg` esté en las dependencias
2. Ejecuta `flutter pub get`
3. Limpia y reconstruye el proyecto 