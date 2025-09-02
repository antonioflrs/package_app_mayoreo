import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Enum que define los estados posibles de la tarjeta de producto
enum ProductCardState {
  normal,
  agotado,
  cortesia,
}

/// Widget personalizable para mostrar tarjetas de productos en formato horizontal
/// 
/// Este widget permite mostrar información de productos con controles de cantidad,
/// precios, descuentos y diferentes estados (normal, agotado, cortesía).
class ProductCardHorizontalV2 extends StatefulWidget {
  /// Nombre del producto
  final String productName;
  
  /// Detalles del producto
  final String productDetails;
  
  /// URL de la imagen del producto
  final String imageUrl;
  
  /// Cantidad inicial del producto
  final int initialQuantity;
  
  /// Precio original del producto
  final double? originalPrice;
  
  /// Estado de la tarjeta de producto
  final ProductCardState state;
  
  /// Porcentaje de descuento
  final int? discountPercentage;
  
  /// Callback para eliminar el producto
  final VoidCallback? onDelete;
  
  /// Callback cuando cambia la cantidad
  final Function(int) onQuantityChanged;
  
  /// Callback cuando cambia el total
  final Function(double) onTotalChanged;
  
  /// Callback cuando cambia el descuento
  final Function(double)? onDiscountChanged;

  const ProductCardHorizontalV2({
    super.key,
    required this.productName,
    required this.productDetails,
    required this.imageUrl,
    required this.initialQuantity,
    this.originalPrice,
    this.state = ProductCardState.normal,
    this.discountPercentage,
    this.onDelete,
    required this.onQuantityChanged,
    required this.onTotalChanged,
    this.onDiscountChanged,
  });

  @override
  State<ProductCardHorizontalV2> createState() => _ProductCardHorizontalV2State();
}

class _ProductCardHorizontalV2State extends State<ProductCardHorizontalV2> {
  late int quantity;
  double totalPrice = 0.0;
  double discountAmount = 0.0;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
    _calculateTotal();
    
    // Notificar los valores iniciales al padre
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onTotalChanged(totalPrice);
      if (widget.onDiscountChanged != null) {
        widget.onDiscountChanged!(discountAmount);
      }
    });
  }

  @override
  void didUpdateWidget(ProductCardHorizontalV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Recalculamos si cambia el porcentaje de descuento o el precio original
    if (oldWidget.discountPercentage != widget.discountPercentage ||
        oldWidget.originalPrice != widget.originalPrice ||
        oldWidget.initialQuantity != widget.initialQuantity) {
      _calculateTotal();
    }
  }

  /// Calcula el total y el descuento del producto
  void _calculateTotal() {
    if (widget.originalPrice != null) {
      // Calculamos el total sin descuento (precio original * cantidad)
      double totalSinDescuento = widget.originalPrice! * quantity;
      
      // El total de la card es solo la multiplicación del precio por la cantidad
      totalPrice = totalSinDescuento;
      
      // Calculamos el descuento solo si hay porcentaje de descuento
      if (widget.discountPercentage != null) {
        double porcentajeDecimal = widget.discountPercentage! / 100.0;
        discountAmount = totalSinDescuento * porcentajeDecimal;
      } else {
        discountAmount = 0.0;
      }
    }
  }

  /// Método para formatear números con comas en los centenares
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
  }

  /// Aumenta la cantidad del producto
  void _increaseQuantity() {
    setState(() {
      quantity++;
      _calculateTotal();
    });
    widget.onQuantityChanged(quantity);
    widget.onTotalChanged(totalPrice);
    if (widget.onDiscountChanged != null) {
      widget.onDiscountChanged!(discountAmount);
    }
  }

  /// Disminuye la cantidad del producto
  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        _calculateTotal();
      });
      widget.onQuantityChanged(quantity);
      widget.onTotalChanged(totalPrice);
      if (widget.onDiscountChanged != null) {
        widget.onDiscountChanged!(discountAmount);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Para el estado agotado, envolvemos todo en Opacity excepto el label
    if (widget.state == ProductCardState.agotado) {
      return Stack(
        children: [
          // Card principal con opacidad 50%
          Opacity(
            opacity: 0.5,
            child: _buildCardContent(),
          ),
          // Label "AGOTADO" con opacidad 100% (posicionado absolutamente)
          Positioned(
            bottom: 27.0,
            right: 8.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: AppColors.mysticGray,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                'AGOTADO',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'InterVariable',
                  fontWeight: FontWeight.w600,
                  color: AppColors.slateCoolGray,
                  fontFeatures: [
                    FontFeature('ss01'),
                    FontFeature('cv11'),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Para el estado cortesía, también usamos Stack para posicionar el label
    if (widget.state == ProductCardState.cortesia) {
      return Stack(
        children: [
          // Card principal
          _buildCardContent(),
          // Label "CORTESÍA" posicionado absolutamente en el mismo lugar que "AGOTADO"
          Positioned(
            bottom: 27.0,
            right: 8.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                'CORTESÍA',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'InterVariable',
                  fontWeight: FontWeight.w600,
                  color: AppColors.amarilloSuscripciones,
                  fontFeatures: [
                    FontFeature('ss01'),
                    FontFeature('cv11'),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Para el estado normal, también usamos Stack para posicionar los precios absolutamente
    if (widget.state == ProductCardState.normal && widget.originalPrice != null) {
      return Stack(
        children: [
          // Card principal
          _buildCardContent(),
          // Precios posicionados absolutamente en la parte superior derecha
          Positioned(
            top: 10,
            right: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Etiqueta de descuento (solo para productos normales)
                if (widget.discountPercentage != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 198, 156),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      '-${widget.discountPercentage}%',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'InterVariable',
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontFeatures: [
                          FontFeature('ss01'),
                          FontFeature('cv11'),
                        ],
                      ),
                    ),
                  ),
                
                const SizedBox(height: 4.0),
                
                // Precio tachado (monto del descuento)
                if (widget.state == ProductCardState.normal && widget.discountPercentage != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Símbolo de peso
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w400,
                          color: AppColors.warmGray,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.warmGray,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                        ),
                      ),
                      // Parte entera del descuento
                      Text(
                        _formatNumber(discountAmount.toInt()),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w400,
                          color: AppColors.warmGray,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.warmGray,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                        ),
                      ),
                      // Punto decimal
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w400,
                          color: AppColors.warmGray,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.warmGray,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                        ),
                      ),
                      // Decimales como superíndice
                      Transform.translate(
                        offset: const Offset(0, -6),
                        child: Text(
                          (discountAmount - discountAmount.toInt()).toStringAsFixed(2).substring(2),
                          style: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w400,
                            color: AppColors.warmGray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.warmGray,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                
                const SizedBox(height: 16.0),
                
                // Precio actual + círculo + total en una línea horizontal
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Precio actual con formato del purchase summary
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Símbolo de peso
                        Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w700,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                            color: AppColors.grayMedium,
                          ),
                        ),
                        // Parte entera del precio
                        Text(
                          _formatNumber(widget.originalPrice!.toInt()),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w700,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                            color: AppColors.grayMedium,
                          ),
                        ),
                        // Punto decimal
                        Text(
                          '.',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w700,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                            color: AppColors.grayMedium,
                          ),
                        ),
                        // Decimales como superíndice
                        Transform.translate(
                          offset: const Offset(0, -6),
                          child: Text(
                            (widget.originalPrice! - widget.originalPrice!.toInt()).toStringAsFixed(2).substring(2),
                            style: TextStyle(
                              fontSize: 10.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w700,
                              fontFeatures: [
                                FontFeature('ss01'),
                                FontFeature('cv11'),
                              ],
                              color: AppColors.grayMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(width: 4.0),
                    
                    // Círculo con cantidad
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.grayMedium,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 4.0),
                    
                    // Precio total con formato del purchase summary
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Símbolo de peso
                        Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w900,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                            color: AppColors.black,
                          ),
                        ),
                        // Parte entera del precio total
                        Text(
                          _formatNumber(totalPrice.toInt()),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w900,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                            color: AppColors.black,
                          ),
                        ),
                        // Punto decimal
                        Text(
                          '.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w900,
                            fontFeatures: [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                            color: AppColors.black,
                          ),
                        ),
                        // Decimales como superíndice
                        Transform.translate(
                          offset: const Offset(0, -8),
                          child: Text(
                            (totalPrice - totalPrice.toInt()).toStringAsFixed(2).substring(2),
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w900,
                              fontFeatures: [
                                FontFeature('ss01'),
                                FontFeature('cv11'),
                              ],
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Para otros estados, renderizamos normalmente
    return _buildCardContent();
  }

  /// Construye el contenido principal de la tarjeta
  Widget _buildCardContent() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.only(left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.softGray,
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColors.grayMedium,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Información del producto
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre del producto
                Text(
                  widget.productName,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'InterVariable',
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                    fontFeatures: [
                      FontFeature('ss01'),
                      FontFeature('cv11'),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 1.0),
                
                // Detalles del producto
                Text(
                  widget.productDetails,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'InterVariable',
                    fontWeight: FontWeight.w400,
                    color: AppColors.slateCoolGray,
                    fontFeatures: [
                      FontFeature('ss01'),
                      FontFeature('cv11'),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 18.0),
                
                // Controles de cantidad
                Row(
                  children: [
                    // Botón eliminar con SafeSvgIcon
                    GestureDetector(
                      onTap: widget.onDelete,
                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: SafeSvgIcon(
                          iconPath: 'packages/flutter_package_app_mayoreo/assets/icons/stroke/delete.svg',
                          height: 19.0,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 10.0),
                    
                    // Contenedor pill-shaped para controles de cantidad
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: AppColors.mysticGray,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Botón menos
                          GestureDetector(
                            onTap: _decreaseQuantity,
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.remove,
                                size: 18.0,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          
                          const SizedBox(width: 10.0),
                          
                          // Cantidad
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontFeatures: [
                                FontFeature('ss01'),
                                FontFeature('cv11'),
                              ],
                            ),
                          ),
                          
                          const SizedBox(width: 10.0),
                          
                          // Botón más
                          GestureDetector(
                            onTap: _increaseQuantity,
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.add,
                                size: 18.0,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 16.0),
          
          // Información de precios y estado
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Etiqueta de descuento (solo para productos normales)
              if (widget.state == ProductCardState.normal && widget.discountPercentage != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 105, 198, 156),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    '-${widget.discountPercentage}%',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'InterVariable',
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontFeatures: [
                        FontFeature('ss01'),
                        FontFeature('cv11'),
                      ],
                    ),
                  ),
                ),
              
              // Precio tachado para estado de cortesía
              if (widget.state == ProductCardState.cortesia && widget.originalPrice != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Símbolo de peso
                    Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'InterVariable',
                        fontWeight: FontWeight.w400,
                        color: AppColors.warmGray,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.warmGray,
                        fontFeatures: [
                          FontFeature('ss01'),
                          FontFeature('cv11'),
                        ],
                      ),
                    ),
                    // Parte entera del precio
                    Text(
                      _formatNumber(widget.originalPrice!.toInt()),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'InterVariable',
                        fontWeight: FontWeight.w400,
                        color: AppColors.warmGray,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.warmGray,
                        fontFeatures: [
                          FontFeature('ss01'),
                          FontFeature('cv11'),
                        ],
                      ),
                    ),
                    // Punto decimal
                    Text(
                      '.',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'InterVariable',
                        fontWeight: FontWeight.w400,
                        color: AppColors.warmGray,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.warmGray,
                        fontFeatures: [
                          FontFeature('ss01'),
                          FontFeature('cv11'),
                        ],
                      ),
                    ),
                    // Decimales como superíndice
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: Text(
                        (widget.originalPrice! - widget.originalPrice!.toInt()).toStringAsFixed(2).substring(2),
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w400,
                          color: AppColors.warmGray,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.warmGray,
                          fontFeatures: [
                            FontFeature('ss01'),
                            FontFeature('cv11'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
