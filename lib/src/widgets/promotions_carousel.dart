import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/src/theme/colors/app_colors.dart';

/// Widget de carrusel de promociones completamente personalizable
///
/// Muestra un carrusel de imágenes con:
/// - Autoplay configurable
/// - Controles de play/pause opcionales
/// - Indicadores de página personalizables
/// - Dimensiones ajustables
/// - Manejo de errores y carga
class PromotionsCarousel extends StatefulWidget {
  /// Lista de URLs de imágenes para el carrusel
  final List<String> images;
  
  /// Altura del carrusel (por defecto 190.0)
  final double height;
  
  /// Ancho del carrusel (por defecto null = ancho completo)
  final double? width;
  
  /// Mostrar controles de play/pause (por defecto true)
  final bool showPlayPauseControls;
  
  /// Color de los indicadores activos (por defecto AppColors.grayMedium)
  final Color? activeIndicatorColor;
  
  /// Color de los indicadores inactivos (por defecto AppColors.grayMedium con 0.3 opacidad)
  final Color? inactiveIndicatorColor;
  
  /// Color de fondo del botón play/pause (por defecto negro con 0.5 opacidad)
  final Color? playPauseBackgroundColor;
  
  /// Color del icono play/pause (por defecto blanco)
  final Color? playPauseIconColor;
  
  /// Margen horizontal del carrusel (por defecto 16.0)
  final double horizontalMargin;
  
  /// Margen vertical del carrusel (por defecto 8.0)
  final double verticalMargin;
  
  /// Radio de borde del carrusel (por defecto 12.0)
  final double borderRadius;
  
  /// Duración del autoplay en segundos (por defecto 3)
  final int autoplayDuration;
  
  /// Duración de la transición entre imágenes en milisegundos (por defecto 500)
  final int transitionDuration;
  
  /// Curva de animación para las transiciones (por defecto Curves.easeInOut)
  final Curve transitionCurve;
  
  /// Mostrar indicadores de página (por defecto true si hay más de 1 imagen)
  final bool? showIndicators;
  
  /// Espaciado entre indicadores (por defecto 4.0)
  final double indicatorSpacing;
  
  /// Ancho del indicador activo (por defecto 24.0)
  final double activeIndicatorWidth;
  
  /// Ancho del indicador inactivo (por defecto 8.0)
  final double inactiveIndicatorWidth;
  
  /// Altura de los indicadores (por defecto 8.0)
  final double indicatorHeight;
  
  /// Radio de borde de los indicadores (por defecto 4.0)
  final double indicatorBorderRadius;

  const PromotionsCarousel({
    super.key,
    required this.images,
    this.height = 190.0,
    this.width,
    this.showPlayPauseControls = true,
    this.activeIndicatorColor,
    this.inactiveIndicatorColor,
    this.playPauseBackgroundColor,
    this.playPauseIconColor,
    this.horizontalMargin = 16.0,
    this.verticalMargin = 8.0,
    this.borderRadius = 12.0,
    this.autoplayDuration = 3,
    this.transitionDuration = 500,
    this.transitionCurve = Curves.easeInOut,
    this.showIndicators,
    this.indicatorSpacing = 4.0,
    this.activeIndicatorWidth = 24.0,
    this.inactiveIndicatorWidth = 8.0,
    this.indicatorHeight = 8.0,
    this.indicatorBorderRadius = 4.0,
  });

  @override
  State<PromotionsCarousel> createState() => _PromotionsCarouselState();
}

class _PromotionsCarouselState extends State<PromotionsCarousel>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _autoPlayController;
  int _currentIndex = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _autoPlayController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.autoplayDuration),
    );

    // Iniciar animación automática solo si hay más de 1 imagen
    if (widget.images.length > 1) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoPlayController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    if (widget.images.isNotEmpty && widget.images.length > 1) {
      _autoPlayController.addStatusListener((status) {
        if (status == AnimationStatus.completed && !_isPaused) {
          _nextImage();
          _autoPlayController.reset();
          _autoPlayController.forward();
        }
      });
      _autoPlayController.forward();
    }
  }

  void _nextImage() {
    if (_currentIndex < widget.images.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _pageController.animateToPage(
      _currentIndex,
      duration: Duration(milliseconds: widget.transitionDuration),
      curve: widget.transitionCurve,
    );
  }

  void _togglePause() {
    if (!widget.showPlayPauseControls || widget.images.length <= 1) return;
    
    setState(() {
      _isPaused = !_isPaused;
    });

    if (_isPaused) {
      _autoPlayController.stop();
    } else {
      _autoPlayController.forward();
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
    
    // Reiniciar el timer cuando el usuario cambia manualmente
    if (!_isPaused && widget.images.length > 1) {
      _autoPlayController.reset();
      _autoPlayController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Si no hay imágenes, mostrar un placeholder
    if (widget.images.isEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: widget.horizontalMargin,
          vertical: widget.verticalMargin,
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightTan,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius - 2),
          child: Container(
            color: AppColors.softGray,
            child: Icon(
              Icons.image,
              size: 50,
              color: AppColors.mysticGray,
            ),
          ),
        ),
      );
    }

    final shouldShowIndicators = widget.showIndicators ?? widget.images.length > 1;
    final totalHeight = widget.height + (shouldShowIndicators ? 20.0 : 0.0);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.horizontalMargin,
        vertical: widget.verticalMargin,
      ),
      width: widget.width,
      height: totalHeight,
      child: Column(
        children: [
          // Carrusel de imágenes
          GestureDetector(
            onTap: _togglePause,
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius - 2),
                child: Stack(
                  children: [
                    // Carrusel de imágenes
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(widget.borderRadius - 2),
                            child: Image.network(
                              widget.images[index],
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppColors.softGray,
                                  child: Icon(
                                    Icons.error,
                                    size: 50,
                                    color: AppColors.mysticGray,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    
                    // Indicador de pausa/play
                    if (widget.showPlayPauseControls && widget.images.length > 1)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: widget.playPauseBackgroundColor ?? 
                                   AppColors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            _isPaused ? Icons.play_arrow : Icons.pause,
                            color: widget.playPauseIconColor ?? AppColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          
          // Indicadores de página
          if (shouldShowIndicators)
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: index == _currentIndex 
                        ? widget.activeIndicatorWidth 
                        : widget.inactiveIndicatorWidth,
                    height: widget.indicatorHeight,
                    margin: EdgeInsets.symmetric(horizontal: widget.indicatorSpacing),
                    decoration: BoxDecoration(
                      color: index == _currentIndex
                          ? widget.activeIndicatorColor ?? AppColors.grayMedium
                          : (widget.inactiveIndicatorColor ?? 
                             (widget.activeIndicatorColor ?? AppColors.grayMedium).withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(widget.indicatorBorderRadius),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
