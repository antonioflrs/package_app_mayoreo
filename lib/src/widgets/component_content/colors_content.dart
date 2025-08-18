import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class ColorsContent extends StatelessWidget {
  const ColorsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Colores',
      componentDescription: 'Paleta de colores del sistema de diseño que define la identidad visual de la aplicación',
      examples: [
        ComponentExample(
          id: 'color-usage',
          title: 'Uso de Colores',
          description: 'Los colores se aplican mediante la clase AppColors siguiendo esta sintaxis',
          previewWidget: _buildColorUsagePreview(),
          codeExample: _getColorUsageCode(),
        ),
        ComponentExample(
          id: 'color-import',
          title: 'Importación',
          description: 'Para usar los colores en tu proyecto, importa la clase AppColors',
          previewWidget: _buildColorImportPreview(),
          codeExample: _getColorImportCode(),
        ),
        ComponentExample(
          id: 'color-tokens',
          title: 'Tokens de Colores',
          description: 'Lista completa de tokens de colores disponibles en el sistema',
          previewWidget: _buildColorTokensPreview(),
          codeExample: _getColorTokensCode(),
        ),
        ComponentExample(
          id: 'color-categories',
          title: 'Categorías de Colores',
          description: 'Colores organizados por categorías funcionales',
          previewWidget: _buildColorCategoriesPreview(),
          codeExample: _getColorCategoriesCode(),
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'orangeBrand',
          type: 'Color',
          description: 'Color principal de la marca (naranja)',
          required: false,
        ),
        ComponentProperty(
          name: 'ochreBrand',
          type: 'Color',
          description: 'Color secundario de la marca (ocre)',
          required: false,
        ),
        ComponentProperty(
          name: 'oliveBrand',
          type: 'Color',
          description: 'Color terciario de la marca (oliva)',
          required: false,
        ),
        ComponentProperty(
          name: 'lightTan',
          type: 'Color',
          description: 'Color claro tipo tan',
          required: false,
        ),
        ComponentProperty(
          name: 'backCards',
          type: 'Color',
          description: 'Color de fondo para tarjetas',
          required: false,
        ),
        ComponentProperty(
          name: 'black',
          type: 'Color',
          description: 'Color negro principal del sistema',
          required: false,
        ),
        ComponentProperty(
          name: 'grayMedium',
          type: 'Color',
          description: 'Color gris medio',
          required: false,
        ),
        ComponentProperty(
          name: 'white',
          type: 'Color',
          description: 'Color blanco del sistema',
          required: false,
        ),
        ComponentProperty(
          name: 'softGray',
          type: 'Color',
          description: 'Color gris suave',
          required: false,
        ),
        ComponentProperty(
          name: 'digitalRed',
          type: 'Color',
          description: 'Color rojo digital',
          required: false,
        ),
        ComponentProperty(
          name: 'orangeRed',
          type: 'Color',
          description: 'Color rojo naranja',
          required: false,
        ),
        ComponentProperty(
          name: 'fadedRed',
          type: 'Color',
          description: 'Color rojo desvanecido',
          required: false,
        ),
        ComponentProperty(
          name: 'cappuccinoWhite',
          type: 'Color',
          description: 'Color blanco tipo cappuccino',
          required: false,
        ),
        ComponentProperty(
          name: 'limeGreen',
          type: 'Color',
          description: 'Color verde lima',
          required: false,
        ),
        ComponentProperty(
          name: 'greenFree',
          type: 'Color',
          description: 'Color verde para elementos gratuitos',
          required: false,
        ),
        ComponentProperty(
          name: 'smokeGreenMedium',
          type: 'Color',
          description: 'Color verde humo medio',
          required: false,
        ),
        ComponentProperty(
          name: 'greenBorder',
          type: 'Color',
          description: 'Color verde para bordes',
          required: false,
        ),
        ComponentProperty(
          name: 'truGreen',
          type: 'Color',
          description: 'Color verde verdadero',
          required: false,
        ),
        ComponentProperty(
          name: 'yellow',
          type: 'Color',
          description: 'Color amarillo',
          required: false,
        ),
        ComponentProperty(
          name: 'amarilloSuscripciones',
          type: 'Color',
          description: 'Color amarillo para suscripciones',
          required: false,
        ),
        ComponentProperty(
          name: 'backGratis',
          type: 'Color',
          description: 'Color de fondo para elementos gratuitos',
          required: false,
        ),
        ComponentProperty(
          name: 'mysticGray',
          type: 'Color',
          description: 'Color gris místico',
          required: false,
        ),
        ComponentProperty(
          name: 'silverGrayMedium',
          type: 'Color',
          description: 'Color gris plata medio',
          required: false,
        ),
        ComponentProperty(
          name: 'slateCoolGray',
          type: 'Color',
          description: 'Color gris pizarra frío',
          required: false,
        ),
        ComponentProperty(
          name: 'warmGray',
          type: 'Color',
          description: 'Color gris cálido',
          required: false,
        ),
        ComponentProperty(
          name: 'darkGray',
          type: 'Color',
          description: 'Color gris oscuro',
          required: false,
        ),
        ComponentProperty(
          name: 'pureBlack',
          type: 'Color',
          description: 'Color negro puro',
          required: false,
        ),
      ],
      usageNotes: 'Los colores se organizan en categorías: brand (marca), semantic (semánticos), neutral (neutrales) y functional (funcionales). Usa los colores de marca para elementos principales y los semánticos para estados y feedback. Mantén consistencia en el uso de estos valores.',
    );
  }

  Widget _buildColorUsagePreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sintaxis:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'AppColors.[nombreDelColor]',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              color: AppColors.orangeBrand,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ejemplo:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.orangeBrand,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Texto con color de marca',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorImportPreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Importación automática:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'import \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 12,
              color: AppColors.greenFree,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Uso directo:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'AppColors.orangeBrand',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 12,
              color: AppColors.orangeBrand,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorTokensPreview() {
    final allColors = [
      {'token': 'orangeBrand', 'valor': '#E1A141', 'color': AppColors.orangeBrand},
      {'token': 'ochreBrand', 'valor': '#C79022', 'color': AppColors.ochreBrand},
      {'token': 'oliveBrand', 'valor': '#84861C', 'color': AppColors.oliveBrand},
      {'token': 'lightTan', 'valor': '#F1D992', 'color': AppColors.lightTan},
      {'token': 'backCards', 'valor': '#F1F0EC', 'color': AppColors.backCards},
      {'token': 'black', 'valor': '#232323', 'color': AppColors.black},
      {'token': 'grayMedium', 'valor': '#A7ADBA', 'color': AppColors.grayMedium},
      {'token': 'white', 'valor': '#FFFFFF', 'color': AppColors.white},
      {'token': 'softGray', 'valor': '#F9F9F9', 'color': AppColors.softGray},
      {'token': 'digitalRed', 'valor': '#FF0000', 'color': AppColors.digitalRed},
      {'token': 'orangeRed', 'valor': '#FF5757', 'color': AppColors.orangeRed},
      {'token': 'fadedRed', 'valor': '#D54C4C', 'color': AppColors.fadedRed},
      {'token': 'cappuccinoWhite', 'valor': '#E5E6C8', 'color': AppColors.cappuccinoWhite},
      {'token': 'limeGreen', 'valor': '#32CD32', 'color': AppColors.limeGreen},
      {'token': 'greenFree', 'valor': '#047B5D', 'color': AppColors.greenFree},
      {'token': 'smokeGreenMedium', 'valor': '#9BA65C', 'color': AppColors.smokeGreenMedium},
      {'token': 'greenBorder', 'valor': '#21CD5B', 'color': AppColors.greenBorder},
      {'token': 'truGreen', 'valor': '#299617', 'color': AppColors.truGreen},
      {'token': 'yellow', 'valor': '#FADA28', 'color': AppColors.yellow},
      {'token': 'amarilloSuscripciones', 'valor': '#F3BE55', 'color': AppColors.amarilloSuscripciones},
      {'token': 'backGratis', 'valor': '#DDFFE9', 'color': AppColors.backGratis},
      {'token': 'mysticGray', 'valor': '#DDE5E8', 'color': AppColors.mysticGray},
      {'token': 'silverGrayMedium', 'valor': '#D4D4D4', 'color': AppColors.silverGrayMedium},
      {'token': 'slateCoolGray', 'valor': '#708090', 'color': AppColors.slateCoolGray},
      {'token': 'warmGray', 'valor': '#888888', 'color': AppColors.warmGray},
      {'token': 'darkGray', 'valor': '#3D3D3D', 'color': AppColors.darkGray},
      {'token': 'pureBlack', 'valor': '#000000', 'color': AppColors.pureBlack},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Todos los colores disponibles:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemCount: allColors.length,
              itemBuilder: (context, index) {
                final colorData = allColors[index];
                return Container(
                  decoration: BoxDecoration(
                    color: colorData['color'] as Color,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        colorData['token'] as String,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: _getContrastColor(colorData['color'] as Color),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        colorData['valor'] as String,
                        style: TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.w500,
                          color: _getContrastColor(colorData['color'] as Color),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorCategoriesPreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Colores por categorías:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          
          // Colores de marca
          _buildCategorySection('Colores de Marca', [
            {'name': 'orangeBrand', 'color': AppColors.orangeBrand},
            {'name': 'ochreBrand', 'color': AppColors.ochreBrand},
            {'name': 'oliveBrand', 'color': AppColors.oliveBrand},
            {'name': 'lightTan', 'color': AppColors.lightTan},
          ]),
          
          const SizedBox(height: 16),
          
          // Colores semánticos
          _buildCategorySection('Colores Semánticos', [
            {'name': 'greenFree', 'color': AppColors.greenFree},
            {'name': 'digitalRed', 'color': AppColors.digitalRed},
            {'name': 'yellow', 'color': AppColors.yellow},
            {'name': 'limeGreen', 'color': AppColors.limeGreen},
          ]),
          
          const SizedBox(height: 16),
          
          // Colores neutrales
          _buildCategorySection('Colores Neutrales', [
            {'name': 'black', 'color': AppColors.black},
            {'name': 'white', 'color': AppColors.white},
            {'name': 'grayMedium', 'color': AppColors.grayMedium},
            {'name': 'softGray', 'color': AppColors.softGray},
          ]),
          
          const SizedBox(height: 16),
          
          // Colores de fondo
          _buildCategorySection('Colores de Fondo', [
            {'name': 'backCards', 'color': AppColors.backCards},
            {'name': 'backGratis', 'color': AppColors.backGratis},
            {'name': 'mysticGray', 'color': AppColors.mysticGray},
            {'name': 'cappuccinoWhite', 'color': AppColors.cappuccinoWhite},
          ]),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<Map<String, dynamic>> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: colors.map((colorData) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                height: 40,
                decoration: BoxDecoration(
                  color: colorData['color'] as Color,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.grayMedium.withValues(alpha: 0.3)),
                ),
                child: Center(
                  child: Text(
                    colorData['name'] as String,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: _getContrastColor(colorData['color'] as Color),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getContrastColor(Color backgroundColor) {
    // Calcular luminancia para determinar si usar texto negro o blanco
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? AppColors.black : AppColors.white;
  }

  String _getColorUsageCode() {
    return '''// Sintaxis
AppColors.[nombreDelColor]

// Ejemplo
Container(
  color: AppColors.orangeBrand,
  child: Text('Texto'),
)''';
  }

  String _getColorImportCode() {
    return '''import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

// Luego usa los colores
AppColors.orangeBrand''';
  }

  String _getColorTokensCode() {
    return '''// Colores de marca
AppColors.orangeBrand    // #E1A141
AppColors.ochreBrand     // #C79022
AppColors.oliveBrand     // #84861C
AppColors.lightTan       // #F1D992

// Colores semánticos
AppColors.greenFree      // #047B5D
AppColors.digitalRed     // #FF0000
AppColors.yellow         // #FADA28
AppColors.limeGreen      // #32CD32

// Colores neutrales
AppColors.black          // #232323
AppColors.white          // #FFFFFF
AppColors.grayMedium     // #A7ADBA
AppColors.softGray       // #F9F9F9

// Colores de fondo
AppColors.backCards      // #F1F0EC
AppColors.backGratis     // #DDFFE9
AppColors.mysticGray     // #DDE5E8
AppColors.cappuccinoWhite // #E5E6C8

// Escala de grises
AppColors.silverGrayMedium // #D4D4D4
AppColors.slateCoolGray   // #708090
AppColors.warmGray        // #888888
AppColors.darkGray        // #3D3D3D
AppColors.pureBlack       // #000000''';
  }

  String _getColorCategoriesCode() {
    return '''// Colores de marca (elementos principales)
AppColors.orangeBrand    // Color principal
AppColors.ochreBrand     // Color secundario
AppColors.oliveBrand     // Color terciario
AppColors.lightTan       // Color de acento

// Colores semánticos (estados y feedback)
AppColors.greenFree      // Éxito, elementos gratuitos
AppColors.digitalRed     // Error, alertas críticas
AppColors.yellow         // Advertencia, destacados
AppColors.limeGreen      // Confirmación, estados positivos

// Colores neutrales (texto y contenido)
AppColors.black          // Texto principal
AppColors.white          // Fondo principal
AppColors.grayMedium     // Texto secundario
AppColors.softGray       // Fondo secundario

// Colores de fondo (superficies)
AppColors.backCards      // Fondo de tarjetas
AppColors.backGratis     // Fondo de elementos gratuitos
AppColors.mysticGray     // Fondo de contenedores
AppColors.cappuccinoWhite // Fondo cálido

// Escala de grises (jerarquía visual)
AppColors.silverGrayMedium // Bordes y separadores
AppColors.slateCoolGray   // Texto terciario
AppColors.warmGray        // Texto deshabilitado
AppColors.darkGray        // Fondo oscuro
AppColors.pureBlack       // Sombra y contraste máximo''';
  }
} 