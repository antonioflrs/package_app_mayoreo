# flutter_package_app_mayoreo

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-blue.svg)](https://flutter.dev/)
[![Version](https://img.shields.io/badge/version-0.0.1-orange.svg)](https://pub.dev/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

Un paquete de Flutter que proporciona un sistema de diseño completo para aplicaciones móviles, incluyendo componentes UI reutilizables, iconos personalizados, paleta de colores y tipografía consistente.

## 🎯 Características

- ✅ **Componentes UI predefinidos** (botones, campos de texto)
- ✅ **Biblioteca de iconos SVG** personalizados
- ✅ **Sistema de colores consistente**
- ✅ **Tipografía optimizada**
- ✅ **Tema Material 3 integrado**
- ✅ **Fácil de usar y personalizar**
- ✅ **BLoCs para gestión de estado**

## 📦 Instalación

### 1. Agregar Dependencia

Agrega la dependencia a tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter_package_app_mayoreo: ^0.0.1
```

### 2. Instalar Dependencias

```bash
flutter pub get
```

### 3. Importar el Paquete

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
```

## ⚙️ Configuración Inicial

### Configuración Básica (Recomendada)

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

## 🧩 Componentes Disponibles

### UiButton

Botón estandarizado con diferentes tipos y tamaños.

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

**Tipos disponibles:**
- `UiButtonType.primary` - Botón principal (naranja)
- `UiButtonType.secondary` - Botón secundario (contorno)
- `UiButtonType.text` - Botón de texto
- `UiButtonType.destructive` - Botón destructivo (rojo)

**Tamaños disponibles:**
- `UiButtonSize.small` - 32px de altura
- `UiButtonSize.medium` - 40px de altura (por defecto)
- `UiButtonSize.large` - 48px de altura

### AppTextField

Campo de texto personalizado con estados y validación.

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

## 🔧 BLoCs

### BaseBloc

BLoC base para gestión de estado.

```dart
class MyBloc extends BaseBloc {
  // Tu lógica de negocio aquí
}
```

### AuthBloc

BLoC para gestión de autenticación.

```dart
class AuthBloc extends AuthBloc {
  // Lógica de autenticación
}
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

## 📚 Documentación

- [Tutorial Completo](TUTORIAL.md) - Guía detallada de instalación y uso
- [Verificación del Package](PACKAGE_VERIFICATION.md) - Lista completa de componentes y verificación
- [Ejemplos de Código](example/) - Proyecto de ejemplo con implementaciones

## 🧪 Testing

Para probar que el package funciona correctamente:

```bash
# Analizar el código
flutter analyze

# Ejecutar tests
flutter test

# Verificar dependencias
flutter pub get
```

## 📦 Estructura del Package

```
lib/
├── flutter_package_app_mayoreo.dart    # Archivo principal
└── src/
    ├── widgets/                        # Componentes UI
    │   ├── buttons/
    │   │   └── ui_button.dart
    │   ├── inputs/
    │   │   └── app_text_field.dart
    │   ├── custom_svg_icon.dart
    │   └── widgets.dart
    ├── theme/                          # Sistema de diseño
    │   ├── colors/
    │   │   └── app_colors.dart
    │   ├── typography/
    │   │   └── app_typography.dart
    │   ├── icons/
    │   │   └── app_icons.dart
    │   ├── app_theme.dart
    │   └── theme.dart
    ├── icons/                          # Iconos SVG
    │   └── icons.dart
    └── blocs/                          # Gestión de estado
        ├── base/
        │   └── base_bloc.dart
        ├── auth/
        │   └── auth_bloc.dart
        └── blocs.dart

assets/
├── fonts/                              # Fuentes personalizadas
│   ├── Inter-Light.ttf
│   ├── Inter-Regular.ttf
│   ├── Inter-Medium.ttf
│   ├── Inter-SemiBold.ttf
│   └── Inter-Bold.ttf
└── icons/                              # Iconos SVG
    ├── blife/
    ├── filled/
    ├── stroke/
    ├── simbolicos/
    ├── social_media/
    ├── status_pedidos/
    └── pagos/
```

## 🤝 Contribución

Para contribuir al proyecto:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 📞 Soporte

Para reportar problemas o solicitar nuevas características:

1. Revisar la documentación en [TUTORIAL.md](TUTORIAL.md)
2. Verificar el documento de [verificación](PACKAGE_VERIFICATION.md)
3. Contactar al equipo de desarrollo

---

**Desarrollado con ❤️ para la comunidad Flutter**
