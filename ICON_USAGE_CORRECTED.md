# Uso Correcto de Iconos del Package

## 🎯 Importante: Rutas de Iconos Corregidas

Los iconos del package están organizados en `lib/src/assets/icons` y se acceden a través de las clases `SvgIcons` e `IconAssets`.

---

## 📁 Estructura de Iconos

```
lib/src/assets/icons/
├── blife/           # Iconos de marca B Life
├── filled/          # Iconos rellenos
├── stroke/          # Iconos de contorno
├── simbolicos/      # Iconos simbólicos
├── social_media/    # Iconos de redes sociales
├── pagos/           # Iconos de pagos
└── status_pedidos/  # Iconos de estado de pedidos
```

---

## 🔧 Formas de Acceder a los Iconos

### **Opción 1: SvgIcons (Recomendado)**
```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

CustomSvgIcon(
  iconPath: SvgIcons.userActive, // ✅ Correcto
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)
```

### **Opción 2: IconAssets**
```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

CustomSvgIcon(
  iconPath: IconAssets.filledUserActivo, // ✅ Correcto
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)
```

---

## ❌ Errores Comunes

### **1. Rutas Hardcodeadas (Incorrecto)**
```dart
// ❌ NO HACER ESTO
CustomSvgIcon(
  iconPath: 'assets/icons/filled/user_activo.svg',
  width: 24,
  height: 24,
)

// ❌ NO HACER ESTO
CustomSvgIcon(
  iconPath: 'lib/src/assets/icons/filled/user_activo.svg',
  width: 24,
  height: 24,
)
```

### **2. Importación Directa (Incorrecto)**
```dart
// ❌ NO HACER ESTO
import 'package:flutter_package_app_mayoreo/src/icons/app_icons.dart';
import 'package:flutter_package_app_mayoreo/src/assets/assets.dart';
```

---

## ✅ Ejemplos Correctos

### **1. Iconos de Navegación**
```dart
// Botón de regreso
IconButton(
  icon: CustomSvgIcon(
    iconPath: SvgIcons.arrowLeft,
    width: 24,
    height: 24,
    color: AppColors.white,
  ),
  onPressed: () => Navigator.pop(context),
)

// Menú hamburguesa
IconButton(
  icon: CustomSvgIcon(
    iconPath: SvgIcons.burgerMenu,
    width: 24,
    height: 24,
    color: AppColors.darkGray,
  ),
  onPressed: () {},
)
```

### **2. Iconos de Usuario**
```dart
// Avatar de usuario
Container(
  width: 80,
  height: 80,
  decoration: BoxDecoration(
    color: AppColors.orangeBrand.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(40),
  ),
  child: CustomSvgIcon(
    iconPath: SvgIcons.userActive,
    width: 40,
    height: 40,
    color: AppColors.orangeBrand,
  ),
)
```

### **3. Iconos de Carrito**
```dart
// Carrito vacío
CustomSvgIcon(
  iconPath: SvgIcons.cartInactive,
  width: 80,
  height: 80,
  color: AppColors.grayMedium,
)

// Carrito con productos
CustomSvgIcon(
  iconPath: SvgIcons.cartActive,
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)
```

### **4. Iconos de Favoritos**
```dart
// Botón de favorito
GestureDetector(
  onTap: () {
    setState(() {
      isFavorite = !isFavorite;
    });
  },
  child: CustomSvgIcon(
    iconPath: isFavorite ? SvgIcons.favoritesActive : SvgIcons.favoritesInactive,
    width: 24,
    height: 24,
    color: isFavorite ? AppColors.digitalRed : AppColors.grayMedium,
  ),
)
```

### **5. Iconos de Acciones**
```dart
// Botón eliminar
IconButton(
  icon: CustomSvgIcon(
    iconPath: SvgIcons.delete,
    width: 20,
    height: 20,
    color: AppColors.digitalRed,
  ),
  onPressed: () {},
)

// Botón de alerta
CustomSvgIcon(
  iconPath: SvgIcons.alert,
  width: 16,
  height: 16,
  color: AppColors.yellow,
)
```

---

## 🎨 Iconos por Categoría

### **Navegación**
```dart
SvgIcons.burgerMenu    // Menú hamburguesa
SvgIcons.arrowLeft     // Flecha izquierda
SvgIcons.arrowDown     // Flecha abajo
SvgIcons.close         // Cerrar
SvgIcons.check         // Verificar
SvgIcons.plus          // Más
SvgIcons.reset         // Restaurar
```

### **Usuario**
```dart
SvgIcons.userActive    // Usuario activo
SvgIcons.userInactive  // Usuario inactivo
SvgIcons.profile       // Perfil
```

### **Pedidos y Carrito**
```dart
SvgIcons.ordersActive    // Pedidos activo
SvgIcons.ordersInactive  // Pedidos inactivo
SvgIcons.cartActive      // Carrito activo
SvgIcons.cartInactive    // Carrito inactivo
```

### **Categorías**
```dart
SvgIcons.categoriesActive   // Categorías activo
SvgIcons.categoriesInactive // Categorías inactivo
SvgIcons.listActive         // Lista activa
SvgIcons.listInactive       // Lista inactiva
```

### **Favoritos**
```dart
SvgIcons.favoritesActive   // Favoritos activo
SvgIcons.favoritesInactive // Favoritos inactivo
```

### **Documentos**
```dart
SvgIcons.documentActive   // Documento activo
SvgIcons.documentInactive // Documento inactivo
```

### **Tarjetas**
```dart
SvgIcons.cardActive   // Tarjeta activa
SvgIcons.cardInactive // Tarjeta inactiva
```

### **Ayuda**
```dart
SvgIcons.helpActive   // Ayuda activo
SvgIcons.helpInactive // Ayuda inactivo
```

### **Ubicación**
```dart
SvgIcons.locationActive   // Ubicación activa
SvgIcons.locationInactive // Ubicación inactiva
```

### **Comunicación**
```dart
SvgIcons.mail  // Correo
SvgIcons.share // Compartir
```

### **Acciones**
```dart
SvgIcons.delete // Eliminar
SvgIcons.alert  // Alerta
```

---

## 🔍 Verificación de Iconos

### **1. Verificar que el icono existe**
```dart
// ✅ Verificar antes de usar
if (SvgIcons.userActive.isNotEmpty) {
  CustomSvgIcon(
    iconPath: SvgIcons.userActive,
    width: 24,
    height: 24,
  )
}
```

### **2. Usar SafeSvgIcon para manejo de errores**
```dart
// ✅ Manejo seguro de errores
SafeSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  fallback: Icon(Icons.person, size: 24),
)
```

### **3. Verificar en tiempo de desarrollo**
```dart
// ✅ Debug para verificar rutas
print('Icon path: ${SvgIcons.userActive}');
```

---

## 🚀 Comandos de Verificación

```bash
# Verificar que el package esté instalado
flutter pub deps

# Verificar análisis de código
flutter analyze

# Ejecutar tests
flutter test

# Limpiar y reconstruir si hay problemas
flutter clean && flutter pub get
```

---

## 📝 Mejores Prácticas

### **1. Importación Correcta**
```dart
// ✅ Siempre usar esta importación
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
```

### **2. Uso de Constantes**
```dart
// ✅ Usar constantes del package
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
)

// ❌ NO usar rutas hardcodeadas
// CustomSvgIcon(
//   iconPath: 'assets/icons/filled/user_activo.svg',
//   width: 24,
//   height: 24,
// )
```

### **3. Tamaños Consistentes**
```dart
// ✅ Usar tamaños estándar
const double iconSize = 24.0;
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: iconSize,
  height: iconSize,
)
```

### **4. Colores del Sistema**
```dart
// ✅ Usar colores del package
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  color: AppColors.orangeBrand,
)

// ❌ NO usar colores hardcodeados
// CustomSvgIcon(
//   iconPath: SvgIcons.userActive,
//   color: Color(0xFFFF6B35),
// )
```

### **5. Estados de Iconos**
```dart
// ✅ Estados claros
CustomSvgIcon(
  iconPath: isActive ? SvgIcons.userActive : SvgIcons.userInactive,
  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
)
```

---

## 🐛 Solución de Problemas

### **Problema: Icono no se muestra**
```dart
// ✅ Verificar la ruta
print('Icon path: ${SvgIcons.userActive}');

// ✅ Usar SafeSvgIcon con fallback
SafeSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  fallback: Icon(Icons.person, size: 24),
)
```

### **Problema: Error de asset no encontrado**
```bash
# ✅ Limpiar cache
flutter clean

# ✅ Reinstalar dependencias
flutter pub get

# ✅ Verificar assets del package
flutter pub deps
```

### **Problema: Icono se ve pixelado**
```dart
// ✅ Usar tamaños apropiados
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,  // Usar múltiplos de 8
  height: 24,
  fit: BoxFit.contain, // Asegurar que se ajuste correctamente
)
```

---

## 📚 Recursos Adicionales

- [Documentación del Package](README.md)
- [Ejemplos de Integración](example/lib/test_package_integration.dart)
- [Lista Completa de Iconos](lib/src/icons/app_icons.dart)
- [Assets del Package](lib/src/assets/assets.dart)

---

## 🎯 Resumen

1. **Usar siempre `SvgIcons` o `IconAssets`** para acceder a los iconos
2. **NO usar rutas hardcodeadas** como `'assets/icons/...'`
3. **Importar correctamente** el package completo
4. **Verificar que los iconos existan** antes de usarlos
5. **Usar `SafeSvgIcon`** para manejo seguro de errores
6. **Mantener consistencia** en tamaños y colores
7. **Reportar problemas** si algún icono no funciona
