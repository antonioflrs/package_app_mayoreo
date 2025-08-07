# Ejemplos Corregidos de Uso de Iconos del Package

## 🎯 Importante: Rutas Correctas de Iconos

Los iconos del package están organizados en `lib/src/assets/icons` y se pueden acceder de dos formas:

### **Opción 1: Usando SvgIcons (Recomendado)**
```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Uso directo
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)
```

### **Opción 2: Usando IconAssets**
```dart
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Uso directo
CustomSvgIcon(
  iconPath: IconAssets.filledUserActivo,
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)
```

---

## 📱 Ejemplo 1: Pantalla de Perfil Corregida

### Archivo: `lib/screens/profile_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi Perfil',
          style: AppTypography.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.orangeBrand,
        leading: IconButton(
          icon: CustomSvgIcon(
            iconPath: SvgIcons.arrowLeft, // ✅ Ruta correcta
            width: 24,
            height: 24,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildProfileOptions(),
            const SizedBox(height: 24),
            _buildAccountInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Row(
        children: [
          // Avatar
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.orangeBrand.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: CustomSvgIcon(
              iconPath: SvgIcons.userActive, // ✅ Ruta correcta
              width: 40,
              height: 40,
              color: AppColors.orangeBrand,
            ),
          ),
          const SizedBox(width: 16),
          
          // Información del usuario
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Juan Pérez',
                  style: AppTypography.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'juan.perez@blife.com',
                  style: AppTypography.bodyMedium?.copyWith(
                    color: AppColors.grayMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.greenFree.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Cliente Premium',
                    style: AppTypography.labelSmall?.copyWith(
                      color: AppColors.greenFree,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Botón de editar
          IconButton(
            onPressed: () {
              // Navegar a pantalla de editar perfil
            },
            icon: CustomSvgIcon(
              iconPath: SvgIcons.plus, // ✅ Ruta correcta
              width: 20,
              height: 20,
              color: AppColors.orangeBrand,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptions() {
    final options = [
      {
        'icon': SvgIcons.documentActive, // ✅ Ruta correcta
        'title': 'Mis Pedidos',
        'subtitle': 'Ver historial de pedidos',
        'onTap': () {},
      },
      {
        'icon': SvgIcons.cardActive, // ✅ Ruta correcta
        'title': 'Métodos de Pago',
        'subtitle': 'Gestionar tarjetas y pagos',
        'onTap': () {},
      },
      {
        'icon': SvgIcons.locationActive, // ✅ Ruta correcta
        'title': 'Direcciones',
        'subtitle': 'Mis direcciones de entrega',
        'onTap': () {},
      },
      {
        'icon': SvgIcons.favoritesActive, // ✅ Ruta correcta
        'title': 'Favoritos',
        'subtitle': 'Productos guardados',
        'onTap': () {},
      },
    ];

    return Column(
      children: options.map((option) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.orangeBrand.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomSvgIcon(
                iconPath: option['icon'] as String,
                width: 24,
                height: 24,
                color: AppColors.orangeBrand,
              ),
            ),
            title: Text(
              option['title'] as String,
              style: AppTypography.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
            ),
            subtitle: Text(
              option['subtitle'] as String,
              style: AppTypography.bodyMedium?.copyWith(
                color: AppColors.grayMedium,
              ),
            ),
            trailing: CustomSvgIcon(
              iconPath: SvgIcons.arrowDown, // ✅ Ruta correcta
              width: 16,
              height: 16,
              color: AppColors.grayMedium,
            ),
            onTap: option['onTap'] as VoidCallback,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: AppColors.white,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAccountInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Información de la Cuenta',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildInfoRow('ID de Cliente', 'BL-2024-001234'),
          _buildInfoRow('Fecha de Registro', '15 de Enero, 2024'),
          _buildInfoRow('Última Sesión', 'Hace 2 horas'),
          _buildInfoRow('Estado', 'Activo'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 🛒 Ejemplo 2: Carrito de Compras Corregido

### Archivo: `lib/screens/cart_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi Carrito',
          style: AppTypography.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.orangeBrand,
        leading: IconButton(
          icon: CustomSvgIcon(
            iconPath: SvgIcons.arrowLeft, // ✅ Ruta correcta
            width: 24,
            height: 24,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: CustomSvgIcon(
              iconPath: SvgIcons.delete, // ✅ Ruta correcta
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
            onPressed: _showClearCartDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCartItems(),
          ),
          _buildCartSummary(),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    // Simulación de items del carrito
    final cartItems = [
      {
        'id': '1',
        'name': 'Aceite de Oliva Extra Virgen',
        'brand': 'B Life Premium',
        'quantity': 2,
        'price': 45.99,
        'image': 'assets/images/olive_oil.png',
      },
      {
        'id': '2',
        'name': 'Harina de Trigo Integral',
        'brand': 'B Life Natural',
        'quantity': 3,
        'price': 12.50,
        'image': 'assets/images/flour.png',
      },
    ];

    if (cartItems.isEmpty) {
      return _buildEmptyCart();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return _buildCartItem(item);
      },
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgIcon(
            iconPath: SvgIcons.cartInactive, // ✅ Ruta correcta
            width: 80,
            height: 80,
            color: AppColors.grayMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Tu carrito está vacío',
            style: AppTypography.titleMedium?.copyWith(
              color: AppColors.darkGray,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega productos para comenzar a comprar',
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          UiButton(
            onPressed: () {
              // Navegar a categorías
            },
            label: 'Explorar Productos',
            type: UiButtonType.primary,
            icon: Icons.shopping_bag,
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Row(
        children: [
          // Imagen del producto
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomSvgIcon(
              iconPath: SvgIcons.documentActive, // ✅ Ruta correcta
              width: 40,
              height: 40,
              color: AppColors.grayMedium,
            ),
          ),
          const SizedBox(width: 16),
          
          // Información del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'] as String,
                  style: AppTypography.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['brand'] as String,
                  style: AppTypography.bodySmall?.copyWith(
                    color: AppColors.grayMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${(item['price'] as double).toStringAsFixed(2)}',
                  style: AppTypography.titleMedium?.copyWith(
                    color: AppColors.orangeBrand,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          
          // Controles de cantidad
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Decrementar cantidad
                    },
                    icon: CustomSvgIcon(
                      iconPath: SvgIcons.minus, // ✅ Ruta correcta
                      width: 16,
                      height: 16,
                      color: AppColors.grayMedium,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.softGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${item['quantity']}',
                      style: AppTypography.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Incrementar cantidad
                    },
                    icon: CustomSvgIcon(
                      iconPath: SvgIcons.plus, // ✅ Ruta correcta
                      width: 16,
                      height: 16,
                      color: AppColors.orangeBrand,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // Eliminar item
                },
                icon: CustomSvgIcon(
                  iconPath: SvgIcons.delete, // ✅ Ruta correcta
                  width: 16,
                  height: 16,
                  color: AppColors.digitalRed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: AppColors.silverGrayMedium.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Resumen de precios
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: AppTypography.bodyMedium?.copyWith(
                  color: AppColors.grayMedium,
                ),
              ),
              Text(
                '\$127.48',
                style: AppTypography.bodyMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Envío',
                style: AppTypography.bodyMedium?.copyWith(
                  color: AppColors.grayMedium,
                ),
              ),
              Text(
                '\$15.00',
                style: AppTypography.bodyMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'IVA',
                style: AppTypography.bodyMedium?.copyWith(
                  color: AppColors.grayMedium,
                ),
              ),
              Text(
                '\$25.50',
                style: AppTypography.bodyMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTypography.titleMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$167.98',
                style: AppTypography.titleLarge?.copyWith(
                  color: AppColors.orangeBrand,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Botón de checkout
          UiButton(
            onPressed: _isProcessing ? null : _processCheckout,
            label: _isProcessing ? 'Procesando...' : 'Proceder al Pago',
            type: UiButtonType.primary,
            icon: _isProcessing ? null : Icons.payment,
            isLoading: _isProcessing,
            size: UiButtonSize.large,
          ),
          
          const SizedBox(height: 12),
          
          // Botón secundario
          UiButton(
            onPressed: () {
              // Continuar comprando
            },
            label: 'Continuar Comprando',
            type: UiButtonType.secondary,
            icon: Icons.shopping_bag,
            size: UiButtonSize.large,
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Vaciar Carrito',
          style: AppTypography.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          '¿Estás seguro de que quieres vaciar tu carrito? Esta acción no se puede deshacer.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          UiButton(
            onPressed: () => Navigator.pop(context),
            label: 'Cancelar',
            type: UiButtonType.text,
          ),
          UiButton(
            onPressed: () {
              Navigator.pop(context);
              // Vaciar carrito
            },
            label: 'Vaciar',
            type: UiButtonType.destructive,
          ),
        ],
      ),
    );
  }

  void _processCheckout() {
    setState(() {
      _isProcessing = true;
    });
    
    // Simular proceso de checkout
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
        // Navegar a pantalla de pago
      }
    });
  }
}
```

---

## 📋 Ejemplo 3: Navegación Inferior Corregida

### Archivo: `lib/widgets/bottom_navigation.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.silverGrayMedium.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              icon: SvgIcons.userActive, // ✅ Ruta correcta
              inactiveIcon: SvgIcons.userInactive, // ✅ Ruta correcta
              label: 'Perfil',
              index: 0,
            ),
            _buildNavItem(
              icon: SvgIcons.categoriesActive, // ✅ Ruta correcta
              inactiveIcon: SvgIcons.categoriesInactive, // ✅ Ruta correcta
              label: 'Categorías',
              index: 1,
            ),
            _buildNavItem(
              icon: SvgIcons.ordersActive, // ✅ Ruta correcta
              inactiveIcon: SvgIcons.ordersInactive, // ✅ Ruta correcta
              label: 'Pedidos',
              index: 2,
            ),
            _buildNavItem(
              icon: SvgIcons.cartActive, // ✅ Ruta correcta
              inactiveIcon: SvgIcons.cartInactive, // ✅ Ruta correcta
              label: 'Carrito',
              index: 3,
            ),
            _buildNavItem(
              icon: SvgIcons.favoritesActive, // ✅ Ruta correcta
              inactiveIcon: SvgIcons.favoritesInactive, // ✅ Ruta correcta
              label: 'Favoritos',
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String inactiveIcon,
    required String label,
    required int index,
  }) {
    final isActive = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: CustomSvgIcon(
              key: ValueKey(isActive),
              iconPath: isActive ? icon : inactiveIcon,
              width: 24,
              height: 24,
              color: isActive ? AppColors.orangeBrand : AppColors.grayMedium,
            ),
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
      ),
    );
  }
}
```

---

## 🔧 Configuración Correcta del pubspec.yaml

### Archivo: `pubspec.yaml` (Proyecto Cliente)

```yaml
name: blife_mayoreo_app
description: "Aplicación de mayoreo para B Life"
version: 1.0.0+1

environment:
  sdk: ^3.8.1

dependencies:
  flutter:
    sdk: flutter
  
  # Package de diseño de B Life
  flutter_package_app_mayoreo:
    git:
      url: https://github.com/blife-mayoreo/flutter_package_app_mayoreo.git
      ref: main
    # Alternativa con versión específica:
    # git:
    #   url: https://github.com/blife-mayoreo/flutter_package_app_mayoreo.git
    #   ref: v0.0.1
  
  # Otras dependencias
  cupertino_icons: ^1.0.8
  flutter_svg: ^2.0.10+1
  http: ^1.1.0
  shared_preferences: ^2.2.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true
  
  # Assets específicos de la app (NO incluir los del package)
  assets:
    - assets/images/
    - assets/icons/
  
  # Fuentes personalizadas (si no están en el package)
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

---

## 📚 Referencia de Iconos Disponibles

### **Iconos de Navegación:**
```dart
SvgIcons.burgerMenu      // Menú hamburguesa
SvgIcons.arrowLeft       // Flecha izquierda
SvgIcons.arrowDown       // Flecha abajo
SvgIcons.close           // Cerrar
SvgIcons.check           // Verificar
SvgIcons.plus            // Más
SvgIcons.reset           // Restaurar
```

### **Iconos de Usuario:**
```dart
SvgIcons.userActive      // Usuario activo
SvgIcons.userInactive    // Usuario inactivo
SvgIcons.profile         // Perfil
```

### **Iconos de Pedidos y Carrito:**
```dart
SvgIcons.ordersActive    // Pedidos activo
SvgIcons.ordersInactive  // Pedidos inactivo
SvgIcons.cartActive      // Carrito activo
SvgIcons.cartInactive    // Carrito inactivo
```

### **Iconos de Categorías:**
```dart
SvgIcons.categoriesActive   // Categorías activo
SvgIcons.categoriesInactive // Categorías inactivo
SvgIcons.listActive         // Lista activa
SvgIcons.listInactive       // Lista inactiva
```

### **Iconos de Favoritos:**
```dart
SvgIcons.favoritesActive   // Favoritos activo
SvgIcons.favoritesInactive // Favoritos inactivo
```

### **Iconos de Documentos:**
```dart
SvgIcons.documentActive   // Documento activo
SvgIcons.documentInactive // Documento inactivo
```

### **Iconos de Tarjetas:**
```dart
SvgIcons.cardActive   // Tarjeta activa
SvgIcons.cardInactive // Tarjeta inactiva
```

### **Iconos de Ayuda:**
```dart
SvgIcons.helpActive   // Ayuda activo
SvgIcons.helpInactive // Ayuda inactivo
```

### **Iconos de Ubicación:**
```dart
SvgIcons.locationActive   // Ubicación activa
SvgIcons.locationInactive // Ubicación inactiva
```

### **Iconos de Comunicación:**
```dart
SvgIcons.mail  // Correo
SvgIcons.share // Compartir
```

### **Iconos de Acciones:**
```dart
SvgIcons.delete // Eliminar
SvgIcons.alert  // Alerta
```

---

## ✅ Mejores Prácticas Corregidas

### **1. Importación Correcta:**
```dart
// ✅ Correcto
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// ❌ Incorrecto - No importar directamente los archivos internos
// import 'package:flutter_package_app_mayoreo/src/icons/app_icons.dart';
```

### **2. Uso de Iconos:**
```dart
// ✅ Correcto - Usar SvgIcons
CustomSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)

// ✅ También correcto - Usar IconAssets
CustomSvgIcon(
  iconPath: IconAssets.filledUserActivo,
  width: 24,
  height: 24,
  color: AppColors.orangeBrand,
)

// ❌ Incorrecto - No usar rutas hardcodeadas
// CustomSvgIcon(
//   iconPath: 'assets/icons/filled/user_activo.svg',
//   width: 24,
//   height: 24,
// )
```

### **3. Verificación de Iconos:**
```dart
// ✅ Verificar que el icono existe
if (SvgIcons.userActive.isNotEmpty) {
  CustomSvgIcon(
    iconPath: SvgIcons.userActive,
    width: 24,
    height: 24,
  )
}
```

### **4. Manejo de Errores:**
```dart
// ✅ Usar SafeSvgIcon para manejo de errores
SafeSvgIcon(
  iconPath: SvgIcons.userActive,
  width: 24,
  height: 24,
  fallback: Icon(Icons.person, size: 24),
)
```

---

## 🚀 Comandos para Verificar

```bash
# Verificar que el package esté correctamente instalado
flutter pub deps

# Verificar análisis de código
flutter analyze

# Ejecutar tests
flutter test

# Limpiar y reconstruir si hay problemas
flutter clean && flutter pub get
```

---

## 📝 Notas Importantes

1. **Los iconos están en `lib/src/assets/icons`** pero se acceden a través de `SvgIcons` o `IconAssets`
2. **No modificar las rutas** de los iconos en el package
3. **Usar siempre las constantes** en lugar de rutas hardcodeadas
4. **Verificar la documentación** del package para iconos nuevos
5. **Reportar problemas** si algún icono no se muestra correctamente
