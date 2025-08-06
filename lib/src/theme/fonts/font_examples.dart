import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import 'app_fonts.dart';

/// Examples of how to use the Inter font family
class FontExamples {
  /// Example widget showing different Inter font weights
  static Widget buildInterFontShowcase() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Inter font weights
          Text('Inter Light (300)', style: AppFonts.interLight.copyWith(fontSize: 24)),
          const SizedBox(height: 8),
          Text('Inter Regular (400)', style: AppFonts.interRegular.copyWith(fontSize: 24)),
          const SizedBox(height: 8),
          Text('Inter Medium (500)', style: AppFonts.interMedium.copyWith(fontSize: 24)),
          const SizedBox(height: 8),
          Text('Inter SemiBold (600)', style: AppFonts.interSemiBold.copyWith(fontSize: 24)),
          const SizedBox(height: 8),
          Text('Inter Bold (700)', style: AppFonts.interBold.copyWith(fontSize: 24)),
          const SizedBox(height: 24),

          // Different sizes with Inter
          Text('Large Text (32px)', style: AppFonts.interStyle(fontSize: 32, fontWeight: AppFonts.medium)),
          const SizedBox(height: 8),
          Text('Medium Text (18px)', style: AppFonts.interStyle(fontSize: 18, fontWeight: AppFonts.regular)),
          const SizedBox(height: 8),
          Text('Small Text (14px)', style: AppFonts.interStyle(fontSize: 14, fontWeight: AppFonts.light)),
          const SizedBox(height: 24),

          // Monospace font examples
          Text('Mono Regular', style: AppFonts.monoRegular.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Text('Mono Medium', style: AppFonts.monoMedium.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Text('Mono Bold', style: AppFonts.monoBold.copyWith(fontSize: 16)),
          const SizedBox(height: 24),

          // Custom styles
          Text(
            'Custom Inter Style',
            style: AppFonts.interStyle(
              fontSize: 20,
              fontWeight: AppFonts.semiBold,
              color: AppColors.orangeBrand,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Custom Mono Style',
            style: AppFonts.monoStyle(
              fontSize: 16,
              fontWeight: AppFonts.medium,
              color: AppColors.greenFree,
            ),
          ),
        ],
      ),
    );
  }

  /// Example of how to use Inter font in a product card
  static Widget buildProductCardExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product title with Inter Bold
            Text(
              'Producto Destacado',
              style: AppFonts.interStyle(
                fontSize: 20,
                fontWeight: AppFonts.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            // Product description with Inter Regular
            Text(
              'Esta es una descripción del producto que utiliza la fuente Inter Regular para mejor legibilidad.',
              style: AppFonts.interStyle(
                fontSize: 14,
                fontWeight: AppFonts.regular,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            
            // Price with Inter SemiBold
            Row(
              children: [
                Text(
                  'Precio: ',
                  style: AppFonts.interStyle(
                    fontSize: 16,
                    fontWeight: AppFonts.regular,
                  ),
                ),
                Text(
                  '\$99.99',
                  style: AppFonts.interStyle(
                    fontSize: 18,
                    fontWeight: AppFonts.semiBold,
                    color: AppColors.greenFree,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            
            // SKU with monospace font
            Text(
              'SKU: PRD-12345',
              style: AppFonts.monoStyle(
                fontSize: 12,
                fontWeight: AppFonts.regular,
                color: AppColors.grayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Example of how to use Inter font in a form
  static Widget buildFormExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Form title
        Text(
          'Formulario de Registro',
          style: AppFonts.interStyle(
            fontSize: 24,
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: 16),
        
        // Form fields
        TextField(
          decoration: InputDecoration(
            labelText: 'Nombre completo',
            labelStyle: AppFonts.interStyle(
              fontSize: 14,
              fontWeight: AppFonts.medium,
            ),
            hintText: 'Ingresa tu nombre completo',
            hintStyle: AppFonts.interStyle(
              fontSize: 14,
              fontWeight: AppFonts.regular,
              color: AppColors.grayMedium,
            ),
          ),
          style: AppFonts.interStyle(
            fontSize: 16,
            fontWeight: AppFonts.regular,
          ),
        ),
        const SizedBox(height: 16),
        
        TextField(
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            labelStyle: AppFonts.interStyle(
              fontSize: 14,
              fontWeight: AppFonts.medium,
            ),
            hintText: 'ejemplo@correo.com',
            hintStyle: AppFonts.interStyle(
              fontSize: 14,
              fontWeight: AppFonts.regular,
              color: AppColors.grayMedium,
            ),
          ),
          style: AppFonts.interStyle(
            fontSize: 16,
            fontWeight: AppFonts.regular,
          ),
        ),
        const SizedBox(height: 24),
        
        // Submit button text
        Text(
          'Enviar formulario',
          style: AppFonts.interStyle(
            fontSize: 16,
            fontWeight: AppFonts.semiBold,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
} 