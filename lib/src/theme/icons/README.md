# Biblioteca de Iconos - IconLibrary

Esta biblioteca de iconos proporciona una colección organizada y consistente de iconos para el sistema de diseño de la aplicación.

## Características

- **Organización por categorías**: Los iconos están agrupados por funcionalidad
- **Documentación completa**: Cada icono incluye comentarios descriptivos
- **Métodos de utilidad**: Funciones para buscar y obtener iconos
- **Consistencia**: Todos los iconos siguen el mismo patrón de nomenclatura

## Categorías de Iconos

### Navegación
Iconos utilizados para la navegación y control de interfaz:
- `menu` - Menú principal
- `close` - Cerrar
- `back` - Volver atrás
- `forward` - Ir hacia adelante
- `expand` - Expandir
- `collapse` - Contraer

### Acciones
Iconos para acciones principales:
- `add` - Agregar
- `edit` - Editar
- `delete` - Eliminar
- `save` - Guardar
- `cancel` - Cancelar
- `confirm` - Confirmar
- `search` - Buscar
- `filter` - Filtrar

### Estado
Iconos para mostrar estados del sistema:
- `success` - Éxito
- `error` - Error
- `warning` - Advertencia
- `info` - Información
- `loading` - Carga

### Usuario
Iconos relacionados con el usuario:
- `user` - Usuario
- `profile` - Perfil
- `settings` - Configuración
- `notifications` - Notificaciones
- `messages` - Mensajes

### Contenido
Iconos para tipos de contenido:
- `file` - Archivo
- `folder` - Carpeta
- `image` - Imagen
- `video` - Video
- `document` - Documento
- `download` - Descarga
- `upload` - Subida

### Comunicación
Iconos para comunicación:
- `phone` - Teléfono
- `email` - Email
- `chat` - Chat
- `share` - Compartir
- `link` - Enlace

### Comercio
Iconos específicos para comercio electrónico:
- `cart` - Carrito de compras
- `store` - Tienda
- `product` - Producto
- `order` - Pedido
- `payment` - Pago
- `shipping` - Envío
- `invoice` - Factura

### Analíticas
Iconos para análisis y reportes:
- `chart` - Gráfico
- `stats` - Estadísticas
- `report` - Reporte
- `dashboard` - Dashboard
- `metrics` - Métricas

### Seguridad
Iconos relacionados con seguridad:
- `lock` - Candado
- `unlock` - Candado abierto
- `visibility` - Visibilidad
- `visibilityOff` - Visibilidad oculta
- `shield` - Escudo

### Fecha y Tiempo
Iconos para fechas y tiempo:
- `calendar` - Calendario
- `clock` - Reloj
- `date` - Fecha
- `time` - Tiempo

### Ubicación
Iconos para ubicación y mapas:
- `location` - Ubicación
- `map` - Mapa
- `gps` - GPS
- `address` - Dirección

### Redes Sociales
Iconos para redes sociales:
- `facebook` - Facebook
- `twitter` - Twitter
- `instagram` - Instagram
- `linkedin` - LinkedIn
- `youtube` - YouTube

## Uso

### Uso básico
```dart
import 'package:flutter_package_app_mayoreo/src/theme/icons/icon_library.dart';

Icon(IconLibrary.menu)
Icon(IconLibrary.search)
Icon(IconLibrary.user)
```

### Obtener iconos por categoría
```dart
final iconsByCategory = IconLibrary.getAllIconsByCategory();
final navigationIcons = iconsByCategory['Navegación'];
```

### Obtener todos los iconos
```dart
final allIcons = IconLibrary.getAllIcons();
```

### Buscar iconos
```dart
final searchResults = IconLibrary.searchIcons('user');
```

## Convenciones de Nomenclatura

- Los nombres de los iconos son descriptivos y en inglés
- Se utilizan nombres en camelCase
- Los nombres reflejan la funcionalidad del icono
- Se evitan abreviaciones confusas

## Agregar Nuevos Iconos

Para agregar un nuevo icono:

1. Identifica la categoría apropiada
2. Agrega el icono con un nombre descriptivo
3. Incluye documentación con `///`
4. Actualiza los métodos de utilidad si es necesario
5. Actualiza esta documentación

### Ejemplo:
```dart
/// Icono para nueva funcionalidad
static const IconData newFeature = Icons.new_feature;
```

## Mantenimiento

- Revisar regularmente la consistencia de nombres
- Actualizar documentación cuando se agreguen nuevos iconos
- Verificar que todos los iconos estén siendo utilizados
- Considerar deprecar iconos no utilizados

## Diferencias con AppIcons

- **AppIcons**: Configuración del tema de iconos (tamaños, colores, etc.)
- **IconLibrary**: Biblioteca de iconos específicos organizados por categorías

Ambos archivos trabajan en conjunto para proporcionar un sistema completo de iconos. 