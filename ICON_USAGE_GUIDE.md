# Guía de Uso de Iconos del Paquete

## 📋 Índice
1. [Importación](#importación)
2. [Tipos de Iconos](#tipos-de-iconos)
3. [Ejemplo 1: Barra de Navegación](#ejemplo-1-barra-de-navegación)
4. [Ejemplo 2: Dashboard de Acciones](#ejemplo-2-dashboard-de-acciones)
5. [Ejemplo 3: Selector de Iconos](#ejemplo-3-selector-de-iconos)
6. [Ejemplo 4: Iconos con Estados](#ejemplo-4-iconos-con-estados)
7. [Mejores Prácticas](#mejores-prácticas)

## 🔧 Importación

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
```

## 🎨 Tipos de Iconos

El paquete incluye iconos organizados en las siguientes categorías:

- **Navegación**: `burgerMenu`, `arrowLeft`, `arrowDown`, `close`, `check`, `plus`, `reset`
- **Usuario**: `userActive`, `userInactive`, `profile`
- **Pedidos y Carrito**: `ordersActive`, `ordersInactive`, `cartActive`, `cartInactive`
- **Categorías y Listas**: `categoriesActive`, `categoriesInactive`, `listActive`, `listInactive`
- **Favoritos**: `favoritesActive`, `favoritesInactive`, `favActive`, `favInactive`
- **Documentos**: `documentActive`, `documentInactive`
- **Tarjetas y Pagos**: `cardActive`, `cardInactive`
- **Ayuda**: `helpActive`, `helpInactive`
- **Ubicación**: `locationActive`, `locationInactive`
- **Comunicación**: `mail`, `share`
- **Acciones**: `delete`, `alert`
- **Sistema de Diseño**: `colors`, `typography`, `shadows`, `spacing`, `breakpoints`, `zIndex`
- **Marca**: `logoMayoreo`, `logoActive`, `logoInactive`, `bToolkit`, `appleLogo`
- **Redes Sociales**: `whatsapp`

## 📱 Ejemplo 1: Barra de Navegación

### Uso Básico
```dart
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
)
```

### Implementación Completa
```dart
Widget _buildNavItem({
  required String icon,
  required String label,
  required bool isActive,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomSvgIcon(
        iconPath: icon,
        width: 24,
        height: 24,
        color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: AppTypography.labelSmall?.copyWith(
          color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    ],
  );
}

// Uso en barra de navegación
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildNavItem(
      icon: SvgIcons.userActive,
      label: 'Perfil',
      isActive: true,
    ),
    _buildNavItem(
      icon: SvgIcons.ordersActive,
      label: 'Pedidos',
      isActive: false,
    ),
    // ... más items
  ],
)
```

## 🎯 Ejemplo 2: Dashboard de Acciones

### Tarjeta de Acción
```dart
Widget _buildActionCard({
  required String icon,
  required String title,
  required String subtitle,
  required Color color,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.silverGrayMedium.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgIcon(
            iconPath: icon,
            width: 32,
            height: 32,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppTypography.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTypography.labelSmall?.copyWith(
              color: AppColors.grayMedium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

// Uso en grid
GridView.count(
  crossAxisCount: 2,
  children: [
    _buildActionCard(
      icon: SvgIcons.documentActive,
      title: 'Documentos',
      subtitle: 'Ver documentos',
      color: AppColors.orangeBrand,
      onTap: () => print('Documentos'),
    ),
    _buildActionCard(
      icon: SvgIcons.cardActive,
      title: 'Pagos',
      subtitle: 'Gestionar pagos',
      color: AppColors.ochreBrand,
      onTap: () => print('Pagos'),
    ),
    // ... más tarjetas
  ],
)
```

## 🎨 Ejemplo 3: Selector de Iconos

### Obtener Iconos por Categoría
```dart
// Obtener todas las categorías
final categories = SvgIcons.getAllIconsByCategory();

// Obtener iconos de una categoría específica
final navigationIcons = categories['Navegación'] ?? [];

// Buscar iconos
final searchResults = SvgIcons.searchIcons('user');
```

### Selector Interactivo
```dart
Widget _buildIconSelector() {
  final categories = SvgIcons.getAllIconsByCategory();
  
  return Column(
    children: [
      // Dropdown para seleccionar categoría
      DropdownButton<String>(
        value: selectedCategory,
        items: categories.keys.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCategory = value!;
          });
        },
      ),
      
      // Grid de iconos
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: categories[selectedCategory]?.length ?? 0,
        itemBuilder: (context, index) {
          final iconPath = categories[selectedCategory]![index];
          return CustomSvgIcon(
            iconPath: iconPath,
            width: 24,
            height: 24,
            color: AppColors.orangeBrand,
          );
        },
      ),
    ],
  );
}
```

## ⚡ Ejemplo 4: Iconos con Estados

### Icono con Estado Activo/Inactivo
```dart
Widget _buildStatefulIcon({
  required String activeIcon,
  required String inactiveIcon,
  required String label,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      bool isActive = false;
      
      return GestureDetector(
        onTap: () {
          setState(() {
            isActive = !isActive;
          });
        },
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: CustomSvgIcon(
                key: ValueKey(isActive),
                iconPath: isActive ? activeIcon : inactiveIcon,
                width: 32,
                height: 32,
                color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
              ),
            ),
            Text(
              label,
              style: AppTypography.labelSmall?.copyWith(
                color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Uso
_buildStatefulIcon(
  activeIcon: SvgIcons.favoritesActive,
  inactiveIcon: SvgIcons.favoritesInactive,
  label: 'Favorito',
)
```

### Icono con Animación de Carga
```dart
Widget _buildLoadingIcon({
  required String icon,
  required String label,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      bool isLoading = false;
      
      return GestureDetector(
        onTap: () {
          setState(() {
            isLoading = !isLoading;
          });
          
          if (isLoading) {
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            });
          }
        },
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isLoading
                  ? SizedBox(
                      key: const ValueKey('loading'),
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.orangeBrand,
                        ),
                      ),
                    )
                  : CustomSvgIcon(
                      key: const ValueKey('icon'),
                      iconPath: icon,
                      width: 32,
                      height: 32,
                      color: AppColors.orangeBrand,
                    ),
            ),
            Text(label),
          ],
        ),
      );
    },
  );
}
```

## ✅ Mejores Prácticas

### 1. **Tamaños Consistentes**
```dart
// ✅ Recomendado
const double iconSize = 24.0;
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: iconSize,
  height: iconSize,
)

// ❌ Evitar
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 23.5, // Tamaños inconsistentes
  height: 25.2,
)
```

### 2. **Colores del Sistema**
```dart
// ✅ Usar colores del sistema
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  color: AppColors.orangeBrand,
)

// ❌ Evitar colores hardcodeados
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  color: Color(0xFFFF6B35), // Hardcodeado
)
```

### 3. **Manejo de Estados**
```dart
// ✅ Estados claros
CustomSvgIcon(
  iconPath: isActive ? SvgIcons.userActive : SvgIcons.userInactive,
  color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
)

// ❌ Estados confusos
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  color: isActive ? Colors.orange : Colors.grey, // No usar colores del sistema
)
```

### 4. **Accesibilidad**
```dart
// ✅ Con semántica
Semantics(
  label: 'Botón de usuario',
  child: CustomSvgIcon(
    iconPath: SvgIcons.userActive,
    width: 24,
    height: 24,
  ),
)
```

### 5. **Performance**
```dart
// ✅ Usar const cuando sea posible
const CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
)

// ✅ Usar AnimatedSwitcher para transiciones suaves
AnimatedSwitcher(
  duration: const Duration(milliseconds: 200),
  child: CustomSvgIcon(
    key: ValueKey(isActive),
    iconPath: isActive ? activeIcon : inactiveIcon,
  ),
)
```

## 🚀 Ejecutar Ejemplos

Para ver estos ejemplos en acción:

1. **Ejemplo Básico**:
   ```bash
   cd example
   flutter run
   # Navegar a IconExamples
   ```

2. **Ejemplo Avanzado**:
   ```bash
   cd example
   flutter run
   # Navegar a AdvancedIconExamples
   ```

## 📚 Recursos Adicionales

- [Documentación del Widget CustomSvgIcon](lib/src/widgets/custom_svg_icon.dart)
- [Biblioteca de Iconos](lib/src/icons/app_icons.dart)
- [Ejemplos de Integración](example/lib/test_package_integration.dart)
