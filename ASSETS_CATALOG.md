# 📦 Catálogo Completo de Assets - flutter_package_app_mayoreo

## 🎯 Resumen de Assets Disponibles

Este documento lista **TODOS** los assets que obtendrá el equipo que importe el package `flutter_package_app_mayoreo`.

### 📊 Estadísticas Totales
- **Total de Assets**: 50+ elementos
- **Fuentes**: 5 archivos TTF
- **Iconos SVG**: 45+ archivos organizados en 7 categorías
- **Tamaño Total**: ~1.5MB

## 🔤 Fuentes Inter

### Ubicación: `assets/fonts/`
**Familia**: `Inter`

| Archivo | Peso | Tamaño | Uso |
|---------|------|--------|-----|
| `Inter-Light.ttf` | 300 | 284KB | Texto ligero |
| `Inter-Regular.ttf` | 400 | 284KB | Texto normal |
| `Inter-Medium.ttf` | 500 | 284KB | Texto medio |
| `Inter-SemiBold.ttf` | 600 | 284KB | Texto semi-negrita |
| `Inter-Bold.ttf` | 700 | 284KB | Texto negrita |

### Acceso Programático
```dart
// Rutas de archivos
FontAssets.interLight
FontAssets.interRegular
FontAssets.interMedium
FontAssets.interSemiBold
FontAssets.interBold

// Familia de fuente
FontAssets.interFamily // 'Inter'
```

## 🎨 Iconos SVG

### 1. Iconos BLife (Marca)
**Ubicación**: `assets/icons/blife/`

| Archivo | Tamaño | Descripción |
|---------|--------|-------------|
| `b_toolkit.svg` | 6.5KB | Toolkit de BLife |
| `logo_activo.svg` | 2.5KB | Logo activo |
| `logo_inactivo.svg` | 2.5KB | Logo inactivo |
| `logo_mayoreo.svg` | 10.0KB | Logo Mayoreo |

### 2. Iconos Filled (Rellenos)
**Ubicación**: `assets/icons/filled/`

| Archivo | Tamaño | Descripción |
|---------|--------|-------------|
| `apple_logo.svg` | 986B | Logo de Apple |
| `card_active.svg` | 638B | Tarjeta activa |
| `card_inactive.svg` | 638B | Tarjeta inactiva |
| `cart_activo.svg` | 1.9KB | Carrito activo |
| `categories_activo.svg` | 1.4KB | Categorías activas |
| `document_active.svg` | 2.6KB | Documento activo |
| `document_inactive.svg` | 2.3KB | Documento inactivo |
| `fav_active.svg` | 494B | Favorito activo |
| `fav_inactive.svg` | 494B | Favorito inactivo |
| `favorites_activo.svg` | 1.1KB | Favoritos activos |
| `help_active.svg` | 1.7KB | Ayuda activa |
| `help_inactive.svg` | 1.7KB | Ayuda inactiva |
| `list_active.svg` | 2.9KB | Lista activa |
| `list_inactive.svg` | 2.9KB | Lista inactiva |
| `mail_icon.svg` | 642B | Icono de correo |
| `note_add_list.svg` | 2.3KB | Agregar nota a lista |
| `orders_activo.svg` | 1.4KB | Pedidos activos |
| `pedidos_active.svg` | 1.4KB | Pedidos activos |
| `pedidos_inactive.svg` | 1.4KB | Pedidos inactivos |
| `ubication_active.svg` | 687B | Ubicación activa |
| `ubication_inactive.svg` | 687B | Ubicación inactiva |
| `user_activo.svg` | 1.7KB | Usuario activo |

### 3. Iconos Stroke (Trazo)
**Ubicación**: `assets/icons/stroke/`

| Archivo | Tamaño | Descripción |
|---------|--------|-------------|
| `alert_icon.svg` | 249B | Icono de alerta |
| `arrow_down.svg` | 214B | Flecha hacia abajo |
| `arrow_left.svg` | 215B | Flecha hacia la izquierda |
| `breakpoints.svg` | 952B | Breakpoints |
| `burguer_icon.svg` | 403B | Icono de hamburguesa |
| `cart_inactivo.svg` | 1.0KB | Carrito inactivo |
| `categories_inactive.svg` | 1.3KB | Categorías inactivas |
| `check.svg` | 252B | Check |
| `close.svg` | 299B | Cerrar |
| `colors.svg` | 1.1KB | Colores |
| `delete.svg` | 1.2KB | Eliminar |
| `espaciados.svg` | 299B | Espaciados |
| `favorites_inactivo.svg` | 1.1KB | Favoritos inactivos |
| `hugeicons_note-add.svg` | 1.8KB | Agregar nota |
| `icon.svg` | 508B | Icono genérico |
| `ordes_inactivo.svg` | 1.7KB | Órdenes inactivas |
| `plus_icon.svg` | 295B | Icono de más |
| `rest.svg` | 196B | Restar |
| `search_icon.svg` | 679B | Icono de búsqueda |
| `shadow.svg` | 630B | Sombra |
| `share_icon.svg` | 777B | Icono de compartir |
| `tipography.svg` | 756B | Tipografía |
| `user_inactivo.svg` | 2.0KB | Usuario inactivo |
| `z_index.svg` | 616B | Z-index |

### 4. Iconos Simbólicos
**Ubicación**: `assets/icons/simbolicos/`

| Archivo | Tamaño | Descripción |
|---------|--------|-------------|
| `promotions.svg` | - | Promociones |

### 5. Iconos Social Media
**Ubicación**: `assets/icons/social_media/`

| Archivo | Tamaño | Descripción |
|---------|--------|-------------|
| `whatsapp_logo.svg` | - | Logo de WhatsApp |

### 6. Iconos de Pagos
**Ubicación**: `assets/icons/pagos/`
*Directorio disponible para iconos específicos de pagos*

### 7. Iconos de Estado de Pedidos
**Ubicación**: `assets/icons/status_pedidos/`
*Directorio disponible para iconos específicos de estado de pedidos*

## 🚀 Cómo Acceder a los Assets

### 1. Importación del Package
```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
```

### 2. Acceso a Fuentes
```dart
// Usar la familia de fuente
Text(
  'Mi texto',
  style: TextStyle(
    fontFamily: FontAssets.interFamily,
    fontWeight: FontWeight.w500,
  ),
)

// O usar AppTypography (recomendado)
Text(
  'Mi texto',
  style: AppTypography.bodyMedium,
)
```

### 3. Acceso a Iconos SVG
```dart
import 'package:flutter_svg/flutter_svg.dart';

// Usar iconos específicos
SvgPicture.asset(
  IconAssets.blifeLogoActivo,
  width: 24,
  height: 24,
  colorFilter: ColorFilter.mode(
    AppColors.orangeBrand,
    BlendMode.srcIn,
  ),
)

// Usar CustomSvgIcon (recomendado)
CustomSvgIcon(
  assetPath: IconAssets.filledCartActivo,
  size: 24,
  color: AppColors.orangeBrand,
)
```

### 4. Acceso por Categorías
```dart
// Obtener todos los iconos de una categoría
List<String> filledIcons = AssetCategories.filledIcons;
List<String> strokeIcons = AssetCategories.strokeIcons;
List<String> blifeIcons = AssetCategories.blifeIcons;

// Obtener estadísticas
int totalAssets = AssetUtils.totalAssetCount;
int filledCount = AssetUtils.getAssetCount('filled');
```

### 5. Validación de Assets
```dart
// Verificar si un asset existe
bool isValid = AssetUtils.isValidAsset('assets/icons/blife/logo_activo.svg');
```

## 📋 Clases de Acceso Disponibles

### FontAssets
```dart
FontAssets.interLight
FontAssets.interRegular
FontAssets.interMedium
FontAssets.interSemiBold
FontAssets.interBold
FontAssets.interFamily
```

### IconAssets
```dart
// BLife
IconAssets.blifeToolkit
IconAssets.blifeLogoActivo
IconAssets.blifeLogoInactivo
IconAssets.blifeLogoMayoreo

// Filled
IconAssets.filledAppleLogo
IconAssets.filledCardActive
IconAssets.filledCartActivo
// ... y muchos más

// Stroke
IconAssets.strokeAlertIcon
IconAssets.strokeArrowDown
IconAssets.strokeCheck
// ... y muchos más

// Simbólicos
IconAssets.simbolicosPromotions

// Social Media
IconAssets.socialMediaWhatsappLogo
```

### AssetCategories
```dart
AssetCategories.fonts
AssetCategories.blifeIcons
AssetCategories.filledIcons
AssetCategories.strokeIcons
AssetCategories.symbolicIcons
AssetCategories.socialMediaIcons
AssetCategories.allIcons
AssetCategories.allAssets
```

### AssetUtils
```dart
AssetUtils.totalAssetCount
AssetUtils.getAssetCount('category')
AssetUtils.getAssetsByCategory('category')
AssetUtils.isValidAsset('path')
```

## 🎯 Ejemplos de Uso

### Ejemplo 1: Logo de Marca
```dart
SvgPicture.asset(
  IconAssets.blifeLogoActivo,
  width: 120,
  height: 40,
)
```

### Ejemplo 2: Icono de Carrito
```dart
CustomSvgIcon(
  assetPath: IconAssets.filledCartActivo,
  size: 24,
  color: AppColors.orangeBrand,
)
```

### Ejemplo 3: Texto con Fuente Inter
```dart
Text(
  'Título Principal',
  style: TextStyle(
    fontFamily: FontAssets.interFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  ),
)
```

### Ejemplo 4: Lista de Iconos
```dart
ListView.builder(
  itemCount: AssetCategories.filledIcons.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: SvgPicture.asset(
        AssetCategories.filledIcons[index],
        width: 24,
        height: 24,
      ),
      title: Text('Icono ${index + 1}'),
    );
  },
)
```

## 🔧 Configuración Requerida

### Dependencias
```yaml
dependencies:
  flutter_package_app_mayoreo: ^0.0.1
  flutter_svg: ^2.0.10+1  # Para iconos SVG
```

### pubspec.yaml del Package
```yaml
flutter:
  assets:
    - assets/  # Incluye todos los assets
  
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

## ✅ Verificación de Assets

### Widget de Demo
El package incluye un widget de demostración completo:
```dart
AssetsDemoWidget() // Muestra todos los assets disponibles
```

### Verificación Programática
```dart
// Verificar que todos los assets estén disponibles
for (String asset in AssetCategories.allAssets) {
  print('Asset disponible: $asset');
}

// Contar assets por categoría
print('Total de assets: ${AssetUtils.totalAssetCount}');
print('Iconos filled: ${AssetUtils.getAssetCount('filled')}');
```

---

**🎉 ¡Todos estos assets están incluidos automáticamente cuando importas el package!**

**📦 No necesitas configuración adicional - todo está listo para usar.**
