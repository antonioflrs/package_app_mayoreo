# Biblioteca de Iconos SVG - SvgIcons

Esta biblioteca organiza todos los iconos SVG personalizados de la aplicación, agrupándolos por categorías y tipos.

## Estructura de Carpetas

```
lib/src/icons/
├── app_icons.dart          # Biblioteca principal de iconos SVG
├── icons.dart              # Archivo de exportaciones
├── README.md               # Esta documentación
├── filled/                 # Iconos con relleno
├── stroke/                 # Iconos de trazo
├── blife/                  # Iconos de marca B Life
├── social_media/           # Iconos de redes sociales
├── pagos/                  # Iconos de pagos
├── status_pedidos/         # Iconos de estado de pedidos
└── simbolicos/             # Iconos simbólicos
```

## Categorías de Iconos

### Navegación
Iconos utilizados para la navegación y control de interfaz:
- `burgerMenu` - Menú hamburguesa
- `arrowLeft` - Flecha izquierda
- `arrowDown` - Flecha abajo
- `close` - Cerrar
- `check` - Verificar
- `plus` - Más
- `reset` - Restaurar

### Usuario
Iconos relacionados con el usuario:
- `userActive` - Usuario activo
- `userInactive` - Usuario inactivo
- `profile` - Perfil

### Pedidos y Carrito
Iconos para gestión de pedidos:
- `ordersActive` - Pedidos activo
- `ordersInactive` - Pedidos inactivo
- `ordersActivo` - Órdenes activo
- `ordersInactivo` - Órdenes inactivo
- `cartActive` - Carrito activo
- `cartInactive` - Carrito inactivo

### Categorías y Listas
Iconos para organización de contenido:
- `categoriesActive` - Categorías activo
- `categoriesInactive` - Categorías inactivo
- `listActive` - Lista activa
- `listInactive` - Lista inactiva
- `noteAdd` - Agregar nota
- `noteAddStroke` - Agregar nota (stroke)

### Favoritos
Iconos para gestión de favoritos:
- `favoritesActive` - Favoritos activo
- `favoritesInactive` - Favoritos inactivo
- `favActive` - Favorito activo
- `favInactive` - Favorito inactivo

### Documentos
Iconos para gestión de documentos:
- `documentActive` - Documento activo
- `documentInactive` - Documento inactivo

### Tarjetas y Pagos
Iconos para pagos:
- `cardActive` - Tarjeta activa
- `cardInactive` - Tarjeta inactiva

### Ayuda
Iconos de ayuda:
- `helpActive` - Ayuda activo
- `helpInactive` - Ayuda inactivo

### Ubicación
Iconos de ubicación:
- `locationActive` - Ubicación activa
- `locationInactive` - Ubicación inactiva

### Comunicación
Iconos de comunicación:
- `mail` - Correo
- `share` - Compartir

### Acciones
Iconos de acciones:
- `delete` - Eliminar
- `alert` - Alerta

### Sistema de Diseño
Iconos para el sistema de diseño:
- `colors` - Colores
- `typography` - Tipografía
- `shadows` - Sombras
- `spacing` - Espaciados
- `breakpoints` - Breakpoints
- `zIndex` - Z Index

### Marca
Iconos de marca:
- `logoMayoreo` - Logo de B Life Mayoreo
- `logoActive` - Logo activo
- `logoInactive` - Logo inactivo
- `bToolkit` - B Toolkit
- `appleLogo` - Logo de Apple

### Redes Sociales
Iconos de redes sociales:
- `whatsapp` - Logo de WhatsApp

## Uso

### Uso básico
```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(SvgIcons.burgerMenu)
SvgPicture.asset(SvgIcons.userActive)
SvgPicture.asset(SvgIcons.logoMayoreo)
```

### Obtener iconos por categoría
```dart
final iconsByCategory = SvgIcons.getAllIconsByCategory();
final navigationIcons = iconsByCategory['Navegación'];
```

### Obtener todos los iconos
```dart
final allIcons = SvgIcons.getAllIcons();
```

### Buscar iconos
```dart
final searchResults = SvgIcons.searchIcons('user');
```

### Obtener iconos por tipo
```dart
final filledIcons = SvgIcons.getIconsByType('filled');
final strokeIcons = SvgIcons.getIconsByType('stroke');
```

## Tipos de Iconos

### Filled
Iconos con relleno sólido, ubicados en `filled/`

### Stroke
Iconos de trazo, ubicados en `stroke/`

### B Life
Iconos de marca, ubicados en `blife/`

### Social Media
Iconos de redes sociales, ubicados en `social_media/`

### Pagos
Iconos relacionados con pagos, ubicados en `pagos/`

### Status Pedidos
Iconos de estado de pedidos, ubicados en `status_pedidos/`

### Simbólicos
Iconos simbólicos, ubicados en `simbolicos/`

## Convenciones de Nomenclatura

- Los nombres de los archivos SVG usan snake_case
- Los nombres de las constantes usan camelCase
- Los nombres reflejan la funcionalidad del icono
- Se incluye el estado (active/inactive) cuando aplica

## Agregar Nuevos Iconos

Para agregar un nuevo icono:

1. Coloca el archivo SVG en la carpeta apropiada
2. Agrega la constante en `app_icons.dart`
3. Incluye documentación con `///`
4. Actualiza los métodos de utilidad si es necesario
5. Actualiza esta documentación

### Ejemplo:
```dart
/// Icono para nueva funcionalidad
static const String newFeature = 'assets/icons/filled/new_feature.svg';
```

## Dependencias

Para usar los iconos SVG, asegúrate de tener la dependencia:

```yaml
dependencies:
  flutter_svg: ^latest_version
```

## Mantenimiento

- Revisar regularmente la consistencia de nombres
- Actualizar documentación cuando se agreguen nuevos iconos
- Verificar que todos los iconos estén siendo utilizados
- Considerar deprecar iconos no utilizados 