import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/src/theme/colors/app_colors.dart';
import 'dart:async';

/// Widget de banner promocional con contador regresivo configurable
///
/// Muestra un banner personalizable con dos modos:
/// - Modo imagen: Banner con imagen de fondo + contador opcional
/// - Modo texto: Banner con fondo negro + texto blanco + contador opcional
///
/// El contador solo aparece cuando hay tiempo activo (expirationDate válida)
class BienestarBanner extends StatefulWidget {
  /// URL de la imagen de fondo del banner (modo imagen)
  final String? imageUrl;

  /// Asset local de la imagen (modo imagen, alternativa a imageUrl)
  final String? imageAsset;

  /// Título principal del banner (modo texto)
  final String? title;

  /// Subtítulo o descripción del banner (modo texto)
  final String? subtitle;

  /// Color de fondo del contador (por defecto AppColors.orangeBrand)
  final Color? counterBackgroundColor;

  /// Color del texto del contador (por defecto Colors.white)
  final Color? counterTextColor;

  /// Fecha de vencimiento de la promoción
  final DateTime? expirationDate;

  /// Mostrar u ocultar el contador (por defecto true)
  final bool showCounter;

  /// Texto personalizado para las etiquetas del contador
  final Map<String, String>? counterLabels;

  /// Margen horizontal del banner principal
  final double bannerMargin;

  /// Margen horizontal del contador
  final double counterMargin;

  /// Altura del banner principal
  final double bannerHeight;

    /// Altura del contador
  final double counterHeight;
  
  /// Ancho del banner principal (por defecto null = ancho completo)
  final double? bannerWidth;
  
  /// Ancho del contador (por defecto null = ancho completo)
  final double? counterWidth;
  
  /// Radio de borde del banner
  final double borderRadius;
  
  /// Radio de borde del contador
  final double counterBorderRadius;

  const BienestarBanner({
    super.key,
    this.imageUrl,
    this.imageAsset,
    this.title,
    this.subtitle,
    this.counterBackgroundColor,
    this.counterTextColor,
    this.expirationDate,
    this.showCounter = true,
    this.counterLabels,
    this.bannerMargin = 16.0,
    this.counterMargin = 34.0,
    this.bannerHeight = 60.0,
    this.counterHeight = 28.0,
    this.bannerWidth,
    this.counterWidth,
    this.borderRadius = 12.0,
    this.counterBorderRadius = 12.0,
  }) : assert(
         // Debe ser modo imagen O modo texto, no ambos
         (imageUrl != null || imageAsset != null) !=
             (title != null || subtitle != null),
         'Debes elegir entre modo imagen (imageUrl/imageAsset) o modo texto (title/subtitle), no ambos',
       );

  @override
  State<BienestarBanner> createState() => _BienestarBannerState();
}

class _BienestarBannerState extends State<BienestarBanner> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  // Etiquetas por defecto del contador
  static const Map<String, String> _defaultLabels = {
    'days': 'Días',
    'hours': 'Hs',
    'minutes': 'Min',
    'seconds': 'Seg',
  };

  /// Determina si el widget está en modo imagen
  bool get _isImageMode => widget.imageUrl != null || widget.imageAsset != null;

  /// Determina si debe mostrar el contador (tiempo activo Y showCounter = true)
  bool get _shouldShowCounter =>
      widget.showCounter &&
      widget.expirationDate != null &&
      widget.expirationDate!.isAfter(DateTime.now());

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  void didUpdateWidget(BienestarBanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reinicializar timer si cambió la fecha de expiración o showCounter
    if (oldWidget.expirationDate != widget.expirationDate ||
        oldWidget.showCounter != widget.showCounter) {
      _timer?.cancel();
      _initializeTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _initializeTimer() {
    if (widget.expirationDate != null && widget.showCounter) {
      _updateRemainingTime();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            _updateRemainingTime();
          });
        }
      });
    }
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    if (widget.expirationDate != null && widget.expirationDate!.isAfter(now)) {
      _remainingTime = widget.expirationDate!.difference(now);
    } else {
      _remainingTime = Duration.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Banner principal
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: widget.bannerMargin,
            vertical: 0.0,
          ),
          width: widget.bannerWidth,
          height: widget.bannerHeight,
          decoration: _buildBannerDecoration(),
          child: _buildBannerContent(),
        ),

        // Contador (solo si hay tiempo activo Y showCounter = true)
        if (_shouldShowCounter) ...[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.counterMargin,
              vertical: 0.0,
            ),
            width: widget.counterWidth,
            height: widget.counterHeight,
            decoration: BoxDecoration(
              color: widget.counterBackgroundColor ?? AppColors.orangeBrand,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(widget.counterBorderRadius),
                bottomRight: Radius.circular(widget.counterBorderRadius),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Días
                  _buildTimeUnit(
                    _getDays().toString(),
                    _getCounterLabel('days'),
                  ),
                  _buildSeparator(),
                  // Horas
                  _buildTimeUnit(
                    _getHours().toString().padLeft(2, '0'),
                    _getCounterLabel('hours'),
                  ),
                  _buildSeparator(),
                  // Minutos
                  _buildTimeUnit(
                    _getMinutes().toString().padLeft(2, '0'),
                    _getCounterLabel('minutes'),
                  ),
                  _buildSeparator(),
                  // Segundos
                  _buildTimeUnit(
                    _getSeconds().toString().padLeft(2, '0'),
                    _getCounterLabel('seconds'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  BoxDecoration _buildBannerDecoration() {
    if (_isImageMode) {
      // Modo imagen: imagen de fondo con bordes redondeados
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        image: DecorationImage(image: _getImageProvider(), fit: BoxFit.cover),
      );
    } else {
      // Modo texto: fondo negro con bordes redondeados
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: Colors.black,
      );
    }
  }

  Widget _buildBannerContent() {
    if (_isImageMode) {
      // Modo imagen: solo imagen de fondo (sin texto superpuesto)
      return const SizedBox.shrink();
    } else {
      // Modo texto: título y subtítulo en blanco
      if (widget.title == null && widget.subtitle == null) {
        return const SizedBox.shrink();
      }

      return Container(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 5.0, bottom: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.title != null)
              Text(
                widget.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'InterVariable',
                  fontWeight: FontWeight.w700,
                  fontFeatures: [FontFeature('ss01'), FontFeature('cv11')],
                ),
              ),
            if (widget.subtitle != null) ...[
              if (widget.title != null) const SizedBox(height: 0),
              Text(
                widget.subtitle!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'InterVariable',
                ),
              ),
            ],
          ],
        ),
      );
    }
  }

  ImageProvider _getImageProvider() {
    if (widget.imageUrl != null) {
      return NetworkImage(widget.imageUrl!);
    } else {
      return AssetImage(widget.imageAsset!) as ImageProvider;
    }
  }

  String _getCounterLabel(String key) {
    final labels = widget.counterLabels ?? _defaultLabels;
    return labels[key] ?? _defaultLabels[key]!;
  }

  int _getDays() {
    if (widget.expirationDate == null) return 0;
    return _remainingTime.inDays;
  }

  int _getHours() {
    if (widget.expirationDate == null) return 0;
    return _remainingTime.inHours % 24;
  }

  int _getMinutes() {
    if (widget.expirationDate == null) return 0;
    return _remainingTime.inMinutes % 60;
  }

  int _getSeconds() {
    if (widget.expirationDate == null) return 0;
    return _remainingTime.inSeconds % 60;
  }

  Widget _buildTimeUnit(String number, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          number,
          style: TextStyle(
            color: widget.counterTextColor ?? Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'InterVariable',
            fontFeatures: const [FontFeature('cv11')],
            shadows: [
              Shadow(
                offset: const Offset(0, 0),
                blurRadius: 0.5,
                color: widget.counterTextColor ?? Colors.white,
              ),
            ],
          ),
        ),
        const SizedBox(width: 4.0),
        Transform.translate(
          offset: const Offset(0, -3),
          child: Text(
            label,
            style: TextStyle(
              color: widget.counterTextColor ?? Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'InterVariable',
              fontFeatures: const [FontFeature('ss01'), FontFeature('cv11')],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        ':',
        style: TextStyle(
          color: widget.counterTextColor ?? Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'InterVariable',
          fontFeatures: const [FontFeature('ss01'), FontFeature('cv11')],
        ),
      ),
    );
  }
}
