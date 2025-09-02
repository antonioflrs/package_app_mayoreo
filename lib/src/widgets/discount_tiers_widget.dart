import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Enum que define los niveles de descuento disponibles
enum DiscountTier {
  tier1, // 32% - $7,500 mínimo
  tier2, // 37% - $14,000 mínimo
  tier3, // 42% - $20,000 mínimo
}

/// Widget personalizable para mostrar niveles de descuento con barra de progreso
/// 
/// Este widget permite a los usuarios seleccionar diferentes niveles de descuento
/// basados en el monto total de su compra, mostrando el progreso hacia el siguiente nivel.
class DiscountTiersWidget extends StatefulWidget {
  /// Monto total actual de la compra
  final double currentTotal;
  
  /// Callback que se ejecuta cuando se selecciona un nivel de descuento
  final Function(DiscountTier tier, double discountPercentage) onTierSelected;
  
  /// Nivel de descuento seleccionado por defecto
  final DiscountTier selectedTier;
  
  /// Configuración personalizada de los niveles de descuento
  final Map<DiscountTier, Map<String, dynamic>>? customTierConfig;

  const DiscountTiersWidget({
    super.key,
    required this.currentTotal,
    required this.onTierSelected,
    this.selectedTier = DiscountTier.tier1,
    this.customTierConfig,
  });

  @override
  State<DiscountTiersWidget> createState() => _DiscountTiersWidgetState();
}

class _DiscountTiersWidgetState extends State<DiscountTiersWidget> {
  late DiscountTier _selectedTier;

  // Configuración por defecto de los niveles de descuento
  static const Map<DiscountTier, Map<String, dynamic>> _defaultTierConfig = {
    DiscountTier.tier1: {
      'discount': 32.0,
      'minAmount': 7500.0,
      'label': '-32%',
    },
    DiscountTier.tier2: {
      'discount': 37.0,
      'minAmount': 14000.0,
      'label': '-37%',
    },
    DiscountTier.tier3: {
      'discount': 42.0,
      'minAmount': 20000.0,
      'label': '-42%',
    },
  };

  /// Obtiene la configuración de niveles (personalizada o por defecto)
  Map<DiscountTier, Map<String, dynamic>> get _tierConfig {
    return widget.customTierConfig ?? _defaultTierConfig;
  }

  @override
  void initState() {
    super.initState();
    _selectedTier = widget.selectedTier;
  }

  @override
  void didUpdateWidget(DiscountTiersWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTier != widget.selectedTier) {
      _selectedTier = widget.selectedTier;
    }
  }

  /// Selecciona un nivel de descuento y ejecuta el callback
  void _selectTier(DiscountTier tier) {
    setState(() {
      _selectedTier = tier;
    });

    final config = _tierConfig[tier]!;
    final discountPercentage = config['discount'] as double;
    widget.onTierSelected(tier, discountPercentage);
  }

  /// Calcula el porcentaje de progreso hacia el nivel seleccionado
  double _getProgressPercentage() {
    final config = _tierConfig[_selectedTier]!;
    final minAmount = config['minAmount'] as double;

    if (widget.currentTotal >= minAmount) return 1.0;
    return widget.currentTotal / minAmount;
  }

  /// Calcula el monto restante para alcanzar el nivel seleccionado
  double _getRemainingAmount() {
    final config = _tierConfig[_selectedTier]!;
    final minAmount = config['minAmount'] as double;

    if (widget.currentTotal >= minAmount) return 0.0;
    return minAmount - widget.currentTotal;
  }

  /// Verifica si un nivel está desbloqueado
  bool _isTierUnlocked(DiscountTier tier) {
    final config = _tierConfig[tier]!;
    final minAmount = config['minAmount'] as double;
    return widget.currentTotal >= minAmount;
  }

  @override
  Widget build(BuildContext context) {
    final config = _tierConfig[_selectedTier]!;
    final minAmount = config['minAmount'] as double;
    final progressPercentage = _getProgressPercentage();
    final remainingAmount = _getRemainingAmount();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
        top: 0.0,
        bottom: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Niveles de descuento
          Row(
            children: DiscountTier.values.map((tier) {
              final tierConfig = _tierConfig[tier]!;
              final isSelected = _selectedTier == tier;
              final isUnlocked = _isTierUnlocked(tier);

              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: tier != DiscountTier.tier3 ? 8.0 : 0.0,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _selectTier(tier),
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 3.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.orangeBrand
                              : (isUnlocked
                                    ? AppColors.backCards
                                    : AppColors.softGray),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Center(
                          child: Text(
                            tierConfig['label'],
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.white
                                  : (isUnlocked
                                        ? AppColors.black
                                        : AppColors.grayMedium),
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

          const SizedBox(height: 8.0),

          // Barra de progreso
          Container(
            width: double.infinity,
            height: 10.0,
            decoration: BoxDecoration(
              color: AppColors.silverGrayMedium,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progressPercentage,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.limeGreen,
                      AppColors.truGreen,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8.0),

          // Información de compra mínima
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Compra mínima
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Compra mínima',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'InterVariable',
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 4.0),
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
              const SizedBox(width: 10),
              // Cantidad faltante
              if (remainingAmount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkGray,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Te faltan ',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'InterVariable',
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
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
                              fontSize: 12.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                          // Parte entera del precio
                          Text(
                            _formatNumber(remainingAmount.toInt()),
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                          // Punto decimal
                          Text(
                            '.',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'InterVariable',
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                          // Decimales como superíndice
                          Transform.translate(
                            offset: const Offset(0, -4),
                            child: Text(
                              (remainingAmount - remainingAmount.toInt()).toStringAsFixed(2).substring(2),
                              style: TextStyle(
                                fontSize: 10.0,
                                fontFamily: 'InterVariable',
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
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
        ],
      ),
    );
  }

  /// Método para formatear números con comas en los centenares
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
  }

  // Getters para acceder al estado desde fuera
  DiscountTier get selectedTier => _selectedTier;
  double get selectedDiscountPercentage =>
      _tierConfig[_selectedTier]!['discount'] as double;
  double get selectedMinAmount =>
      _tierConfig[_selectedTier]!['minAmount'] as double;
  bool get isMinAmountReached => widget.currentTotal >= selectedMinAmount;
}
