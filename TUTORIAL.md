# Tutorial: flutter_package_app_mayoreo

## 📋 Tabla de Contenidos

1. [Introducción](#introducción)
2. [Instalación](#instalación)
3. [Configuración Inicial](#configuración-inicial)
4. [Componentes Disponibles](#componentes-disponibles)
5. [Sistema de Colores](#sistema-de-colores)
6. [Tipografía](#tipografía)
7. [Iconos](#iconos)
8. [Ejemplos Prácticos](#ejemplos-prácticos)
9. [Mejores Prácticas](#mejores-prácticas)
10. [Solución de Problemas](#solución-de-problemas)

## 🎯 Introducción

`flutter_package_app_mayoreo` es un paquete de Flutter que proporciona un sistema de diseño completo para aplicaciones móviles.

### Características Principales

- ✅ Componentes UI predefinidos (botones, campos de texto)
- ✅ Biblioteca de iconos SVG personalizados
- ✅ Sistema de colores consistente
- ✅ Tipografía optimizada
- ✅ Tema Material 3 integrado
- ✅ Fácil de usar y personalizar

### Versión Actual
- **Versión:** 0.0.1
- **Flutter SDK:** ^3.8.1

## 🚀 Instalación

### Paso 1: Agregar Dependencia

```yaml
dependencies:
  flutter_package_app_mayoreo: ^0.0.1
```

### Paso 2: Instalar Dependencias

```bash
flutter pub get
```

### Paso 3: Importar el Paquete

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
```

## ⚙️ Configuración Inicial

### Configurar el Tema Principal

El paquete `flutter_package_app_mayoreo` proporciona un tema completo y preconfigurado que incluye colores, tipografía, iconos y otros elementos de diseño. Aquí te mostramos las diferentes formas de configurarlo:

#### 1. Configuración Básica (Recomendada)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: FlutterPackageAppMayoreo.theme, // Tema completo preconfigurado
      home: MyHomePage(),
    );
  }
}
```

#### 2. Configuración Personalizada

Si necesitas personalizar solo ciertos aspectos del tema:

```dart
MaterialApp(
  title: 'Mi Aplicación',
  theme: ThemeData(
    // Usar el esquema de colores del paquete
    colorScheme: FlutterPackageAppMayoreo.colorScheme,
    
    // Usar la tipografía del paquete
    textTheme: FlutterPackageAppMayoreo.textTheme,
    
    // Usar el tema de iconos del paquete
    iconTheme: FlutterPackageAppMayoreo.iconTheme,
    
    // Personalizar otros aspectos
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: AppTypography.titleLarge?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: AppColors.orangeBrand,
      ),
    ),
    
    // Personalizar el tema de tarjetas
    cardTheme: CardTheme(
      color: AppColors.backCards,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
        ),
      ),
    ),
  ),
  home: MyHomePage(),
)
```

#### 3. Configuración con Tema Personalizado Extendido

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: _buildCustomTheme(),
      home: MyHomePage(),
    );
  }

  ThemeData _buildCustomTheme() {
    // Obtener el tema base del paquete
    final baseTheme = FlutterPackageAppMayoreo.theme;
    
    // Extender y personalizar el tema
    return baseTheme.copyWith(
      // Personalizar AppBar
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.headlineSmall?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: AppColors.orangeBrand,
          size: 24,
        ),
      ),
      
      // Personalizar FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.orangeBrand,
        foregroundColor: AppColors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      // Personalizar BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.orangeBrand,
        unselectedItemColor: AppColors.grayMedium,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Personalizar InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.silverGrayMedium),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.silverGrayMedium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.orangeBrand, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.digitalRed),
        ),
        labelStyle: AppTypography.labelMedium?.copyWith(
          color: AppColors.grayMedium,
        ),
        hintStyle: AppTypography.bodyMedium?.copyWith(
          color: AppColors.grayMedium,
        ),
      ),
      
      // Personalizar ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orangeBrand,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: AppTypography.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Personalizar OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.orangeBrand,
          side: BorderSide(color: AppColors.orangeBrand),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: AppTypography.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Personalizar TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.orangeBrand,
          textStyle: AppTypography.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
```

#### 4. Configuración con Tema Dinámico

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: _isDarkMode ? _buildDarkTheme() : _buildLightTheme(),
      home: MyHomePage(
        onThemeChanged: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return FlutterPackageAppMayoreo.theme.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  ThemeData _buildDarkTheme() {
    return FlutterPackageAppMayoreo.theme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkGray,
        foregroundColor: AppColors.white,
      ),
    );
  }
}
```

#### 5. Acceso a Elementos del Tema

```dart
// En cualquier widget, puedes acceder a los elementos del tema:

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      color: theme.colorScheme.primary, // AppColors.orangeBrand
      child: Text(
        'Mi texto',
        style: theme.textTheme.bodyLarge, // AppTypography.bodyLarge
      ),
    );
  }
}
```

#### 6. Verificación de la Configuración

Para verificar que el tema se ha configurado correctamente:

```dart
class ThemeTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Test del Tema'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Colores del Tema:',
              style: AppTypography.headlineSmall,
            ),
            SizedBox(height: 16),
            Container(
              width: 100,
              height: 50,
              color: theme.colorScheme.primary,
              child: Center(
                child: Text(
                  'Primary',
                  style: TextStyle(color: theme.colorScheme.onPrimary),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tipografía:',
              style: AppTypography.headlineSmall,
            ),
            Text('Headline Large', style: AppTypography.headlineLarge),
            Text('Body Medium', style: AppTypography.bodyMedium),
            Text('Label Small', style: AppTypography.labelSmall),
            SizedBox(height: 24),
            UiButton(
              onPressed: () {},
              label: 'Botón de Prueba',
              type: UiButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🧩 Componentes Disponibles

### UiButton

Botón estandarizado con diferentes tipos y tamaños.

#### Tipos Disponibles
- **Primary**: Botón principal (naranja)
- **Secondary**: Botón secundario (contorno)
- **Text**: Botón de texto
- **Destructive**: Botón destructivo (rojo)

#### Ejemplo de Uso

```dart
// Botón primario básico
UiButton(
  onPressed: () {
    print('Botón presionado');
  },
  label: 'Mi Botón',
  type: UiButtonType.primary,
)

// Botón secundario con icono
UiButton(
  onPressed: () {},
  label: 'Guardar',
  type: UiButtonType.secondary,
  icon: Icons.save,
  iconPosition: UiButtonIconPosition.start,
)

// Botón con estado de carga
UiButton(
  onPressed: () {},
  label: 'Procesando...',
  isLoading: true,
  type: UiButtonType.primary,
)
```

### AppTextField

Campo de texto personalizado con estados y validación.

#### Ejemplo de Uso

```dart
// Campo de texto básico
AppTextField(
  labelText: 'Email',
  hintText: 'ejemplo@correo.com',
  prefixIcon: Icon(Icons.email),
)

// Campo de contraseña
AppTextField(
  labelText: 'Contraseña',
  hintText: 'Ingresa tu contraseña',
  obscureText: true,
  prefixIcon: Icon(Icons.lock),
)

// Campo con validación
AppTextField(
  labelText: 'Teléfono',
  hintText: '+52 123 456 7890',
  keyboardType: TextInputType.phone,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'El teléfono es requerido';
    }
    return null;
  },
)
```

## 🎨 Sistema de Colores

### Colores Principales

```dart
// Colores de marca
AppColors.orangeBrand    // #e1a141 - Naranja principal
AppColors.ochreBrand     // #c79022 - Ocre
AppColors.oliveBrand     // #84861c - Oliva

// Colores de fondo
AppColors.backCards      // #f1f0ec - Fondo de tarjetas
AppColors.softGray       // #f9f9f9 - Gris suave
AppColors.mysticGray     // #dde5e8 - Gris místico

// Colores de texto
AppColors.black          // #232323 - Negro
AppColors.white          // #ffffff - Blanco
AppColors.darkGray       // #3d3d3d - Gris oscuro
AppColors.grayMedium     // #a7adba - Gris medio
```

### Uso de Colores

```dart
Container(
  color: AppColors.backCards,
  child: Text(
    'Mi texto',
    style: TextStyle(
      color: AppColors.orangeBrand,
    ),
  ),
)
```

## 📝 Tipografía

### Estilos Disponibles

```dart
// Encabezados
AppTypography.headlineLarge
AppTypography.headlineMedium
AppTypography.headlineSmall

// Cuerpo de texto
AppTypography.bodyLarge
AppTypography.bodyMedium
AppTypography.bodySmall

// Etiquetas
AppTypography.labelLarge
AppTypography.labelMedium
AppTypography.labelSmall
```

### Uso de Tipografía

```dart
Text(
  'Título Principal',
  style: AppTypography.headlineLarge,
)

Text(
  'Texto del cuerpo',
  style: AppTypography.bodyMedium,
)
```

## 🎯 Iconos

### Iconos de Material Design

```dart
// Iconos de navegación
Icon(Icons.menu)
Icon(Icons.arrow_back)
Icon(Icons.keyboard_arrow_down)

// Iconos de usuario
Icon(Icons.person)
Icon(Icons.account_circle)

// Iconos de pedidos
Icon(Icons.shopping_cart)
Icon(Icons.shopping_bag)

// Iconos de categorías
Icon(Icons.category)
Icon(Icons.list)
```

### Uso de Iconos

```dart
Icon(
  Icons.menu,
  size: 24,
  color: AppColors.orangeBrand,
)
```

## 💡 Ejemplos Prácticos

### Formulario de Login

```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'ejemplo@correo.com',
            prefixIcon: Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El email es requerido';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          AppTextField(
            controller: _passwordController,
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            obscureText: true,
            prefixIcon: Icon(Icons.lock),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La contraseña es requerida';
              }
              return null;
            },
          ),
          SizedBox(height: 24),
          UiButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Procesar login
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              }
            },
            label: 'Iniciar Sesión',
            type: UiButtonType.primary,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
```

### Tarjeta de Producto

```dart
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final VoidCallback onAddToCart;

  const ProductCard({
    required this.title,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            price,
            style: AppTypography.bodyLarge?.copyWith(
              color: AppColors.orangeBrand,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          UiButton(
            onPressed: onAddToCart,
            label: 'Agregar al carrito',
            type: UiButtonType.primary,
            icon: Icons.shopping_cart,
            iconPosition: UiButtonIconPosition.start,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
```

## ✅ Mejores Prácticas

### 1. Uso Consistente de Colores

```dart
// ✅ Correcto
Container(
  color: AppColors.backCards,
  child: Text(
    'Texto',
    style: TextStyle(color: AppColors.orangeBrand),
  ),
)

// ❌ Incorrecto
Container(
  color: Color(0xfff1f0ec),
  child: Text(
    'Texto',
    style: TextStyle(color: Color(0xffe1a141)),
  ),
)
```

### 2. Uso de Tipografía del Sistema

```dart
// ✅ Correcto
Text(
  'Título',
  style: AppTypography.headlineMedium,
)

// ❌ Incorrecto
Text(
  'Título',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ),
)
```

### 3. Validación de Formularios

```dart
// ✅ Correcto
AppTextField(
  labelText: 'Email',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'El campo es requerido';
    }
    return null;
  },
)
```

## 🔧 Solución de Problemas

### Error: "flutter_package_app_mayoreo not found"

**Solución:**
1. Verifica que la dependencia esté en `pubspec.yaml`
2. Ejecuta `flutter pub get`
3. Reinicia tu IDE

### Error: "The method 'copyWith' was called on null"

**Solución:**
```dart
// ✅ Correcto
Text(
  'Texto',
  style: AppTypography.bodyMedium?.copyWith(
    color: AppColors.orangeBrand,
  ) ?? TextStyle(
    color: AppColors.orangeBrand,
  ),
)
```

## 📚 Recursos Adicionales

- [Documentación de Flutter](https://docs.flutter.dev/)
- [Material Design Guidelines](https://material.io/design)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

---

**¡Esperamos que este tutorial te ayude a usar flutter_package_app_mayoreo de manera efectiva!** 🚀
