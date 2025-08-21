# ProductTabsWidget

El widget `ProductTabsWidget` es un componente reutilizable y altamente personalizable para mostrar información de productos organizada en pestañas. Está diseñado para ser dinámico, permitiendo cambiar textos, colores y estilos según las necesidades específicas.

## Características

- **Completamente personalizable**: Colores, tamaños, espaciado y estilos
- **Múltiples variantes**: Widgets predefinidos para diferentes tipos de productos
- **Dinámico**: Cambio de contenido y apariencia en tiempo real
- **Responsive**: Se adapta a diferentes tamaños de pantalla
- **Accesible**: Soporte para navegación por teclado y lectores de pantalla
- **Tipografía InterVariable**: Con características tipográficas específicas

## Variantes Disponibles

### 1. ProductTabsWidget (Básico)
Widget completamente personalizable que permite definir cualquier número de pestañas con contenido personalizado.

```dart
ProductTabsWidget(
  tabs: [
    ProductTab(title: 'Descripción', content: 'Contenido...'),
    ProductTab(title: 'Beneficios', content: 'Beneficios...'),
    ProductTab(title: 'Instrucciones', content: 'Instrucciones...'),
  ],
)
```

### 2. ProductTabsWidgetDefault
Widget predefinido para productos con pestañas de "Modo de Uso" e "Ingredientes".

```dart
ProductTabsWidgetDefault(
  modoDeUso: 'Aplicar según las instrucciones del producto',
  ingredientes: 'Lista de ingredientes naturales y seguros',
)
```

### 3. ProductTabsWidgetWellness
Widget específico para productos de bienestar con pestañas de "Descripción", "Beneficios" y opcionalmente "Contraindicaciones".

```dart
ProductTabsWidgetWellness(
  descripcion: 'Producto natural para el bienestar general',
  beneficios: 'Mejora la salud y vitalidad',
  contraindicaciones: 'Consultar con médico si está embarazada',
)
```

### 4. ProductTabsWidgetCosmetic
Widget para productos cosméticos con pestañas de "Aplicación", "Ingredientes" y opcionalmente "Precauciones".

```dart
ProductTabsWidgetCosmetic(
  aplicacion: 'Aplicar sobre la piel limpia y seca',
  ingredientes: 'Ingredientes cosméticos seguros y naturales',
  precauciones: 'Evitar contacto con los ojos',
)
```

## Propiedades de Personalización

### Colores
| Propiedad | Descripción | Valor por defecto |
|-----------|-------------|-------------------|
| `backgroundColor` | Color de fondo del contenedor principal | `AppColors.softGray` |
| `inactiveTabBackgroundColor` | Color de fondo de pestañas inactivas | `AppColors.white` |
| `activeTabBorderColor` | Color del borde inferior de pestañas activas | `AppColors.orangeBrand` |
| `inactiveTabBorderColor` | Color del borde inferior de pestañas inactivas | `AppColors.silverGrayMedium` |
| `activeTabTextColor` | Color del texto de pestañas activas | `AppColors.black` |
| `inactiveTabTextColor` | Color del texto de pestañas inactivas | `AppColors.grayMedium` |
| `contentTextColor` | Color del texto del contenido | `AppColors.black` |
| `disclaimerTextColor` | Color del texto del disclaimer | `AppColors.grayMedium` |

### Tamaños y Espaciado
| Propiedad | Descripción | Valor por defecto |
|-----------|-------------|-------------------|
| `borderRadius` | Radio de borde del contenedor principal | `12.0` |
| `contentPadding` | Padding del contenido | `EdgeInsets.all(20)` |
| `tabPadding` | Padding de las pestañas | `EdgeInsets.symmetric(vertical: 16)` |
| `tabFontSize` | Tamaño de fuente de las pestañas | `14.0` |
| `contentFontSize` | Tamaño de fuente del contenido | `14.0` |
| `disclaimerFontSize` | Tamaño de fuente del disclaimer | `11.0` |

### Comportamiento
| Propiedad | Descripción | Valor por defecto |
|-----------|-------------|-------------------|
| `initialTabIndex` | Índice de la pestaña seleccionada por defecto | `0` |
| `disclaimerText` | Texto del disclaimer (opcional) | `null` |

## Uso Básico

### Widget Personalizable
```dart
ProductTabsWidget(
  tabs: [
    ProductTab(
      title: 'CARACTERÍSTICAS',
      content: 'Descripción detallada de las características del producto...',
    ),
    ProductTab(
      title: 'BENEFICIOS',
      content: 'Lista de beneficios y ventajas del producto...',
    ),
    ProductTab(
      title: 'INSTRUCCIONES',
      content: 'Instrucciones paso a paso para usar el producto...',
    ),
  ],
  backgroundColor: Colors.blue[50],
  activeTabBorderColor: Colors.blue,
  activeTabTextColor: Colors.blue[800],
)
```

### Widget Predefinido
```dart
ProductTabsWidgetDefault(
  modoDeUso: 'Aplicar una pequeña cantidad sobre la zona afectada...',
  ingredientes: 'Agua, Glicerina, Aloe Vera, Vitamina E...',
  disclaimerText: 'Este producto no es un medicamento...',
)
```

## Personalización Avanzada

### Cambio Completo de Colores
```dart
ProductTabsWidget(
  tabs: [ProductTab(title: 'Mi Pestaña', content: 'Contenido')],
  backgroundColor: Colors.purple[50],
  inactiveTabBackgroundColor: Colors.white,
  activeTabBorderColor: Colors.purple,
  inactiveTabBorderColor: Colors.grey[300],
  activeTabTextColor: Colors.purple[800],
  inactiveTabTextColor: Colors.grey[600],
  contentTextColor: Colors.black87,
  disclaimerTextColor: Colors.grey[500],
)
```

### Personalización de Tamaños
```dart
ProductTabsWidget(
  tabs: [ProductTab(title: 'Mi Pestaña', content: 'Contenido')],
  borderRadius: 20,
  contentPadding: EdgeInsets.all(24),
  tabPadding: EdgeInsets.symmetric(vertical: 20),
  tabFontSize: 16,
  contentFontSize: 15,
  disclaimerFontSize: 12,
)
```

### Pestaña Inicial Personalizada
```dart
ProductTabsWidget(
  tabs: [
    ProductTab(title: 'Pestaña 1', content: 'Contenido 1'),
    ProductTab(title: 'Pestaña 2', content: 'Contenido 2'),
  ],
  initialTabIndex: 1, // Comienza en la segunda pestaña
)
```

## Casos de Uso Comunes

### Productos de Salud
```dart
ProductTabsWidgetWellness(
  descripcion: 'Suplemento natural para mejorar la energía',
  beneficios: '• Aumenta la vitalidad\n• Mejora el sistema inmune\n• Reduce la fatiga',
  contraindicaciones: 'No consumir si está embarazada o tiene problemas cardíacos',
  disclaimerText: 'Este producto es un complemento alimenticio. Consulta con tu médico.',
)
```

### Productos Cosméticos
```dart
ProductTabsWidgetCosmetic(
  aplicacion: '1. Limpia tu rostro\n2. Aplica una pequeña cantidad\n3. Masajea suavemente',
  ingredientes: 'Agua, Glicerina, Aloe Vera, Aceite de Jojoba, Vitamina E',
  precauciones: '• Evita el contacto con los ojos\n• No usar en piel irritada\n• Mantener fuera del alcance de niños',
  disclaimerText: 'Para uso externo únicamente. En caso de irritación, suspende su uso.',
)
```

### Productos Alimenticios
```dart
ProductTabsWidgetDefault(
  modoDeUso: 'Consumir 1 cápsula al día con las comidas',
  ingredientes: 'Proteína de suero, Vitaminas B, Minerales, Antioxidantes',
  disclaimerText: 'Este producto no es un medicamento. Mantener una dieta balanceada.',
)
```

## Estructura de Datos

### ProductTab
```dart
class ProductTab {
  final String title;    // Título de la pestaña
  final String content;  // Contenido de la pestaña
  
  const ProductTab({
    required this.title,
    required this.content,
  });
}
```

## Accesibilidad

- **Navegación por teclado**: Las pestañas son navegables con el teclado
- **Lectores de pantalla**: Incluye etiquetas semánticas apropiadas
- **Contraste**: Colores optimizados para legibilidad
- **Tamaño de toque**: Área de toque mínima de 44x44 píxeles

## Rendimiento

- **Optimizado**: Renderizado eficiente con `StatefulWidget`
- **Memoria**: Gestión automática de recursos
- **Rebuilds**: Solo se reconstruye cuando cambian las propiedades relevantes
- **Lazy loading**: El contenido se carga solo cuando se selecciona la pestaña

## Dependencias

- `flutter/material.dart` - Widgets básicos de Flutter
- `../theme/colors/app_colors.dart` - Sistema de colores del paquete

## Compatibilidad

- **Flutter**: 3.0.0 o superior
- **Dart**: 2.17.0 o superior
- **Plataformas**: Android, iOS, Web, Desktop

## Licencia

Este widget es parte del paquete `flutter_package_app_mayoreo` y está sujeto a la misma licencia.

## Ejemplos de Implementación

### Lista de Productos
```dart
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    return Column(
      children: [
        ProductCard(product: product),
        ProductTabsWidget(
          tabs: [
            ProductTab(
              title: 'DESCRIPCIÓN',
              content: product.description,
            ),
            ProductTab(
              title: 'BENEFICIOS',
              content: product.benefits,
            ),
            if (product.instructions != null)
              ProductTab(
                title: 'INSTRUCCIONES',
                content: product.instructions!,
              ),
          ],
        ),
      ],
    );
  },
)
```

### Navegación entre Pestañas
```dart
class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedTabIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Contenido del producto
          ProductTabsWidget(
            tabs: [
              ProductTab(title: 'DESCRIPCIÓN', content: 'Descripción...'),
              ProductTab(title: 'BENEFICIOS', content: 'Beneficios...'),
              ProductTab(title: 'INSTRUCCIONES', content: 'Instrucciones...'),
            ],
            initialTabIndex: selectedTabIndex,
          ),
        ],
      ),
    );
  }
}
```
