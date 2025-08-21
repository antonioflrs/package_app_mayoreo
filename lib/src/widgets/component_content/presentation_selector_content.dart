import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget PresentationSelector
class PresentationSelectorContent extends StatefulWidget {
  const PresentationSelectorContent({super.key});

  @override
  State<PresentationSelectorContent> createState() => _PresentationSelectorContentState();
}

class _PresentationSelectorContentState extends State<PresentationSelectorContent> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Presentation Selector',
      componentDescription: 'Widget personalizable para seleccionar tipo de presentación de producto con imagen, precios, descuentos y cápsulas',
      examples: [
        ComponentExample(
          id: 'selector-basico',
          title: 'Selector básico',
          description: 'Selector de presentaciones con funcionalidad básica y colores por defecto',
          previewWidget: _buildPreview(
            PresentationSelector(
              presentations: _getSamplePresentations(),
              selectedIndex: _selectedIndex,
              onPresentationChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          codeExample: '''
PresentationSelector(
  presentations: [
    PresentationData(
      name: 'Frasco 60 cápsulas',
      description: 'Presentación estándar',
      imageUrl: 'https://example.com/image1.jpg',
      originalPrice: 299.99,
      discountedPrice: 249.99,
      capsules: 60,
    ),
    // Más presentaciones...
  ],
  selectedIndex: 0,
  onPresentationChanged: (index) {
    // Manejar cambio de selección
  },
)
          ''',
        ),
  
        ComponentExample(
          id: 'selector-completamente-personalizado',
          title: 'Selector personalizado',
          description: 'Selector con todas las opciones personalizables, colores específicos y funcionalidades',
          previewWidget: _buildPreview(
            PresentationSelector(
              presentations: _getSamplePresentations(),
              selectedIndex: _selectedIndex,
              onPresentationChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              colors: PresentationSelectorColors(
                titleColor: Colors.purple,
                selectedBorderColor: Colors.purple,
                selectedNameBackgroundColor: Colors.purple,
                discountedPriceColor: Colors.purple[800]!,
              ),
              titleText: 'Presentación Premium',
              cardWidth: 140.0,
              cardHeight: 180.0,
              cardSpacing: 15.0,
              borderRadius: 16.0,
              selectedBorderWidth: 1.0,
              showCapsules: true,
              showOriginalPrice: true,
              showDiscountedPrice: true,
              showImage: true,
              showName: true,
            ),
          ),
          codeExample: '''
PresentationSelector(
  presentations: _presentations,
  selectedIndex: _selectedIndex,
  onPresentationChanged: (index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  colors: PresentationSelectorColors(
    titleColor: Colors.purple,
    selectedBorderColor: Colors.purple,
    selectedNameBackgroundColor: Colors.purple,
    discountedPriceColor: Colors.purple[800]!,
  ),
  titleText: 'Presentación Premium',
  cardWidth: 140.0,
  cardHeight: 180.0,
  cardSpacing: 15.0,
  borderRadius: 16.0,
  selectedBorderWidth: 3.0,
  showCapsules: true,
  showOriginalPrice: true,
  showDiscountedPrice: true,
  showImage: true,
  showName: true,
)
          ''',
        ),
        ComponentExample(
          id: 'selector-solo-precios',
          title: 'Selector solo con precios',
          description: 'Selector que muestra únicamente precios sin imagen ni nombre',
          previewWidget: _buildPreview(
            PresentationSelector(
              presentations: _getSamplePresentations(),
              selectedIndex: _selectedIndex,
              onPresentationChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              titleText: 'Precios por presentación',
              showImage: false,
              showName: true,
              showCapsules: true,
              cardHeight: 80.0,
              cardWidth: 100.0,
            ),
          ),
          codeExample: '''
PresentationSelector(
  presentations: _presentations,
  selectedIndex: _selectedIndex,
  onPresentationChanged: (index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  titleText: 'Precios por presentación',
  showImage: false,
  showName: false,
  showCapsules: true,
  cardHeight: 80.0,
  cardWidth: 100.0,
)
          ''',
        ),
      ],
    );
  }

  Widget _buildPreview(Widget selectorWidget) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: selectorWidget,
    );
  }

  List<PresentationData> _getSamplePresentations() {
    return [
      const PresentationData(
        name: '60 cápsulas',
        description: 'Presentación estándar',
        imageUrl: 'https://picsum.photos/100/100?random=1',
        originalPrice: 299.99,
        discountedPrice: 249.99,
        capsules: 60,
      ),
      const PresentationData(
        name: '120 cápsulas',
        description: 'Presentación familiar',
        imageUrl: 'https://picsum.photos/100/100?random=2',
        originalPrice: 549.99,
        discountedPrice: 449.99,
        capsules: 120,
      ),
      const PresentationData(
        name: '180 cápsulas',
        description: 'Presentación económica',
        imageUrl: 'https://picsum.photos/100/100?random=3',
        originalPrice: 799.99,
        discountedPrice: 649.99,
        capsules: 180,
      ),
      const PresentationData(
        name: '30 cápsulas',
        description: 'Presentación de prueba',
        imageUrl: 'https://picsum.photos/100/100?random=4',
        originalPrice: 159.99,
        discountedPrice: 129.99,
        capsules: 30,
      ),
    ];
  }
}
