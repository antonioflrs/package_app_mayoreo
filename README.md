# Flutter Package App Mayoreo

Un package de Flutter que proporciona componentes de UI, iconos y temas para aplicaciones de mayoreo.

## 📦 Instalación

### Paso 1: Agregar la dependencia

En tu `pubspec.yaml`, agrega la dependencia:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_package_app_mayoreo:
    path: ../flutter_package_app_mayoreo  # Para desarrollo local
    # O usar la versión publicada cuando esté disponible
    # version: ^0.0.1
```

### Paso 2: Instalar dependencias

```bash
flutter pub get
```

### Paso 3: Configurar assets (opcional)

Si necesitas acceder directamente a los assets del package, agrégalos a tu `pubspec.yaml`:

```yaml
flutter:
  assets:
    - packages/flutter_package_app_mayoreo/assets/icons/blife/
    - packages/flutter_package_app_mayoreo/assets/icons/filled/
    - packages/flutter_package_app_mayoreo/assets/icons/stroke/
    - packages/flutter_package_app_mayoreo/assets/icons/social/
    - packages/flutter_package_app_mayoreo/assets/icons/custom/
    - packages/flutter_package_app_mayoreo/assets/icons/others/
    - packages/flutter_package_app_mayoreo/assets/fonts/
```

## 🎨 Configuración del Tema

### Paso 4: Aplicar el tema en tu app

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Mayoreo',
      theme: FlutterPackageAppMayoreo.theme, // Aplica el tema del package
      home: const MyHomePage(),
    );
  }
}
```

## 🚀 Uso de Componentes

### Ejemplo 1: Bottom Navigation Bar

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: MobileNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const Center(child: Text('Página de Inicio'));
      case 1:
        return const Center(child: Text('Página de Categorías'));
      case 2:
        return const Center(child: Text('Página del Carrito'));
      default:
        return const Center(child: Text('Página de Inicio'));
    }
  }
}
```

### Ejemplo 2: Uso del icono B Toolkit Copia

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Iconos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Usando SafeSvgIcon
            SafeSvgIcon(
              iconPath: PackageIcons.bToolkitCopia,
              height: 64.0,
              width: 64.0,
            ),
            const SizedBox(height: 20),
            const Text('B Toolkit Copia Icon'),
            
            const SizedBox(height: 40),
            
            // Usando PackageIcon (nueva API)
            PackageIcon(
              iconPath: PackageIcons.bToolkitCopia,
              size: 48.0,
              color: AppColors.orangeBrand,
            ),
            const SizedBox(height: 20),
            const Text('B Toolkit Copia con color personalizado'),
          ],
        ),
      ),
    );
  }
}
```

### Ejemplo 3: Sidebar Navigation

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SidebarExample extends StatefulWidget {
  const SidebarExample({super.key});

  @override
  State<SidebarExample> createState() => _SidebarExampleState();
}

class _SidebarExampleState extends State<SidebarExample> {
  String _searchQuery = '';
  NavigationItem? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Sidebar'),
      ),
      drawer: SidebarNavigation(
        selectedItem: _selectedItem,
        searchQuery: _searchQuery,
        onSearchChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
        onItemSelected: (item) {
          setState(() {
            _selectedItem = item;
          });
          Navigator.pop(context); // Cerrar drawer
        },
      ),
      body: Center(
        child: Text(
          _selectedItem != null 
            ? 'Seleccionado: ${_selectedItem!.title}'
            : 'Selecciona un elemento del sidebar',
        ),
      ),
    );
  }
}
```

### Ejemplo 4: Botones del Package

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Botones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            UiButton(
              label: 'Botón Primario',
              onPressed: () {
                print('Botón presionado');
              },
            ),
            const SizedBox(height: 16),
            UiButton(
              label: 'Botón con Loading',
              onPressed: () async {
                // Simular operación asíncrona
                await Future.delayed(const Duration(seconds: 2));
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎯 Componentes Disponibles

### Widgets de Navegación
- `MobileNavigation` - Bottom navigation bar personalizado
- `SidebarNavigation` - Navegación lateral con búsqueda
- `AppBarWidget` - App bar personalizado
- `SearchBarWidget` - Barra de búsqueda con resultados
- `SearchResultsWidget` - Widget para mostrar resultados de búsqueda
- `MobileCard` - Tarjeta móvil personalizada

### Widgets Básicos
- `UiButton` - Botón personalizado con estados de loading
- `AppTextField` - Campo de texto personalizado
- `SafeSvgIcon` - Icono SVG seguro con manejo de errores
- `PackageIcon` - Nueva API para iconos del package

### Componentes de Contenido
- `BottomNavigationContent` - Contenido de ejemplo para bottom navigation
- `ButtonsContent` - Contenido de ejemplo para botones
- `ColorsContent` - Contenido de ejemplo para colores
- `IconsContent` - Contenido de ejemplo para iconos
- `TypographyContent` - Contenido de ejemplo para tipografía
- Y muchos más componentes de ejemplo...

### Temas
- `FlutterPackageAppMayoreo.theme` - Tema principal
- `FlutterPackageAppMayoreo.colorScheme` - Esquema de colores
- `FlutterPackageAppMayoreo.textTheme` - Tema de texto
- `FlutterPackageAppMayoreo.iconTheme` - Tema de iconos

### Modelos y Servicios
- `NavigationItem` - Modelo para elementos de navegación
- `SearchResult` - Modelo para resultados de búsqueda
- `SearchService` - Servicio de búsqueda
- `DesignSystemData` - Datos del sistema de diseño

### Iconos Disponibles
- **BLife Icons**: `bToolkitCopia`, `blifeLogoActivo`, `blifeLogoInactivo`
- **Filled Icons**: `userActivo`, `cartActivo`, `categoriesActivo`, etc.
- **Stroke Icons**: `userInactivo`, `cartInactivo`, `categoriesInactive`, etc.
- **Social Icons**: `whatsappLogo`
- **Custom Icons**: `promotions`, `iconFlutter`

## 🔧 Actualización del Package

### Para el equipo de desarrollo:

1. **Hacer cambios en el package**:
   ```bash
   cd flutter_package_app_mayoreo
   # Realizar cambios en el código
   ```

2. **Actualizar la versión** en `pubspec.yaml`:
   ```yaml
   version: 0.0.3  # Incrementar versión
   ```

3. **Publicar cambios** (si es un package privado):
   ```bash
   flutter pub publish
   ```

4. **En el proyecto que usa el package**:
   ```bash
   flutter pub upgrade flutter_package_app_mayoreo
   ```

## 📝 Notas Importantes

- Todos los iconos deben usar `SafeSvgIcon` o `PackageIcon` para consistencia
- Los assets están organizados por categorías en el package
- El tema incluye la fuente Inter con diferentes pesos
- Los colores están definidos en `AppColors` para consistencia

## 🐛 Solución de Problemas

Si los iconos no se muestran:
1. Verifica que `flutter_svg` esté en las dependencias
2. Asegúrate de que los assets estén correctamente referenciados
3. Usa `SafeSvgIcon` para mejor manejo de errores

Para más ejemplos, revisa la carpeta `example/` del package.
