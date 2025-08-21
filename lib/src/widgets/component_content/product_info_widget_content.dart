import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Contenido de documentación para el widget ProductInfoWidget
class ProductInfoWidgetContent extends StatelessWidget {
  const ProductInfoWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Product Info Widget',
      componentDescription:
          'Widget personalizable de información de producto con texto expandible, formato rico y efecto de gradiente',
      examples: [
        ComponentExample(
          id: 'product-info-basico',
          title: 'Información básica',
          description:
              'Widget de información de producto con funcionalidad básica y colores por defecto',
          previewWidget: _buildPreview(
            ProductInfoWidget(productInfo: _getSampleProductInfo()),
          ),
          codeExample: '''
ProductInfoWidget(
  productInfo: ProductInfoData(
    title: 'Vitamina D3 + K2',
    description: 'Suplemento nutricional que combina **vitamina D3** y **vitamina K2** para una **absorción óptima** del calcio y **fortalecimiento óseo**.',
    maxLines: 3,
  ),
)
          ''',
        ),

        ComponentExample(
          id: 'product-info-completamente-personalizado',
          title: 'Información personalizado',
          description:
              'Widget con todas las opciones personalizables, colores específicos y funcionalidades',
          previewWidget: _buildPreview(
            ProductInfoWidget(
              productInfo: _getSampleProductInfo(),
              colors: ProductInfoColors(
                titleColor: const Color.fromARGB(255, 39, 48, 176),
                descriptionColor: Colors.purple[800]!,
                boldTextColor: Colors.purple,
                expandButtonColor: Colors.purple,
                gradientStartColor: Colors.purple[50]!,
                gradientMiddleColor: Colors.purple[100]!,
                gradientEndColor: Colors.purple[50]!,
              ),
              titleFontSize: 18.0,
              descriptionFontSize: 14.0,
              expandButtonFontSize: 16.0,
              gradientHeight: 50.0,
              horizontalPadding: 12.0,
              verticalPadding: 12.0,
              expandButtonTopPadding: 8.0,
              titleBottomSpacing: 20.0,
              descriptionBottomSpacing: 12.0,
              expandText: 'Expandir información',
              collapseText: 'Contraer información',
              maxLines: 3,
            ),
          ),
          codeExample: '''
ProductInfoWidget(
  productInfo: _productInfo,
  colors: ProductInfoColors(
    titleColor: Colors.purple,
    descriptionColor: Colors.purple[800]!,
    boldTextColor: Colors.purple,
    expandButtonColor: Colors.purple,
    gradientStartColor: Colors.purple[50]!,
    gradientMiddleColor: Colors.purple[100]!,
    gradientEndColor: Colors.purple[50]!,
  ),
  titleFontSize: 22.0,
  descriptionFontSize: 18.0,
  expandButtonFontSize: 16.0,
  gradientHeight: 50.0,
  horizontalPadding: 16.0,
  verticalPadding: 16.0,
  expandButtonTopPadding: 8.0,
  titleBottomSpacing: 20.0,
  descriptionBottomSpacing: 12.0,
  expandText: 'Expandir información',
  collapseText: 'Contraer información',
  maxLines: 2,
)
          ''',
        ),
        ComponentExample(
          id: 'product-info-sin-titulo',
          title: 'Información sin título',
          description:
              'Widget que muestra solo la descripción sin el título del producto',
          previewWidget: _buildPreview(
            ProductInfoWidget(
              productInfo: _getSampleProductInfo(),
              showTitle: false,
              horizontalPadding: 16.0,
            ),
          ),
          codeExample: '''
ProductInfoWidget(
  productInfo: _productInfo,
  showTitle: false,
  horizontalPadding: 16.0,
)
          ''',
        ),
      ],
    );
  }

  Widget _buildPreview(Widget productInfoWidget) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: productInfoWidget,
    );
  }

  ProductInfoData _getSampleProductInfo() {
    return const ProductInfoData(
      title: 'Vitamina D3 + K2 Premium',
      description:
          'Suplemento nutricional de **alta calidad** que combina **vitamina D3** (colecalciferol) y **vitamina K2** (menaquinona-7) para una **absorción óptima** del calcio y **fortalecimiento óseo**.\n\nLa **vitamina D3** ayuda a **absorber el calcio** de los alimentos, mientras que la **vitamina K2** asegura que el calcio se **deposite en los huesos** y no en las arterias.',
      maxLines: 4,
    );
  }
}
