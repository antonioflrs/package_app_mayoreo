import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el ProductCardHorizontalV2
class ProductCardHorizontalV2Content extends StatefulWidget {
  const ProductCardHorizontalV2Content({super.key});

  @override
  State<ProductCardHorizontalV2Content> createState() =>
      _ProductCardHorizontalV2ContentState();
}

class _ProductCardHorizontalV2ContentState
    extends State<ProductCardHorizontalV2Content> {
  int _quantity1 = 2;
  int _quantity2 = 1;
  int _quantity3 = 3;
  double _total1 = 0.0;
  double _total2 = 0.0;
  double _total3 = 0.0;

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Product Card Horizontal V2',
      componentDescription:
          'Widget personalizable para mostrar tarjetas de productos en formato horizontal con controles de cantidad, precios, descuentos y diferentes estados (normal, agotado, cortesía).',
      examples: [
        ComponentExample(
          id: 'basic-usage',
          title: 'Uso básico',
          description:
              'Tarjeta horizontal de producto con estado normal, descuento y precio tachado',
          codeExample: '''
ProductCardHorizontalV2(
  productName: 'Ashwagandha Root Powder',
  productDetails: '500mg - 60 cápsulas',
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  initialQuantity: 2,
  originalPrice: 299.99,
  state: ProductCardState.normal,
  discountPercentage: 20,
  onQuantityChanged: (quantity) => print('Cantidad: \$quantity'),
  onTotalChanged: (totalValue) => print('Total: \$totalValue'),
  onDiscountChanged: (discountValue) => print('Descuento: \$discountValue'),
)
          ''',
          previewWidget: _buildBasicExample(),
        ),
        ComponentExample(
          id: 'with-discount',
          title: 'Con descuento',
          description:
              'Tarjeta con porcentaje de descuento y cálculo automático del monto descontado',
          codeExample: '''
ProductCardHorizontalV2(
  productName: 'Producto con Descuento',
  productDetails: '250mg - 30 cápsulas',
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  initialQuantity: 1,
  originalPrice: 199.99,
  state: ProductCardState.normal,
  discountPercentage: 15,
  onQuantityChanged: (quantity) => print('Cantidad: \$quantity'),
  onTotalChanged: (totalValue) => print('Total: \$totalValue'),
  onDiscountChanged: (discountValue) => print('Descuento: \$discountValue'),
)
          ''',
          previewWidget: _buildDiscountExample(),
        ),
        ComponentExample(
          id: 'different-states',
          title: 'Diferentes estados',
          description:
              'Ejemplos de los tres estados disponibles: normal, agotado y cortesía',
          codeExample: '''
// Estado normal
ProductCardHorizontalV2(
  productName: 'Producto Normal',
  productDetails: 'Estado normal',
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  initialQuantity: 1,
  originalPrice: 150.00,
  state: ProductCardState.normal,
  discountPercentage: 25,
  onQuantityChanged: (quantity) {},
  onTotalChanged: (total) {},
  onDiscountChanged: (discount) {},
)

// Estado agotado
ProductCardHorizontalV2(
  productName: 'Producto Agotado',
  productDetails: 'Estado agotado',
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  initialQuantity: 0,
  state: ProductCardState.agotado,
  onQuantityChanged: (quantity) {},
  onTotalChanged: (total) {},
)

// Estado cortesía
ProductCardHorizontalV2(
  productName: 'Producto Cortesía',
  productDetails: 'Estado cortesía',
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  initialQuantity: 1,
  originalPrice: 200.00,
  state: ProductCardState.cortesia,
  onQuantityChanged: (quantity) {},
  onTotalChanged: (total) {},
)
          ''',
          previewWidget: _buildStatesExample(),
        ),
        ComponentExample(
          id: 'interactive-example',
          title: 'Ejemplo interactivo',
          description:
              'Widget con controles para cambiar cantidades y ver el comportamiento dinámico',
          codeExample: '''
// Estado del widget
int quantity = 2;
double total = 0.0;
double discount = 0.0;

ProductCardHorizontalV2(
  productName: 'Producto Interactivo',
  productDetails: 'Cambia la cantidad para ver el total',
  imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
  initialQuantity: quantity,
  originalPrice: 250.00,
  state: ProductCardState.normal,
  discountPercentage: 20,
  onQuantityChanged: (newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  },
  onTotalChanged: (newTotal) {
    setState(() {
      total = newTotal;
    });
  },
  onDiscountChanged: (newDiscount) {
    setState(() {
      discount = newDiscount;
    });
  },
)
          ''',
          previewWidget: _buildInteractiveExample(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'productName',
          type: 'String',
          required: true,
          description: 'Nombre del producto',
        ),
        ComponentProperty(
          name: 'productDetails',
          type: 'String',
          required: true,
          description: 'Detalles del producto',
        ),
        ComponentProperty(
          name: 'imageUrl',
          type: 'String',
          required: true,
          description: 'URL de la imagen del producto',
        ),
        ComponentProperty(
          name: 'initialQuantity',
          type: 'int',
          required: true,
          description: 'Cantidad inicial del producto',
        ),
        ComponentProperty(
          name: 'originalPrice',
          type: 'double?',
          required: false,
          description: 'Precio original del producto',
        ),
        ComponentProperty(
          name: 'state',
          type: 'ProductCardState',
          required: false,
          description: 'Estado de la tarjeta de producto (por defecto: ProductCardState.normal)',
        ),
        ComponentProperty(
          name: 'discountPercentage',
          type: 'int?',
          required: false,
          description: 'Porcentaje de descuento',
        ),
        ComponentProperty(
          name: 'onDelete',
          type: 'VoidCallback?',
          required: false,
          description: 'Callback para eliminar el producto',
        ),
        ComponentProperty(
          name: 'onQuantityChanged',
          type: 'Function(int)',
          required: true,
          description: 'Callback cuando cambia la cantidad',
        ),
        ComponentProperty(
          name: 'onTotalChanged',
          type: 'Function(double)',
          required: true,
          description: 'Callback cuando cambia el total',
        ),
        ComponentProperty(
          name: 'onDiscountChanged',
          type: 'Function(double)?',
          required: false,
          description: 'Callback cuando cambia el descuento',
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: ProductCardHorizontalV2(
        productName: 'Ashwagandha Root Powder',
        productDetails: '500mg - 60 cápsulas',
        imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
        initialQuantity: 2,
        originalPrice: 299.99,
        state: ProductCardState.normal,
        discountPercentage: 20,
        onQuantityChanged: (quantity) {},
        onTotalChanged: (total) {},
        onDiscountChanged: (discount) {},
      ),
    );
  }

  Widget _buildDiscountExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: ProductCardHorizontalV2(
        productName: 'Producto con Descuento',
        productDetails: '250mg - 30 cápsulas',
        imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
        initialQuantity: 1,
        originalPrice: 199.99,
        state: ProductCardState.normal,
        discountPercentage: 15,
        onQuantityChanged: (quantity) {},
        onTotalChanged: (total) {},
        onDiscountChanged: (discount) {},
      ),
    );
  }

  Widget _buildStatesExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          // Estado normal
          ProductCardHorizontalV2(
            productName: 'Producto Normal',
            productDetails: 'Estado normal con precio',
            imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            initialQuantity: 1,
            originalPrice: 150.00,
            state: ProductCardState.normal,
            discountPercentage: 25,
            onQuantityChanged: (quantity) {},
            onTotalChanged: (total) {},
            onDiscountChanged: (discount) {},
          ),
          // Estado agotado
          ProductCardHorizontalV2(
            productName: 'Producto Agotado',
            productDetails: 'Estado agotado',
            imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            initialQuantity: 0,
            state: ProductCardState.agotado,
            onQuantityChanged: (quantity) {},
            onTotalChanged: (total) {},
          ),
          // Estado cortesía
          ProductCardHorizontalV2(
            productName: 'Producto Cortesía',
            productDetails: 'Estado cortesía',
            imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            initialQuantity: 1,
            originalPrice: 200.00,
            state: ProductCardState.cortesia,
            onQuantityChanged: (quantity) {},
            onTotalChanged: (total) {},
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          // Información del estado
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estado actual:',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Cantidad 1: $_quantity1 - Total: \$${_total1.toStringAsFixed(2)}'),
                Text('Cantidad 2: $_quantity2 - Total: \$${_total2.toStringAsFixed(2)}'),
                Text('Cantidad 3: $_quantity3 - Total: \$${_total3.toStringAsFixed(2)}'),
              ],
            ),
          ),
          // Productos interactivos
          ProductCardHorizontalV2(
            productName: 'Producto Interactivo 1',
            productDetails: 'Cambia la cantidad para ver el total',
            imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            initialQuantity: _quantity1,
            originalPrice: 250.00,
            state: ProductCardState.normal,
            discountPercentage: 20,
            onQuantityChanged: (newQuantity) {
              setState(() {
                _quantity1 = newQuantity;
              });
            },
            onTotalChanged: (newTotal) {
              setState(() {
                _total1 = newTotal;
              });
            },
            onDiscountChanged: (newDiscount) {},
          ),
          ProductCardHorizontalV2(
            productName: 'Producto Interactivo 2',
            productDetails: 'Sin descuento',
            imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            initialQuantity: _quantity2,
            originalPrice: 180.00,
            state: ProductCardState.normal,
            onQuantityChanged: (newQuantity) {
              setState(() {
                _quantity2 = newQuantity;
              });
            },
            onTotalChanged: (newTotal) {
              setState(() {
                _total2 = newTotal;
              });
            },
          ),
          ProductCardHorizontalV2(
            productName: 'Producto Interactivo 3',
            productDetails: 'Con descuento del 30%',
            imageUrl: 'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
            initialQuantity: _quantity3,
            originalPrice: 320.00,
            state: ProductCardState.normal,
            discountPercentage: 30,
            onQuantityChanged: (newQuantity) {
              setState(() {
                _quantity3 = newQuantity;
              });
            },
            onTotalChanged: (newTotal) {
              setState(() {
                _total3 = newTotal;
              });
            },
            onDiscountChanged: (newDiscount) {},
          ),
        ],
      ),
    );
  }
}