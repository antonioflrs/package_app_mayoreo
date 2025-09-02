import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el DiscountTiersWidget
class DiscountTiersWidgetContent extends StatefulWidget {
  const DiscountTiersWidgetContent({super.key});

  @override
  State<DiscountTiersWidgetContent> createState() =>
      _DiscountTiersWidgetContentState();
}

class _DiscountTiersWidgetContentState
    extends State<DiscountTiersWidgetContent> {
  double _currentTotal = 5000.0;
  DiscountTier _selectedTier = DiscountTier.tier1;
  double _selectedDiscount = 32.0;

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Discount Tiers Widget',
      componentDescription:
          'Widget personalizable para mostrar niveles de descuento con barra de progreso. Permite a los usuarios seleccionar diferentes niveles de descuento basados en el monto total de su compra.',
      examples: [
        ComponentExample(
          id: 'basic-usage',
          title: 'Uso básico',
          description:
              'Widget de niveles de descuento con configuración por defecto (32%, 37%, 42%)',
          codeExample: '''
DiscountTiersWidget(
  currentTotal: 5000.0,
  selectedTier: DiscountTier.tier1,
  onTierSelected: (tier, discount) {
    print('Nivel seleccionado: \$tier, Descuento: \${discount}%');
  },
)
          ''',
          previewWidget: _buildBasicExample(),
        ),
        ComponentExample(
          id: 'interactive-example',
          title: 'Ejemplo interactivo',
          description:
              'Widget con controles para cambiar el monto total y ver el comportamiento dinámico',
          codeExample: '''
// Estado del widget
double currentTotal = 5000.0;
DiscountTier selectedTier = DiscountTier.tier1;

DiscountTiersWidget(
  currentTotal: currentTotal,
  selectedTier: selectedTier,
  onTierSelected: (tier, discount) {
    setState(() {
      selectedTier = tier;
    });
    print('Descuento aplicado: \${discount}%');
  },
)
          ''',
          previewWidget: _buildInteractiveExample(),
        ),
        ComponentExample(
          id: 'custom-config',
          title: 'Configuración personalizada',
          description: 'Widget con niveles de descuento personalizados',
          codeExample: '''
final customConfig = {
  DiscountTier.tier1: {
    'discount': 25.0,
    'minAmount': 5000.0,
    'label': '-25%',
  },
  DiscountTier.tier2: {
    'discount': 35.0,
    'minAmount': 10000.0,
    'label': '-35%',
  },
  DiscountTier.tier3: {
    'discount': 45.0,
    'minAmount': 15000.0,
    'label': '-45%',
  },
};

DiscountTiersWidget(
  currentTotal: 8000.0,
  selectedTier: DiscountTier.tier2,
  customTierConfig: customConfig,
  onTierSelected: (tier, discount) {
    print('Nivel: \$tier, Descuento: \${discount}%');
  },
)
          ''',
          previewWidget: _buildCustomConfigExample(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'currentTotal',
          type: 'double',
          required: true,
          description: 'Monto total actual de la compra',
        ),
        ComponentProperty(
          name: 'onTierSelected',
          type: 'Function(DiscountTier tier, double discountPercentage)',
          required: true,
          description:
              'Callback que se ejecuta cuando se selecciona un nivel de descuento',
        ),
        ComponentProperty(
          name: 'selectedTier',
          type: 'DiscountTier',
          required: false,
          description:
              'Nivel de descuento seleccionado por defecto (por defecto: DiscountTier.tier1)',
        ),
        ComponentProperty(
          name: 'customTierConfig',
          type: 'Map<DiscountTier, Map<String, dynamic>>?',
          required: false,
          description:
              'Configuración personalizada de los niveles de descuento',
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DiscountTiersWidget(
        currentTotal: 5000.0,
        selectedTier: DiscountTier.tier1,
        onTierSelected: (tier, discount) {
          // Ejemplo básico sin estado
        },
      ),
    );
  }

  Widget _buildInteractiveExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          // Controles para cambiar el monto
          Row(
            children: [
              Text(
                'Monto total: \$${_currentTotal.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 45),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  backgroundColor: AppColors.softGray,
                  foregroundColor: AppColors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentTotal = (_currentTotal - 1000).clamp(0, 25000);
                  });
                },
                child: const Text('-1000'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  backgroundColor: AppColors.softGray,
                  foregroundColor: AppColors.black,
                ),
                onPressed: () {
                  setState(() {
                    _currentTotal = (_currentTotal + 1000).clamp(0, 25000);
                  });
                },
                child: const Text('+1000'),
              ),
            ],
          ),
          const SizedBox(height:25),
          // Widget de niveles de descuento
          DiscountTiersWidget(
            currentTotal: _currentTotal,
            selectedTier: _selectedTier,
            onTierSelected: (tier, discount) {
              setState(() {
                _selectedTier = tier;
                _selectedDiscount = discount;
              });
            },
          ),
          const SizedBox(height: 16),
          // Información del nivel seleccionado
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nivel seleccionado: ${_selectedTier.name}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Descuento: ${_selectedDiscount.toStringAsFixed(0)}%'),
                Text('Monto actual: \$${_currentTotal.toStringAsFixed(0)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomConfigExample() {
    final customConfig = {
      DiscountTier.tier1: {
        'discount': 25.0,
        'minAmount': 5000.0,
        'label': '-25%',
      },
      DiscountTier.tier2: {
        'discount': 35.0,
        'minAmount': 10000.0,
        'label': '-35%',
      },
      DiscountTier.tier3: {
        'discount': 45.0,
        'minAmount': 15000.0,
        'label': '-45%',
      },
    };

    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DiscountTiersWidget(
        currentTotal: 8000.0,
        selectedTier: DiscountTier.tier2,
        customTierConfig: customConfig,
        onTierSelected: (tier, discount) {
          // Ejemplo con configuración personalizada
        },
      ),
    );
  }
}
