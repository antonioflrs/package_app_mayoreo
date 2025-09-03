import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el DiscountTiersWidgetLogout
class DiscountTiersWidgetLogoutContent extends StatefulWidget {
  const DiscountTiersWidgetLogoutContent({super.key});

  @override
  State<DiscountTiersWidgetLogoutContent> createState() =>
      _DiscountTiersWidgetLogoutContentState();
}

class _DiscountTiersWidgetLogoutContentState
    extends State<DiscountTiersWidgetLogoutContent> {
  DiscountTierLogout? _selectedTier;
  double? _selectedDiscount;

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Discount Tiers Widget Logout',
      componentDescription:
          'Widget personalizable para mostrar niveles de descuento con banner de "Aplicar Descuento" y botones de selección. Diseñado para usuarios no autenticados con información de compra mínima.',
      examples: [
        ComponentExample(
          id: 'basic-usage',
          title: 'Uso básico',
          description:
              'Widget de niveles de descuento con configuración por defecto (32%, 37%, 42%) y banner de aplicación',
          codeExample: '''
DiscountTiersWidgetLogout(
  onTierSelected: (tier, discount) {
    print('Nivel seleccionado: \$tier, Descuento: \${discount}%');
  },
)
          ''',
          previewWidget: _buildBasicExample(),
        ),
        ComponentExample(
          id: 'with-selection',
          title: 'Con selección inicial',
          description:
              'Widget con un nivel de descuento preseleccionado y información de compra mínima visible',
          codeExample: '''
DiscountTiersWidgetLogout(
  selectedTier: DiscountTierLogout.tier2,
  onTierSelected: (tier, discount) {
    print('Nivel: \$tier, Descuento: \${discount}%');
  },
)
          ''',
          previewWidget: _buildWithSelectionExample(),
        ),
        ComponentExample(
          id: 'interactive-example',
          title: 'Ejemplo interactivo',
          description:
              'Widget con controles para seleccionar diferentes niveles y ver la información de compra mínima',
          codeExample: '''
// Estado del widget
DiscountTierLogout? selectedTier;
double? selectedDiscount;

DiscountTiersWidgetLogout(
  selectedTier: selectedTier,
  onTierSelected: (tier, discount) {
    setState(() {
      selectedTier = tier;
      selectedDiscount = discount;
    });
    print('Descuento aplicado: \${discount}%');
  },
)
          ''',
          previewWidget: _buildInteractiveExample(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'onTierSelected',
          type: 'Function(DiscountTierLogout tier, double discountPercentage)',
          required: true,
          description:
              'Callback que se ejecuta cuando se selecciona un nivel de descuento',
        ),
        ComponentProperty(
          name: 'selectedTier',
          type: 'DiscountTierLogout?',
          required: false,
          description:
              'Nivel de descuento seleccionado por defecto (opcional)',
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DiscountTiersWidgetLogout(
        onTierSelected: (tier, discount) {
          // Ejemplo básico sin estado
        },
      ),
    );
  }

  Widget _buildWithSelectionExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: DiscountTiersWidgetLogout(
        selectedTier: DiscountTierLogout.tier2,
        onTierSelected: (tier, discount) {
          // Ejemplo con selección inicial
        },
      ),
    );
  }

  Widget _buildInteractiveExample() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          // Widget de niveles de descuento
          DiscountTiersWidgetLogout(
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
          if (_selectedTier != null) ...[
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
                    'Nivel seleccionado: ${_selectedTier!.name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Descuento: ${_selectedDiscount?.toStringAsFixed(0) ?? 'N/A'}%'),
                  Text('Compra mínima: \$${_getMinAmountForTier(_selectedTier!).toStringAsFixed(0)}'),
                ],
              ),
            ),
          ] else ...[
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Selecciona un nivel de descuento para ver la información',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ],
      ),
    );
  }

  double _getMinAmountForTier(DiscountTierLogout tier) {
    switch (tier) {
      case DiscountTierLogout.tier1:
        return 7500.0;
      case DiscountTierLogout.tier2:
        return 14000.0;
      case DiscountTierLogout.tier3:
        return 20000.0;
    }
  }
}
