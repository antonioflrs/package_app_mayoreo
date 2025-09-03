import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

enum DiscountTierLogout {
  tier1, // 32% - $7,500 mínimo
  tier2, // 37% - $14,000 mínimo
  tier3, // 42% - $20,000 mínimo
}

class DiscountTiersWidgetLogout extends StatefulWidget {
  final Function(DiscountTierLogout tier, double discountPercentage) onTierSelected;
  final DiscountTierLogout? selectedTier;

  const DiscountTiersWidgetLogout({
    super.key,
    required this.onTierSelected,
    this.selectedTier,
  });

  @override
  State<DiscountTiersWidgetLogout> createState() => _DiscountTiersWidgetLogoutState();
}

class _DiscountTiersWidgetLogoutState extends State<DiscountTiersWidgetLogout> {
  DiscountTierLogout? _selectedTier;

  // Configuración de los niveles de descuento
  static const Map<DiscountTierLogout, Map<String, dynamic>> _tierConfig = {
    DiscountTierLogout.tier1: {
      'discount': 32.0,
      'minAmount': 7500.0,
      'label': '-32%',
    },
    DiscountTierLogout.tier2: {
      'discount': 37.0,
      'minAmount': 14000.0,
      'label': '-37%',
    },
    DiscountTierLogout.tier3: {
      'discount': 42.0,
      'minAmount': 20000.0,
      'label': '-42%',
    },
  };

  @override
  void initState() {
    super.initState();
    _selectedTier = widget.selectedTier;
  }

  @override
  void didUpdateWidget(DiscountTiersWidgetLogout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTier != widget.selectedTier) {
      _selectedTier = widget.selectedTier;
    }
  }

  void _selectTier(DiscountTierLogout tier) {
    setState(() {
      _selectedTier = tier;
    });

    final config = _tierConfig[tier]!;
    final discountPercentage = config['discount'] as double;
    widget.onTierSelected(tier, discountPercentage);
  }

  @override
  Widget build(BuildContext context) {
    final hasSelection = _selectedTier != null;
    final config = hasSelection ? _tierConfig[_selectedTier!]! : null;
    final minAmount = config?['minAmount'] as double? ?? 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        top: 0.0,
        bottom: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header "Aplicar Descuento" con punta integrada - Solo se muestra si no hay selección
          if (!hasSelection) ...[
            Center(
              child: SizedBox(
                width: 180,
                height: 32.0,
                child: CustomPaint(
                  painter: BannerWithTailPainter(),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Aplicar ',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFB0B0B0), // Gris claro
                            ),
                          ),
                          Text(
                            'Descuento',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5.0),
          ],

          // Botones de descuento
          Row(
            children: DiscountTierLogout.values.map((tier) {
              final tierConfig = _tierConfig[tier]!;
              final isSelected = _selectedTier == tier;

              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: tier != DiscountTierLogout.tier3 ? 8.0 : 0.0,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _selectTier(tier),
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.orangeBrand // Naranja como en la imagen
                              : AppColors.softGray, // Gris claro
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.ochreBrand
                                : AppColors.oliveBrand, // Borde gris claro
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            tierConfig['label'],
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? AppColors.white
                                  : const Color(0xFF666666), // Gris medio
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          // Información de compra mínima - Solo se muestra si hay selección
          if (hasSelection) ...[
            const SizedBox(height: 16.0),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Compra mínima ',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'InterVariable',
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  // Precio con formato de decimales pequeños y arriba
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
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      // Parte entera del precio
                      Text(
                        _formatNumber(minAmount.toInt()),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      // Punto decimal
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      // Decimales como superíndice
                      Transform.translate(
                        offset: const Offset(0, -6),
                        child: Text(
                          (minAmount - minAmount.toInt()).toStringAsFixed(2).substring(2),
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'InterVariable',
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Método para formatear números con comas en los centenares
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
  }

  // Getters para acceder al estado desde fuera
  DiscountTierLogout? get selectedTier => _selectedTier;
  double? get selectedDiscountPercentage =>
      _selectedTier != null ? _tierConfig[_selectedTier!]!['discount'] as double : null;
  double? get selectedMinAmount =>
      _selectedTier != null ? _tierConfig[_selectedTier!]!['minAmount'] as double : null;
}

// Custom painter para dibujar el banner con punta triangular integrada
class BannerWithTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4A4A4A) // Gris oscuro como en la imagen
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Radio para las esquinas redondeadas
    final cornerRadius = 8.0;
    final tailHeight = 8.0; // Altura de la punta triangular
    final tailWidth = 16.0; // Ancho de la punta triangular
    
    // Empezar desde la esquina superior izquierda
    path.moveTo(cornerRadius, 0);
    
    // Lado superior con esquinas redondeadas
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
    
    // Lado derecho con esquina redondeada inferior
    path.lineTo(size.width, size.height - tailHeight - cornerRadius);
    path.quadraticBezierTo(size.width, size.height - tailHeight, size.width - cornerRadius, size.height - tailHeight);
    
    // Lado derecho de la punta (antes de la punta triangular)
    final centerX = size.width / 2;
    final tailStartY = size.height - tailHeight;
    path.lineTo(centerX + (tailWidth / 2), tailStartY);
    
    // Punta de la flecha
    path.lineTo(centerX, size.height);
    
    // Lado izquierdo de la punta (después de la punta triangular)
    path.lineTo(centerX - (tailWidth / 2), tailStartY);
    
    // Lado izquierdo con esquina redondeada inferior
    path.lineTo(cornerRadius, size.height - tailHeight);
    path.quadraticBezierTo(0, size.height - tailHeight, 0, size.height - tailHeight - cornerRadius);
    
    // Lado izquierdo con esquina redondeada superior
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
