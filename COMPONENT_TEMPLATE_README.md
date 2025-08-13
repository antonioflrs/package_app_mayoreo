# ComponentScreenTemplate - Guía de Uso

## Descripción
El `ComponentScreenTemplate` es un widget reutilizable que proporciona una estructura consistente para mostrar información completa de cualquier componente de la aplicación. Está basado en la estructura existente de `search_bar_content.dart` pero es completamente configurable y reutilizable.

## Características Principales

### ✅ **Estructura Completa**
- **Header**: Título y descripción del componente
- **Ejemplos**: Vista previa y código con tabs intercambiables
- **Propiedades**: Lista expandible de propiedades del componente
- **Métodos**: Lista expandible de métodos disponibles
- **Notas de Uso**: Información adicional y mejores prácticas

### ✅ **Interactividad**
- **Tabs**: Cambio entre vista previa y código
- **Secciones Expandibles**: Propiedades, métodos y notas se pueden expandir/contraer
- **Código Copiable**: Botón para copiar código al portapapeles
- **Responsive**: Se adapta a diferentes tamaños de pantalla

### ✅ **Personalización**
- **Colores**: Usa el sistema de colores de la app
- **Tipografía**: Aplica la tipografía configurada (InterVariable + OpenType)
- **Iconos**: Iconos contextuales para cada sección
- **Estilos**: Consistente con el diseño de la aplicación

## Uso Básico

```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class MiComponenteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Mi Componente',
      componentDescription: 'Descripción del componente...',
      examples: [
        ComponentExample(
          id: 'basic',
          title: 'Uso Básico',
          description: 'Descripción del ejemplo...',
          previewWidget: MiWidget(),
          codeExample: 'MiWidget()',
        ),
      ],
    );
  }
}
```

## Parámetros del Template

### **Requeridos**
- `componentTitle`: Título principal del componente
- `componentDescription`: Descripción detallada del componente
- `examples`: Lista de ejemplos de uso

### **Opcionales**
- `properties`: Lista de propiedades del componente
- `methods`: Lista de métodos disponibles
- `usageNotes`: Notas adicionales de uso

## Modelos de Datos

### ComponentExample
```dart
ComponentExample(
  id: 'unique_id',           // ID único para el estado
  title: 'Título',           // Título del ejemplo
  description: 'Descripción', // Descripción del ejemplo
  previewWidget: Widget(),    // Widget de vista previa
  codeExample: 'Código',     // Código de ejemplo
)
```

### ComponentProperty
```dart
ComponentProperty(
  name: 'propertyName',      // Nombre de la propiedad
  type: 'String',            // Tipo de dato
  description: 'Descripción', // Descripción de la propiedad
  required: true,            // Si es requerida
  defaultValue: 'default',   // Valor por defecto (opcional)
)
```

### ComponentMethod
```dart
ComponentMethod(
  name: 'methodName',        // Nombre del método
  returnType: 'void',        // Tipo de retorno
  description: 'Descripción', // Descripción del método
  parameters: ['param1'],    // Lista de parámetros
)
```

## Ejemplo Completo

```dart
ComponentScreenTemplate(
  componentTitle: 'SearchBarWidget',
  componentDescription: 'Widget de búsqueda con autocompletado y resultados dinámicos.',
  
  examples: [
    ComponentExample(
      id: 'basic_usage',
      title: 'Uso Básico',
      description: 'Barra de búsqueda con funcionalidad básica.',
      previewWidget: SearchBarWidget(
        onChanged: (query) => print(query),
      ),
      codeExample: '''SearchBarWidget(
  onChanged: (query) => print(query),
)''',
    ),
  ],
  
  properties: [
    ComponentProperty(
      name: 'onChanged',
      type: 'ValueChanged<String>',
      description: 'Callback que se ejecuta cuando cambia el texto.',
      required: true,
    ),
    ComponentProperty(
      name: 'hintText',
      type: 'String?',
      description: 'Texto de ayuda que se muestra en la barra.',
      required: false,
      defaultValue: 'Buscar...',
    ),
  ],
  
  methods: [
    ComponentMethod(
      name: 'build',
      returnType: 'Widget',
      description: 'Construye el widget de la barra de búsqueda.',
      parameters: ['BuildContext context'],
    ),
  ],
  
  usageNotes: '''
• Usar onChanged para manejar la entrada del usuario
• El hintText es opcional pero mejora la UX
• Considerar agregar un debounce para búsquedas en tiempo real
  ''',
)
```

## Migración desde Contenido Existente

### **Antes (search_bar_content.dart)**
```dart
class SearchBarContent extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionTitle(theme, 'Barra de Búsqueda'),
        Text('Descripción...'),
        _buildBasicUsage(theme),
        _buildWithCustomHint(theme),
        // ... más métodos
      ],
    );
  }
  
  Widget _buildBasicUsage(ThemeData theme) {
    // Lógica compleja para cada ejemplo
  }
}
```

### **Después (usando ComponentScreenTemplate)**
```dart
class SearchBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Barra de Búsqueda',
      componentDescription: 'Descripción...',
      examples: [
        ComponentExample(
          id: 'basic',
          title: 'Uso Básico',
          description: 'Descripción del ejemplo...',
          previewWidget: SearchBarWidget(),
          codeExample: 'SearchBarWidget()',
        ),
        // ... más ejemplos
      ],
    );
  }
}
```

## Ventajas del Template

### 🚀 **Desarrollo Rápido**
- No más código repetitivo para cada componente
- Estructura consistente en toda la aplicación
- Fácil mantenimiento y actualizaciones

### 🎨 **Diseño Consistente**
- Misma apariencia para todos los componentes
- Usa el sistema de diseño de la app
- Responsive y accesible

### 📚 **Documentación Mejorada**
- Estructura clara y organizada
- Fácil navegación entre ejemplos
- Código copiable para desarrolladores

### 🔧 **Mantenimiento Simplificado**
- Cambios centralizados en un solo lugar
- Menos archivos para mantener
- Consistencia automática

## Mejores Prácticas

1. **IDs Únicos**: Usar IDs únicos para cada ejemplo
2. **Descripciones Claras**: Escribir descripciones concisas pero informativas
3. **Ejemplos Reales**: Usar ejemplos que reflejen casos de uso reales
4. **Código Limpio**: Mantener el código de ejemplo simple y legible
5. **Propiedades Completas**: Documentar todas las propiedades importantes
6. **Notas Útiles**: Incluir notas que ayuden a los desarrolladores

## Archivos Relacionados

- `lib/src/widgets/component_content/screen_template.dart` - Template principal
- `lib/src/widgets/component_content/example_usage_template.dart` - Ejemplo de uso
- `lib/src/widgets/component_content/search_bar_content.dart` - Implementación original
- `COMPONENT_TEMPLATE_README.md` - Esta documentación
