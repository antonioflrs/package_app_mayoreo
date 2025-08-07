# Ejemplos para el Equipo de Desarrollo

## 🏢 Contexto del Equipo

**Empresa**: B Life Mayoreo  
**Equipo**: 5 desarrolladores Flutter  
**Proyectos Activos**: 
- App de Mayoreo (Producción)
- App de Administración (Desarrollo)
- App de Repartidores (Planificación)

---

## 📱 Ejemplo 1: Pantalla de Lista de Productos

### Archivo: `lib/screens/product_list_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryId;
  
  const ProductListScreen({
    super.key,
    required this.categoryId,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _isLoading = false;
  bool _isGridView = true;
  String _sortBy = 'name';
  
  // Simulación de productos
  final List<Map<String, dynamic>> _products = [
    {
      'id': '1',
      'name': 'Aceite de Oliva Extra Virgen',
      'brand': 'B Life Premium',
      'price': 45.99,
      'originalPrice': 55.99,
      'discount': 18,
      'rating': 4.8,
      'reviews': 124,
      'isFavorite': true,
      'stock': 50,
    },
    {
      'id': '2',
      'name': 'Harina de Trigo Integral',
      'brand': 'B Life Natural',
      'price': 12.50,
      'originalPrice': 12.50,
      'discount': 0,
      'rating': 4.5,
      'reviews': 89,
      'isFavorite': false,
      'stock': 200,
    },
    {
      'id': '3',
      'name': 'Miel Orgánica Pura',
      'brand': 'B Life Organic',
      'price': 28.75,
      'originalPrice': 35.00,
      'discount': 18,
      'rating': 4.9,
      'reviews': 67,
      'isFavorite': true,
      'stock': 25,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Productos',
          style: AppTypography.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.orangeBrand,
        leading: IconButton(
          icon: CustomSvgIcon(
            iconPath: SvgIcons.arrowLeft,
            width: 24,
            height: 24,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: CustomSvgIcon(
              iconPath: _isGridView ? SvgIcons.listActive : SvgIcons.categoriesActive,
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
          IconButton(
            icon: CustomSvgIcon(
              iconPath: SvgIcons.favoritesActive,
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
            onPressed: () {
              // Navegar a favoritos
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: _isGridView ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.silverGrayMedium.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.softGray,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _sortBy,
                isExpanded: true,
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(value: 'name', child: Text('Nombre')),
                  DropdownMenuItem(value: 'price', child: Text('Precio')),
                  DropdownMenuItem(value: 'rating', child: Text('Calificación')),
                ],
                onChanged: (value) {
                  setState(() {
                    _sortBy = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          UiButton(
            onPressed: () {
              // Mostrar filtros avanzados
            },
            label: 'Filtros',
            type: UiButtonType.secondary,
            icon: Icons.filter_list,
            size: UiButtonSize.small,
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_products[index]);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return _buildProductListItem(_products[index]);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
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
          // Imagen del producto
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.softGray,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CustomSvgIcon(
                      iconPath: SvgIcons.documentActive,
                      width: 40,
                      height: 40,
                      color: AppColors.grayMedium,
                    ),
                  ),
                  // Badge de descuento
                  if (product['discount'] > 0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.digitalRed,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '-${product['discount']}%',
                          style: AppTypography.labelSmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  // Botón de favorito
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          product['isFavorite'] = !product['isFavorite'];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CustomSvgIcon(
                          iconPath: product['isFavorite'] 
                              ? SvgIcons.favoritesActive 
                              : SvgIcons.favoritesInactive,
                          width: 16,
                          height: 16,
                          color: product['isFavorite'] 
                              ? AppColors.digitalRed 
                              : AppColors.grayMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Información del producto
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['brand'] as String,
                    style: AppTypography.labelSmall?.copyWith(
                      color: AppColors.orangeBrand,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['name'] as String,
                    style: AppTypography.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  
                  // Precios
                  Row(
                    children: [
                      Text(
                        '\$${(product['price'] as double).toStringAsFixed(2)}',
                        style: AppTypography.titleMedium?.copyWith(
                          color: AppColors.orangeBrand,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (product['discount'] > 0) ...[
                        const SizedBox(width: 8),
                        Text(
                          '\$${(product['originalPrice'] as double).toStringAsFixed(2)}',
                          style: AppTypography.bodySmall?.copyWith(
                            color: AppColors.grayMedium,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Rating y botón de agregar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: AppColors.yellow),
                          const SizedBox(width: 4),
                          Text(
                            '${product['rating']}',
                            style: AppTypography.labelSmall?.copyWith(
                              color: AppColors.grayMedium,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Agregar al carrito
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.orangeBrand,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomSvgIcon(
                            iconPath: SvgIcons.plus,
                            width: 16,
                            height: 16,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductListItem(Map<String, dynamic> product) {
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
            child: Stack(
              children: [
                Center(
                  child: CustomSvgIcon(
                    iconPath: SvgIcons.documentActive,
                    width: 32,
                    height: 32,
                    color: AppColors.grayMedium,
                  ),
                ),
                if (product['discount'] > 0)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.digitalRed,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '-${product['discount']}%',
                        style: AppTypography.labelSmall?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Información del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['brand'] as String,
                  style: AppTypography.labelSmall?.copyWith(
                    color: AppColors.orangeBrand,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product['name'] as String,
                  style: AppTypography.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Rating
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: AppColors.yellow),
                    const SizedBox(width: 4),
                    Text(
                      '${product['rating']} (${product['reviews']})',
                      style: AppTypography.labelSmall?.copyWith(
                        color: AppColors.grayMedium,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Precios
                Row(
                  children: [
                    Text(
                      '\$${(product['price'] as double).toStringAsFixed(2)}',
                      style: AppTypography.titleMedium?.copyWith(
                        color: AppColors.orangeBrand,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (product['discount'] > 0) ...[
                      const SizedBox(width: 8),
                      Text(
                        '\$${(product['originalPrice'] as double).toStringAsFixed(2)}',
                        style: AppTypography.bodySmall?.copyWith(
                          color: AppColors.grayMedium,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          
          // Acciones
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    product['isFavorite'] = !product['isFavorite'];
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: CustomSvgIcon(
                    iconPath: product['isFavorite'] 
                        ? SvgIcons.favoritesActive 
                        : SvgIcons.favoritesInactive,
                    width: 20,
                    height: 20,
                    color: product['isFavorite'] 
                        ? AppColors.digitalRed 
                        : AppColors.grayMedium,
                  ),
                ),
              ),
              UiButton(
                onPressed: () {
                  // Agregar al carrito
                },
                label: 'Agregar',
                type: UiButtonType.primary,
                size: UiButtonSize.small,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

---

## 🛒 Ejemplo 2: Widget de Producto en Carrito

### Archivo: `lib/widgets/cart_product_widget.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class CartProductWidget extends StatefulWidget {
  final Map<String, dynamic> product;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartProductWidget({
    super.key,
    required this.product,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  bool _isUpdating = false;

  @override
  Widget build(BuildContext context) {
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
              iconPath: SvgIcons.documentActive,
              width: 32,
              height: 32,
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
                  widget.product['name'] as String,
                  style: AppTypography.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.product['brand'] as String,
                  style: AppTypography.bodySmall?.copyWith(
                    color: AppColors.grayMedium,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Precio unitario
                Text(
                  '\$${(widget.product['price'] as double).toStringAsFixed(2)} c/u',
                  style: AppTypography.bodyMedium?.copyWith(
                    color: AppColors.grayMedium,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Precio total
                Text(
                  '\$${((widget.product['price'] as double) * (widget.product['quantity'] as int)).toStringAsFixed(2)}',
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
              // Controles +/-
              Row(
                children: [
                  _buildQuantityButton(
                    icon: SvgIcons.minus,
                    onPressed: widget.product['quantity'] > 1 
                        ? () => _updateQuantity(widget.product['quantity'] - 1)
                        : null,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.softGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${widget.product['quantity']}',
                      style: AppTypography.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildQuantityButton(
                    icon: SvgIcons.plus,
                    onPressed: () => _updateQuantity(widget.product['quantity'] + 1),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Botón eliminar
              GestureDetector(
                onTap: _isUpdating ? null : widget.onRemove,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.digitalRed.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomSvgIcon(
                    iconPath: SvgIcons.delete,
                    width: 16,
                    height: 16,
                    color: AppColors.digitalRed,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required String icon,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: onPressed != null 
              ? AppColors.orangeBrand 
              : AppColors.grayMedium.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: CustomSvgIcon(
            iconPath: icon,
            width: 16,
            height: 16,
            color: onPressed != null 
                ? AppColors.white 
                : AppColors.grayMedium,
          ),
        ),
      ),
    );
  }

  void _updateQuantity(int newQuantity) async {
    setState(() {
      _isUpdating = true;
    });
    
    try {
      // Simular llamada a API
      await Future.delayed(const Duration(milliseconds: 500));
      widget.onQuantityChanged(newQuantity);
    } finally {
      if (mounted) {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }
}
```

---

## 📊 Ejemplo 3: Dashboard de Estadísticas

### Archivo: `lib/screens/dashboard_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: AppTypography.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.orangeBrand,
        actions: [
          IconButton(
            icon: CustomSvgIcon(
              iconPath: SvgIcons.mail,
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
            onPressed: () {
              // Abrir notificaciones
            },
          ),
          IconButton(
            icon: CustomSvgIcon(
              iconPath: SvgIcons.helpActive,
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
            onPressed: () {
              // Abrir ayuda
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 24),
            _buildStatsGrid(),
            const SizedBox(height: 24),
            _buildRecentOrders(),
            const SizedBox(height: 24),
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.orangeBrand, AppColors.ochreBrand],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Bienvenido de vuelta!',
                  style: AppTypography.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Juan Pérez',
                  style: AppTypography.titleMedium?.copyWith(
                    color: AppColors.white.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Cliente Premium',
                    style: AppTypography.labelSmall?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomSvgIcon(
            iconPath: SvgIcons.userActive,
            width: 60,
            height: 60,
            color: AppColors.white.withValues(alpha: 0.8),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    final stats = [
      {
        'title': 'Pedidos',
        'value': '12',
        'change': '+3',
        'isPositive': true,
        'icon': SvgIcons.ordersActive,
        'color': AppColors.orangeBrand,
      },
      {
        'title': 'Gastado',
        'value': '\$1,247',
        'change': '+15%',
        'isPositive': true,
        'icon': SvgIcons.cardActive,
        'color': AppColors.greenFree,
      },
      {
        'title': 'Favoritos',
        'value': '8',
        'change': '+2',
        'isPositive': true,
        'icon': SvgIcons.favoritesActive,
        'color': AppColors.digitalRed,
      },
      {
        'title': 'Ahorro',
        'value': '\$156',
        'change': '+8%',
        'isPositive': true,
        'icon': SvgIcons.documentActive,
        'color': AppColors.oliveBrand,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return _buildStatCard(stat);
      },
    );
  }

  Widget _buildStatCard(Map<String, dynamic> stat) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (stat['color'] as Color).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomSvgIcon(
                  iconPath: stat['icon'] as String,
                  width: 20,
                  height: 20,
                  color: stat['color'] as Color,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: (stat['isPositive'] as bool) 
                      ? AppColors.greenFree.withValues(alpha: 0.1)
                      : AppColors.digitalRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  stat['change'] as String,
                  style: AppTypography.labelSmall?.copyWith(
                    color: (stat['isPositive'] as bool) 
                        ? AppColors.greenFree 
                        : AppColors.digitalRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            stat['value'] as String,
            style: AppTypography.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat['title'] as String,
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pedidos Recientes',
              style: AppTypography.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
            ),
            UiButton(
              onPressed: () {
                // Ver todos los pedidos
              },
              label: 'Ver Todos',
              type: UiButtonType.text,
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // Lista de pedidos recientes
        Container(
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
            children: [
              _buildOrderItem('BL-2024-001', 'En Proceso', '\$156.78', 'Hace 2 horas'),
              _buildOrderItem('BL-2024-002', 'Entregado', '\$89.45', 'Ayer'),
              _buildOrderItem('BL-2024-003', 'En Camino', '\$234.12', 'Hace 3 días'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem(String orderId, String status, String amount, String time) {
    Color statusColor;
    String statusIcon;
    
    switch (status) {
      case 'En Proceso':
        statusColor = AppColors.yellow;
        statusIcon = SvgIcons.alert;
        break;
      case 'Entregado':
        statusColor = AppColors.greenFree;
        statusIcon = SvgIcons.check;
        break;
      case 'En Camino':
        statusColor = AppColors.orangeBrand;
        statusIcon = SvgIcons.locationActive;
        break;
      default:
        statusColor = AppColors.grayMedium;
        statusIcon = SvgIcons.documentActive;
    }

    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomSvgIcon(
          iconPath: statusIcon,
          width: 24,
          height: 24,
          color: statusColor,
        ),
      ),
      title: Text(
        orderId,
        style: AppTypography.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.darkGray,
        ),
      ),
      subtitle: Text(
        time,
        style: AppTypography.bodySmall?.copyWith(
          color: AppColors.grayMedium,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: AppTypography.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.orangeBrand,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: AppTypography.labelSmall?.copyWith(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {
        'title': 'Nuevo Pedido',
        'subtitle': 'Crear pedido rápido',
        'icon': SvgIcons.plus,
        'color': AppColors.orangeBrand,
        'onTap': () {},
      },
      {
        'title': 'Ver Catálogo',
        'subtitle': 'Explorar productos',
        'icon': SvgIcons.categoriesActive,
        'color': AppColors.ochreBrand,
        'onTap': () {},
      },
      {
        'title': 'Soporte',
        'subtitle': 'Contactar ayuda',
        'icon': SvgIcons.helpActive,
        'color': AppColors.oliveBrand,
        'onTap': () {},
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Acciones Rápidas',
          style: AppTypography.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.darkGray,
          ),
        ),
        const SizedBox(height: 12),
        
        Row(
          children: actions.map((action) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: _buildQuickActionCard(action),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(Map<String, dynamic> action) {
    return GestureDetector(
      onTap: action['onTap'] as VoidCallback,
      child: Container(
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (action['color'] as Color).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CustomSvgIcon(
                iconPath: action['icon'] as String,
                width: 24,
                height: 24,
                color: action['color'] as Color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              action['title'] as String,
              style: AppTypography.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              action['subtitle'] as String,
              style: AppTypography.labelSmall?.copyWith(
                color: AppColors.grayMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🔧 Configuración para el Equipo

### Archivo: `pubspec.yaml` (Proyecto del Equipo)

```yaml
name: blife_mayoreo_app
description: "Aplicación de mayoreo para B Life - Equipo de Desarrollo"
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
    # Para producción, usar versión específica:
    # git:
    #   url: https://github.com/blife-mayoreo/flutter_package_app_mayoreo.git
    #   ref: v0.0.1
  
  # Dependencias del proyecto
  cupertino_icons: ^1.0.8
  flutter_svg: ^2.0.10+1
  http: ^1.1.0
  shared_preferences: ^2.2.2
  provider: ^6.1.1
  go_router: ^13.0.0
  cached_network_image: ^3.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.7
  json_annotation: ^4.8.1

flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/icons/
    - assets/data/
  
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

### Script de Desarrollo: `scripts/dev_setup.sh`

```bash
#!/bin/bash

echo "🚀 Configurando entorno de desarrollo para B Life Mayoreo..."

# Verificar Flutter
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter no está instalado. Por favor instala Flutter primero."
    exit 1
fi

# Verificar versión de Flutter
flutter --version

# Limpiar cache
echo "🧹 Limpiando cache..."
flutter clean

# Obtener dependencias
echo "📦 Obteniendo dependencias..."
flutter pub get

# Verificar análisis
echo "🔍 Ejecutando análisis de código..."
flutter analyze

# Ejecutar tests
echo "🧪 Ejecutando tests..."
flutter test

# Ejecutar build runner si es necesario
echo "🔨 Ejecutando build runner..."
flutter packages pub run build_runner build --delete-conflicting-outputs

echo "✅ Entorno de desarrollo configurado correctamente!"
echo "🎯 Para ejecutar la app: flutter run"
echo "📱 Para ejecutar en modo debug: flutter run --debug"
echo "🚀 Para ejecutar en modo release: flutter run --release"
```

### Comandos Útiles para el Equipo

```bash
# Actualizar package a la última versión
flutter pub upgrade flutter_package_app_mayoreo

# Ver dependencias actuales
flutter pub deps

# Ejecutar análisis de código
flutter analyze

# Ejecutar tests
flutter test

# Generar código (si usas build_runner)
flutter packages pub run build_runner build

# Limpiar y reconstruir
flutter clean && flutter pub get

# Ejecutar en modo debug
flutter run --debug

# Ejecutar en modo release
flutter run --release

# Generar APK
flutter build apk

# Generar iOS
flutter build ios
```

---

## 📝 Notas para el Equipo

### **Flujo de Trabajo Diario:**
1. **Pull del repositorio**: `git pull origin main`
2. **Actualizar dependencias**: `flutter pub get`
3. **Verificar análisis**: `flutter analyze`
4. **Ejecutar tests**: `flutter test`
5. **Desarrollo**: Usar componentes del package
6. **Commit**: Incluir cambios en el package si es necesario

### **Convenciones del Equipo:**
- ✅ Usar siempre `AppColors` del package para colores
- ✅ Usar `AppTypography` para estilos de texto
- ✅ Usar `CustomSvgIcon` para iconos SVG
- ✅ Usar `UiButton` para botones
- ✅ Mantener consistencia en espaciados y bordes

### **Debugging:**
- 🔍 Verificar que el package esté correctamente importado
- 🔍 Revisar logs de Flutter para errores de assets
- 🔍 Usar `flutter doctor` para verificar configuración
- 🔍 Verificar versiones de dependencias en `pubspec.lock`
