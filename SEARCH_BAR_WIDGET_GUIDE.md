# SearchBarWidget - Guía de Uso Simplificada

El `SearchBarWidget` es un componente simple y fácil de usar para búsquedas. Mantiene la flexibilidad esencial sin complejidad innecesaria.

## 🎯 **Uso Básico**

```dart
SearchBarWidget(
  onChanged: (value) => print('Buscando: $value'),
)
```

## 📐 **Personalización de Dimensiones**

```dart
SearchBarWidget(
  width: 300,                    // Ancho fijo
  height: 56,                    // Altura personalizada
  cornerRadius: 28,              // Radio de esquina
  margin: EdgeInsets.all(20),    // Margen personalizado
  onChanged: (value) {},
)
```

## 🎨 **Personalización de Colores**

```dart
SearchBarWidget(
  backgroundColor: Colors.blue[50],
  borderColor: Colors.blue[200],
  textColor: Colors.blue[900],
  hintColor: Colors.blue[400],
  iconColor: Colors.blue[600],
  onChanged: (value) {},
)
```



## 🎭 **Personalización de Iconos**

### Icono SVG Personalizado
```dart
SearchBarWidget(
  iconPath: 'assets/icons/stroke/search_icon.svg',
  iconColor: Colors.red,
  onChanged: (value) {},
)
```

### Icono Personalizado (Widget)
```dart
SearchBarWidget(
  customIcon: Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(Icons.search, color: Colors.white, size: 20),
  ),
  onChanged: (value) {},
)
```

### Sin Icono
```dart
SearchBarWidget(
  showIcon: false,
  onChanged: (value) {},
)
```

## ⚡ **Funcionalidad Básica**

```dart
SearchBarWidget(
  controller: TextEditingController(),
  enabled: true,
  onChanged: (value) {},
)
```

## 🎨 **Ejemplos de Diseño**

### Buscador Básico
```dart
SearchBarWidget(
  onChanged: (value) {},
)
```

### Buscador Elegante
```dart
SearchBarWidget(
  height: 56,
  cornerRadius: 28,
  backgroundColor: Colors.white,
  borderColor: Colors.grey[300],
  iconPath: 'assets/icons/stroke/search_icon.svg',
  onChanged: (value) {},
)
```

### Buscador Compacto
```dart
SearchBarWidget(
  height: 40,
  cornerRadius: 20,
  margin: EdgeInsets.symmetric(horizontal: 8),
  onChanged: (value) {},
)
```

## 🔧 **Callbacks Disponibles**

```dart
SearchBarWidget(
  onChanged: (value) => print('Texto cambiado: $value'),
)
```

## 🎯 **Casos de Uso Comunes**

### Buscador de Productos
```dart
SearchBarWidget(
  hintText: 'Buscar productos...',
  iconPath: 'assets/icons/stroke/search_icon.svg',
  onChanged: (query) => searchProducts(query),
)
```

### Buscador de Usuarios
```dart
SearchBarWidget(
  hintText: 'Buscar usuarios...',
  customIcon: Icon(Icons.person_search),
  onChanged: (query) => searchUsers(query),
)
```

## ⚠️ **Notas Importantes**

1. **Valores por Defecto:** Si no especificas un parámetro, usa los valores del sistema de diseño
2. **Colores:** Usa `AppColors` para consistencia con el tema
3. **Iconos SVG:** Asegúrate de que el archivo existe en la ruta especificada
4. **Performance:** Los iconos SVG se cargan de forma asíncrona con fallback
5. **Simplicidad:** Diseño limpio y fácil de mantener

## 🚀 **Mejores Prácticas**

- Usa `AppColors` para mantener consistencia
- Mantén el `cornerRadius` proporcional a la `height`
- Usa `customIcon` para iconos complejos
- El widget es responsive por defecto 