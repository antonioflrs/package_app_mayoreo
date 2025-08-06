# Uso de Iconos Personalizados en Sidebar Navigation

Este documento explica cómo usar iconos personalizados de tu librería en el sidebar de navegación.

## Estructura Actualizada

El modelo `NavigationItem` ahora soporta dos tipos de iconos:

### 1. Iconos de Material (IconData)
```dart
NavigationItem.material(
  id: 'example',
  title: 'Ejemplo',
  description: 'Descripción del ejemplo',
  icon: Icons.home,  // Icono de Material
  category: NavigationCategory.designGuides,
)
```

### 2. Iconos SVG Personalizados
```dart
NavigationItem.svg(
  id: 'example',
  title: 'Ejemplo',
  description: 'Descripción del ejemplo',
  svgIcon: SvgIcons.userActive,  // Icono SVG de tu librería
  category: NavigationCategory.designGuides,
)
```

## Ejemplos de Uso

### Iconos de Navegación
```dart
NavigationItem.svg(
  id: 'menu',
  title: 'Menú Principal',
  description: 'Navegación principal',
  svgIcon: SvgIcons.burgerMenu,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Usuario
```dart
NavigationItem.svg(
  id: 'profile',
  title: 'Perfil',
  description: 'Gestión de perfil',
  svgIcon: SvgIcons.userActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Pedidos
```dart
NavigationItem.svg(
  id: 'orders',
  title: 'Pedidos',
  description: 'Gestión de pedidos',
  svgIcon: SvgIcons.ordersActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Carrito
```dart
NavigationItem.svg(
  id: 'cart',
  title: 'Carrito',
  description: 'Carrito de compras',
  svgIcon: SvgIcons.cartActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Categorías
```dart
NavigationItem.svg(
  id: 'categories',
  title: 'Categorías',
  description: 'Gestión de categorías',
  svgIcon: SvgIcons.categoriesActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Favoritos
```dart
NavigationItem.svg(
  id: 'favorites',
  title: 'Favoritos',
  description: 'Elementos favoritos',
  svgIcon: SvgIcons.favoritesActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Documentos
```dart
NavigationItem.svg(
  id: 'documents',
  title: 'Documentos',
  description: 'Gestión de documentos',
  svgIcon: SvgIcons.documentActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Ayuda
```dart
NavigationItem.svg(
  id: 'help',
  title: 'Ayuda',
  description: 'Centro de ayuda',
  svgIcon: SvgIcons.helpActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Ubicación
```dart
NavigationItem.svg(
  id: 'location',
  title: 'Ubicación',
  description: 'Gestión de ubicaciones',
  svgIcon: SvgIcons.locationActive,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Comunicación
```dart
NavigationItem.svg(
  id: 'mail',
  title: 'Correo',
  description: 'Sistema de correo',
  svgIcon: SvgIcons.mail,
  category: NavigationCategory.designGuides,
)
```

### Iconos de Acciones
```dart
NavigationItem.svg(
  id: 'delete',
  title: 'Eliminar',
  description: 'Acción de eliminar',
  svgIcon: SvgIcons.delete,
  category: NavigationCategory.designGuides,
)
```

## Ventajas de Usar Iconos SVG

1. **Consistencia**: Todos los iconos siguen el mismo estilo de diseño
2. **Escalabilidad**: Los iconos SVG se ven nítidos en cualquier tamaño
3. **Personalización**: Puedes cambiar colores y estilos fácilmente
4. **Organización**: Los iconos están organizados por categorías
5. **Mantenimiento**: Fácil de actualizar y mantener

## Implementación Técnica

El sidebar ahora maneja automáticamente ambos tipos de iconos:

- **Iconos Material**: Se muestran usando `Icon()` widget
- **Iconos SVG**: Se muestran como placeholders (se puede integrar con `flutter_svg`)

Para integrar completamente con `flutter_svg`, agrega la dependencia:

```yaml
dependencies:
  flutter_svg: ^latest_version
```

Y actualiza el método `_buildIcon` en `sidebar_navigation.dart`:

```dart
case IconType.svg:
  return SvgPicture.asset(
    item.svgIcon!,
    width: 18,
    height: 18,
    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
  );
```

## Categorías de Iconos Disponibles

- **Navegación**: burgerMenu, arrowLeft, close, check, plus, reset
- **Usuario**: userActive, userInactive, profile
- **Pedidos**: ordersActive, ordersInactive, cartActive, cartInactive
- **Categorías**: categoriesActive, categoriesInactive, listActive, listInactive
- **Favoritos**: favoritesActive, favoritesInactive, favActive, favInactive
- **Documentos**: documentActive, documentInactive
- **Ayuda**: helpActive, helpInactive
- **Ubicación**: locationActive, locationInactive
- **Comunicación**: mail, share
- **Acciones**: delete, alert
- **Marca**: logoMayoreo, logoActive, bToolkit, appleLogo
- **Redes Sociales**: whatsapp

¡Ahora puedes usar todos tus iconos personalizados en el sidebar de navegación! 