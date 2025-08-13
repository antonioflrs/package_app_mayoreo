# Widget de Tabs - Guía de Uso

## Descripción
El widget de tabs personalizable que sigue el sistema de diseño de la aplicación. Soporta estados activo/inactivo, items dinámicos y botón de agregar nuevas pestañas.

## Características Principales

### ✅ **Estados Visuales**
- **Tab Activa**: Fondo blanco, borde naranja, sombra sutil
- **Tab Inactiva**: Fondo transparente, borde gris claro
- **Transiciones**: Cambios suaves entre estados

### ✅ **Funcionalidades**
- **Selección**: Callback cuando se cambia de tab
- **Espaciado**: Personalizable entre tabs
- **Márgenes**: Configurables externos
- **Botón Agregar**: Opcional para tabs dinámicas

### ✅ **Diseño Consistente**
- **Colores**: Usa el sistema de colores de la app
- **Tipografía**: Aplica InterVariable + OpenType
- **Iconos**: Material Design para consistencia
- **Responsive**: Se adapta al contenido

## Widgets Disponibles

### 1. CustomTabsWidget
Widget principal y más flexible para tabs personalizadas.

### 2. PreviewCodeTabs
Widget especializado para alternar entre vista previa y código.

### 3. DynamicTabsWidget
Widget con soporte para agregar/remover tabs dinámicamente.

## Uso Básico

### CustomTabsWidget
```dart
CustomTabsWidget(
  tabs: [
    TabItem(
      id: 'tab1',
      title: 'Primera',
      icon: Icons.star,
      isSelected: true,
    ),
    TabItem(
      id: 'tab2',
      title: 'Segunda',
      icon: Icons.favorite,
      isSelected: false,
    ),
  ],
  onTabChanged: (tabId) {
    // Manejar cambio de tab
    print('Tab seleccionada: $tabId');
  },
)
```

### PreviewCodeTabs
```dart
PreviewCodeTabs(
  showPreview: _showPreview,
  onPreviewTap: () => setState(() => _showPreview = true),
  onCodeTap: () => setState(() => _showPreview = false),
)
```

### DynamicTabsWidget
```dart
DynamicTabsWidget(
  initialTabs: [
    TabItem(id: 'tab1', title: 'Pestaña 1', icon: Icons.home),
    TabItem(id: 'tab2', title: 'Pestaña 2', icon: Icons.settings),
  ],
  showAddButton: true,
  onTabAdded: () {
    // Manejar nueva tab agregada
  },
  contentBuilder: (tabId) => Text('Contenido: $tabId'),
)
```

## Modelo TabItem

```dart
class TabItem {
  final String id;           // ID único de la tab
  final String title;        // Título visible
  final IconData icon;       // Icono de la tab
  final bool isSelected;     // Estado de selección
  final VoidCallback? onTap; // Callback personalizado
}
```

## Parámetros de Configuración

### CustomTabsWidget
- **tabs**: Lista de TabItem (requerido)
- **margin**: Márgenes externos (opcional)
- **spacing**: Espaciado entre tabs (opcional, default: 8)
- **onTabChanged**: Callback de cambio (opcional)
- **showAddButton**: Mostrar botón agregar (opcional, default: false)
- **onAddTab**: Callback del botón agregar (opcional)
- **addButtonTooltip**: Tooltip del botón agregar (opcional)

### PreviewCodeTabs
- **showPreview**: Estado de vista previa (requerido)
- **onPreviewTap**: Callback vista previa (requerido)
- **onCodeTap**: Callback código (requerido)
- **margin**: Márgenes externos (opcional)

### DynamicTabsWidget
- **initialTabs**: Tabs iniciales (requerido)
- **contentBuilder**: Constructor de contenido (requerido)
- **showAddButton**: Mostrar botón agregar (opcional)
- **tabBuilder**: Constructor de nuevas tabs (opcional)
- **onTabAdded**: Callback tab agregada (opcional)
- **onTabRemoved**: Callback tab removida (opcional)

## Ejemplos de Uso

### Tabs con Espaciado Personalizado
```dart
CustomTabsWidget(
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  spacing: 16,
  tabs: [
    TabItem(
      id: 'info',
      title: 'Información',
      icon: Icons.info,
      isSelected: true,
    ),
    TabItem(
      id: 'config',
      title: 'Configuración',
      icon: Icons.tune,
      isSelected: false,
    ),
  ],
)
```

### Tabs con Botón Agregar
```dart
CustomTabsWidget(
  tabs: tabs,
  showAddButton: true,
  onAddTab: () {
    // Lógica para agregar nueva tab
    setState(() {
      tabs.add(TabItem(
        id: 'new_tab',
        title: 'Nueva Tab',
        icon: Icons.add,
      ));
    });
  },
)
```

### Tabs Dinámicas con Contenido
```dart
DynamicTabsWidget(
  initialTabs: [
    TabItem(id: 'home', title: 'Inicio', icon: Icons.home),
    TabItem(id: 'profile', title: 'Perfil', icon: Icons.person),
  ],
  showAddButton: true,
  contentBuilder: (tabId) {
    switch (tabId) {
      case 'home':
        return HomeContent();
      case 'profile':
        return ProfileContent();
      default:
        return Text('Contenido de $tabId');
    }
  },
)
```

## Integración con ComponentScreenTemplate

El widget de tabs se integra perfectamente con el ComponentScreenTemplate:

```dart
ComponentExample(
  id: 'tabs_example',
  title: 'Ejemplo de Tabs',
  description: 'Tabs personalizables con estados activo/inactivo.',
  previewWidget: CustomTabsWidget(
    tabs: [
      TabItem(id: 'tab1', title: 'Tab 1', icon: Icons.star, isSelected: true),
      TabItem(id: 'tab2', title: 'Tab 2', icon: Icons.favorite, isSelected: false),
    ],
  ),
  codeExample: '// Código del ejemplo...',
)
```

## Mejores Prácticas

### 1. **IDs Únicos**
```dart
// ✅ Correcto
TabItem(id: 'user_profile', title: 'Perfil', icon: Icons.person)

// ❌ Incorrecto
TabItem(id: 'tab', title: 'Tab', icon: Icons.tab)
```

### 2. **Iconos Consistentes**
```dart
// ✅ Usar iconos de Material Design
Icons.home, Icons.settings, Icons.person, Icons.info

// ❌ Evitar iconos personalizados no estándar
```

### 3. **Estados de Selección**
```dart
// ✅ Manejar estado correctamente
tabs.map((tab) => tab.copyWith(
  isSelected: tab.id == selectedTabId
)).toList()

// ❌ No hardcodear estados
```

### 4. **Callbacks Responsivos**
```dart
// ✅ Callbacks que actualizan el estado
onTabChanged: (tabId) => setState(() {
  selectedTabId = tabId;
})

// ❌ Callbacks que no actualizan el estado
onTabChanged: (tabId) => print(tabId)
```

## Personalización Avanzada

### Colores Personalizados
```dart
// Extender AppColors si necesitas colores específicos
class CustomAppColors extends AppColors {
  static const Color customTabActive = Color(0xFF4CAF50);
  static const Color customTabInactive = Color(0xFF9E9E9E);
}
```

### Estilos de Texto
```dart
// Personalizar tipografía si es necesario
Text(
  tab.title,
  style: theme.textTheme.bodySmall?.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  ),
)
```

### Animaciones
```dart
// Agregar animaciones personalizadas
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  curve: Curves.easeInOut,
  // ... propiedades del contenedor
)
```

## Archivos Relacionados

- `lib/src/widgets/tabs_widget.dart` - Implementación principal
- `lib/src/widgets/component_content/tabs_content.dart` - Ejemplos de uso
- `lib/src/widgets/widgets.dart` - Exportaciones
- `TABS_WIDGET_README.md` - Esta documentación

## Verificación

- ✅ **Análisis estático**: Sin errores
- ✅ **Funcionalidad**: Tabs activo/inactivo funcionando
- ✅ **Diseño**: Consistente con el sistema de la app
- ✅ **Documentación**: Ejemplos y guías completas
- ✅ **Integración**: Compatible con ComponentScreenTemplate

**El widget de tabs está listo para usar y proporciona una base sólida para navegación por pestañas en toda la aplicación.**
