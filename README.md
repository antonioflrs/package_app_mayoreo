# Flutter Package App Mayoreo

Un paquete de Flutter que proporciona componentes de UI, temas, y arquitectura BLoC para aplicaciones de mayoreo.

## Características

- 🎨 **Temas personalizables** - Soporte para tema claro y oscuro
- 🎯 **Componentes de UI** - Botones, campos de texto y más componentes reutilizables
- 📱 **Arquitectura BLoC** - Manejo de estado con BLoC pattern
- 🎨 **Sistema de colores** - Paleta de colores consistente
- 📝 **Tipografía** - Sistema de tipografía escalable
- 🔧 **Configuración con Melos** - Gestión de monorepo

## Instalación

Agrega la dependencia a tu `pubspec.yaml`:

```yaml
dependencies:
  flutter_package_app_mayoreo: ^0.0.1
```

## Uso

### Configuración del tema

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
      title: 'App Mayoreo',
      theme: FlutterPackageAppMayoreo.lightTheme,
      darkTheme: FlutterPackageAppMayoreo.darkTheme,
      home: MyHomePage(),
    );
  }
}
```

### Uso de componentes

#### Botones

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Botón primario
AppButton(
  onPressed: () => print('Botón presionado'),
  child: Text('Botón Primario'),
  variant: AppButtonVariant.primary,
  size: AppButtonSize.medium,
)

// Botón secundario
AppButton(
  onPressed: () => print('Botón secundario'),
  child: Text('Botón Secundario'),
  variant: AppButtonVariant.secondary,
)

// Botón de texto
AppButton(
  onPressed: () => print('Botón de texto'),
  child: Text('Botón de Texto'),
  variant: AppButtonVariant.text,
)

// Botón con estado de carga
AppButton(
  onPressed: () => print('Botón con carga'),
  child: Text('Cargando...'),
  isLoading: true,
)
```

#### Campos de texto

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Campo de texto básico
AppTextField(
  labelText: 'Email',
  hintText: 'Ingresa tu email',
  keyboardType: TextInputType.emailAddress,
  onChanged: (value) => print('Email: $value'),
)

// Campo de contraseña
AppTextField(
  labelText: 'Contraseña',
  hintText: 'Ingresa tu contraseña',
  obscureText: true,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }
    return null;
  },
)

// Campo con icono
AppTextField(
  labelText: 'Buscar',
  hintText: 'Buscar productos...',
  prefixIcon: Icon(Icons.search),
)
```

### Uso de BLoC

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc _authBloc = AuthBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authBloc.add(const CheckAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: StreamBuilder<AuthState>(
        stream: _authBloc.stateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (state is AuthError) {
            return Center(child: Text(state.errorMessage ?? 'Error'));
          }
          
          if (state is AuthAuthenticated) {
            return Center(child: Text('Bienvenido ${state.user.name}'));
          }
          
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                AppTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Contraseña',
                  obscureText: true,
                ),
                SizedBox(height: 24),
                AppButton(
                  onPressed: () {
                    _authBloc.add(LoginRequested(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ));
                  },
                  child: Text('Iniciar Sesión'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

## Estructura del proyecto

```
lib/
├── flutter_package_app_mayoreo.dart    # Archivo principal
└── src/
    ├── theme/                          # Sistema de temas
    │   ├── app_theme.dart
    │   ├── colors/
    │   │   └── app_colors.dart
    │   ├── typography/
    │   │   └── app_typography.dart
    │   └── icons/
    │       └── app_icons.dart
    ├── widgets/                        # Componentes de UI
    │   ├── buttons/
    │   │   └── app_button.dart
    │   └── inputs/
    │       └── app_text_field.dart
    └── blocs/                          # Arquitectura BLoC
        ├── base/
        │   └── base_bloc.dart
        └── auth/
            └── auth_bloc.dart
```

## Configuración con Melos

Este proyecto usa [Melos](https://melos.invertase.dev/) para gestión del monorepo.

### Comandos disponibles

```bash
# Instalar dependencias
melos bootstrap

# Ejecutar tests
melos test

# Analizar código
melos analyze

# Formatear código
melos format

# Ejecutar aplicación de ejemplo
melos run example

# Publicar paquete
melos run publish
```

## Personalización

### Colores personalizados

```dart
// En tu app
final customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF1976D2),
    brightness: Brightness.light,
  ),
  // ... otras configuraciones
);
```

### Tipografía personalizada

```dart
// En tu app
final customTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    // ... otras configuraciones
  ),
);
```

## Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## Soporte

Si tienes alguna pregunta o necesitas ayuda, por favor abre un issue en el repositorio.
