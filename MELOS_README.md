# Configuración de Melos para flutter_package_app_mayoreo

Este proyecto está configurado con [Melos](https://melos.invertase.dev/) para gestionar el monorepo de Flutter.

## Instalación

1. Instala Melos globalmente:
```bash
dart pub global activate melos
```

2. Bootstrap el workspace:
```bash
melos bootstrap
```

## Comandos disponibles

### Comandos generales
- `melos analyze` - Analiza todos los paquetes
- `melos test` - Ejecuta tests en todos los paquetes
- `melos build` - Construye todos los paquetes
- `melos format` - Formatea todos los archivos Dart
- `melos pub-get` - Obtiene dependencias para todos los paquetes
- `melos clean` - Limpia todos los paquetes

### Comandos específicos del ejemplo
- `melos run example` - Ejecuta la aplicación de ejemplo
- `melos run example:build` - Construye la aplicación de ejemplo
- `melos run example:test` - Ejecuta tests de la aplicación de ejemplo

### Comandos de publicación
- `melos run publish` - Publica el paquete principal a pub.dev
- `melos run version` - Versiona todos los paquetes

### Comandos de gestión
- `melos run bootstrap` - Bootstrap del workspace
- `melos list` - Lista todos los paquetes
- `melos exec -- "comando"` - Ejecuta un comando en todos los paquetes

## Estructura del proyecto

```
flutter_package_app_mayoreo/
├── lib/                    # Código fuente del paquete principal
├── example/               # Aplicación de ejemplo
├── test/                  # Tests del paquete principal
├── melos.yaml            # Configuración de Melos
└── pubspec.yaml          # Dependencias del paquete principal
```

## Workflow de desarrollo

1. **Iniciar desarrollo:**
   ```bash
   melos bootstrap
   melos pub-get
   ```

2. **Ejecutar la aplicación de ejemplo:**
   ```bash
   melos run example
   ```

3. **Ejecutar tests:**
   ```bash
   melos test
   ```

4. **Analizar código:**
   ```bash
   melos analyze
   ```

5. **Formatear código:**
   ```bash
   melos format
   ```

## Configuración de IDE

Melos está configurado para trabajar con:
- **IntelliJ IDEA / Android Studio** - Habilitado
- **VS Code** - Habilitado

## Versionado

El proyecto usa versionado automático con Melos. Para crear una nueva versión:

```bash
melos version
```

Esto actualizará automáticamente:
- Versiones en `pubspec.yaml`
- CHANGELOG.md
- Tags de Git

## Publicación

Para publicar el paquete a pub.dev:

```bash
melos run publish
```

**Nota:** Asegúrate de estar autenticado con `dart pub login` antes de publicar. 