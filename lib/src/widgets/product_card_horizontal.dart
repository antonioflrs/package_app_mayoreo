import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';
import 'rating_stars.dart';
import 'favorite_icon.dart';

/// Widget para las tarjetas de productos horizontales
class ProductCardHorizontal extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleFavorite;
  final List<Map<String, dynamic>> userLists;
  final Function(String listId) onMoveToList;
  final VoidCallback? onShare;
  final bool showOptionsMenu;

  const ProductCardHorizontal({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onToggleFavorite,
    required this.userLists,
    required this.onMoveToList,
    this.onShare,
    this.showOptionsMenu = true,
  });

  @override
  State<ProductCardHorizontal> createState() => _ProductCardHorizontalState();
}

class _ProductCardHorizontalState extends State<ProductCardHorizontal> {
  bool _showOptionsMenu = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _currentOverlay;

  /// Método para formatear números con comas en los centenares
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
  }

  void _showOptionsOverlay() {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 150,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-123, 35), // Posicionar debajo del botón
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Opción Mover
                  InkWell(
                    onTap: () {
                      _closeOverlay();
                      _showMoveModal();
                    },
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 12.0,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 12.0),
                          Text(
                            'Mover',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontFamily: 'InterVariable',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Separador
                  Container(height: 1, color: AppColors.backCards),

                  // Opción Compartir
                  InkWell(
                    onTap: () {
                      _closeOverlay();
                      _showShareOptions();
                    },
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 12.0,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 12.0),
                          Text(
                            'Compartir',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                              fontFamily: 'InterVariable',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    _currentOverlay = overlayEntry;
  }

  void _closeOverlay() {
    if (_currentOverlay != null) {
      _currentOverlay!.remove();
      _currentOverlay = null;
      setState(() {
        _showOptionsMenu = false;
      });
    }
  }

  void _showMoveModal() {
    // Aquí se implementaría la funcionalidad de mover a lista
    // Por ahora solo mostramos un mensaje
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidad de mover a lista en desarrollo'),
        backgroundColor: AppColors.orangeBrand,
      ),
    );
  }

  void _showShareOptions() {
    if (widget.onShare != null) {
      widget.onShare!();
    } else {
      // Funcionalidad por defecto
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Funcionalidad de compartir en desarrollo'),
          backgroundColor: AppColors.orangeBrand,
        ),
      );
    }
  }

  @override
  void dispose() {
    _closeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, right: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Imagen del producto
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.product['imageUrl'] ?? 
                'https://imagenproductos.s3.amazonaws.com/ashwagandha-root-powder-raz-de-ashwagandha-blifeashwaga150-featuredimage-b-life-suplementos-ashwagandha-mockup-transparente.webp',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.backCards,
                    child: const Icon(
                      Icons.inventory,
                      color: AppColors.grayMedium,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),

          // Información del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila para el Título y los Botones
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título del producto (expandido para empujar los botones)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product['name'] ?? 'Producto',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.black,
                              fontFamily: 'InterVariable',
                              fontFeatures: [
                                FontFeature('ss01'),
                                FontFeature('cv11'),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.0),
                          // Estrellas directamente debajo del título
                          RatingStars(
                            rating: widget.product['rating']?.toDouble() ?? 5.0, 
                            size: 14.0, 
                            gap: 2.0
                          ),
                        ],
                      ),
                    ),
                                         // Botón de favorito y opciones alineados con el título
                     Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // Botón de favorito
                         Container(
                           margin: const EdgeInsets.only(left: 0.5),
                           child: Transform.translate(
                             offset: const Offset(15, -0.0),
                             child: FavoriteIcon(
                               isFavorite: widget.product['isFavorite'] ?? true,
                               iconSize: 20.0,
                               size: 24.0,
                               onPressed: widget.onToggleFavorite,
                               colors: const FavoriteIconColors(
                                 activeColor: AppColors.digitalRed,
                                 inactiveColor: AppColors.grayMedium,
                               ),
                             ),
                           ),
                         ),
                         // Botón de opciones (tres puntos) - solo si está habilitado
                         if (widget.showOptionsMenu)
                           Container(
                             margin: const EdgeInsets.only(left: 0.0),
                             child: Transform.translate(
                               offset: const Offset(10, -11),
                               child: CompositedTransformTarget(
                                 link: _layerLink,
                                 child: IconButton(
                                   onPressed: () {
                                     if (_showOptionsMenu) {
                                       _closeOverlay();
                                     } else {
                                       setState(() {
                                         _showOptionsMenu = true;
                                       });
                                       _showOptionsOverlay();
                                     }
                                   },
                                   icon: Icon(
                                     Icons.more_vert,
                                     color: _showOptionsMenu
                                         ? AppColors.greenFree
                                         : AppColors.grayMedium,
                                     size: 20,
                                   ),
                                   padding: EdgeInsets.zero,
                                   constraints: const BoxConstraints(
                                     minWidth: 24,
                                     minHeight: 24,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                       ],
                     ),
                  ],
                ),

                const SizedBox(height: 10.0),

                // Precios y botón en la misma línea
                Row(
                  children: [
                    // Precio público con fondo backCards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: 1.0,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backCards,
                            borderRadius: BorderRadius.circular(29.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'InterVariable',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.warmGray,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.grayMedium,
                                ),
                              ),
                              Text(
                                _formatNumber(
                                  (widget.product['publicPrice'] ?? 0.0).toInt(),
                                ),
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'InterVariable',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.warmGray,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.grayMedium,
                                ),
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'InterVariable',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.warmGray,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.warmGray,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, -4),
                                child: Text(
                                  ((widget.product['publicPrice'] ?? 0.0) -
                                          (widget.product['publicPrice'] ?? 0.0)
                                              .toInt())
                                      .toStringAsFixed(2)
                                      .substring(2),
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    fontFamily: 'InterVariable',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.warmGray,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.warmGray,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                'Público',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontFamily: 'InterVariable',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.warmGray,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8.0),

                        // Precio mayorista
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'InterVariable',
                                fontWeight: FontWeight.w600,
                                color: AppColors.orangeBrand,
                              ),
                            ),
                            Text(
                              _formatNumber(
                                (widget.product['wholesalePrice'] ?? 0.0).toInt(),
                              ),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'InterVariable',
                                fontWeight: FontWeight.w600,
                                color: AppColors.orangeBrand,
                              ),
                            ),
                            Text(
                              '.',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'InterVariable',
                                fontWeight: FontWeight.w600,
                                color: AppColors.orangeBrand,
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -8),
                              child: Text(
                                ((widget.product['wholesalePrice'] ?? 0.0) -
                                        (widget.product['wholesalePrice'] ?? 0.0)
                                            .toInt())
                                    .toStringAsFixed(2)
                                    .substring(2),
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'InterVariable',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.orangeBrand,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              'Mayorista',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'InterVariable',
                                fontWeight: FontWeight.w400,
                                color: AppColors.warmGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Spacer(),

                                         // Botón de agregar
                     SizedBox(
                       width: 110.0,
                       height: 32.0,
                       child: ElevatedButton(
                         onPressed: widget.onAddToCart,
                         style: ElevatedButton.styleFrom(
                           backgroundColor: AppColors.orangeBrand,
                           foregroundColor: AppColors.white,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(40.0),
                           ),
                           elevation: 0,
                           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                         ),
                         child: const Text(
                           'Agregar',
                           style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w600,
                             fontFamily: 'InterVariable',
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ),
                     ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
