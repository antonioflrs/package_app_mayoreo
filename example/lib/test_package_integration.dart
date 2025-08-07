import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Widget de prueba para verificar que todos los componentes del package funcionen correctamente
class PackageIntegrationTest extends StatelessWidget {
  const PackageIntegrationTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test de Integración del Package',
          style: AppTypography.titleLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.orangeBrand,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('🎨 Colores del Sistema'),
            _buildColorsTest(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('📝 Tipografía del Sistema'),
            _buildTypographyTest(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🧩 Widgets del Sistema'),
            _buildWidgetsTest(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🎯 Iconos del Sistema'),
            _buildIconsTest(),
            
            const SizedBox(height: 32),
            _buildSectionHeader('🔧 Tema Completo'),
            _buildThemeTest(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: AppTypography.headlineSmall?.copyWith(
          color: AppColors.orangeBrand,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildColorsTest() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paleta de Colores Disponible:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildColorSwatch('Primary', AppColors.orangeBrand),
              _buildColorSwatch('Secondary', AppColors.ochreBrand),
              _buildColorSwatch('Tertiary', AppColors.oliveBrand),
              _buildColorSwatch('Background', AppColors.backCards),
              _buildColorSwatch('Soft Gray', AppColors.softGray),
              _buildColorSwatch('Mystic Gray', AppColors.mysticGray),
              _buildColorSwatch('Dark Gray', AppColors.darkGray),
              _buildColorSwatch('Gray Medium', AppColors.grayMedium),
              _buildColorSwatch('Digital Red', AppColors.digitalRed),
              _buildColorSwatch('Lime Green', AppColors.limeGreen),
              _buildColorSwatch('Green Free', AppColors.greenFree),
              _buildColorSwatch('Yellow', AppColors.yellow),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.silverGrayMedium),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: AppTypography.labelSmall?.copyWith(
              color: AppColors.grayMedium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyTest() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estilos de Tipografía:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text('Headline Large', style: AppTypography.headlineLarge),
          Text('Headline Medium', style: AppTypography.headlineMedium),
          Text('Headline Small', style: AppTypography.headlineSmall),
          const SizedBox(height: 8),
          Text('Title Large', style: AppTypography.titleLarge),
          Text('Title Medium', style: AppTypography.titleMedium),
          Text('Title Small', style: AppTypography.titleSmall),
          const SizedBox(height: 8),
          Text('Body Large', style: AppTypography.bodyLarge),
          Text('Body Medium', style: AppTypography.bodyMedium),
          Text('Body Small', style: AppTypography.bodySmall),
          const SizedBox(height: 8),
          Text('Label Large', style: AppTypography.labelLarge),
          Text('Label Medium', style: AppTypography.labelMedium),
          Text('Label Small', style: AppTypography.labelSmall),
        ],
      ),
    );
  }

  Widget _buildWidgetsTest() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Widgets Disponibles:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          // UiButton tests
          Text(
            'UiButton - Tipos:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              UiButton(
                onPressed: () {},
                label: 'Primary',
                type: UiButtonType.primary,
              ),
              UiButton(
                onPressed: () {},
                label: 'Secondary',
                type: UiButtonType.secondary,
              ),
              UiButton(
                onPressed: () {},
                label: 'Text',
                type: UiButtonType.text,
              ),
              UiButton(
                onPressed: () {},
                label: 'Destructive',
                type: UiButtonType.destructive,
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          Text(
            'UiButton - Tamaños:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              UiButton(
                onPressed: () {},
                label: 'Small',
                type: UiButtonType.primary,
                size: UiButtonSize.small,
              ),
              UiButton(
                onPressed: () {},
                label: 'Medium',
                type: UiButtonType.primary,
                size: UiButtonSize.medium,
              ),
              UiButton(
                onPressed: () {},
                label: 'Large',
                type: UiButtonType.primary,
                size: UiButtonSize.large,
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          Text(
            'UiButton - Con Iconos:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              UiButton(
                onPressed: () {},
                label: 'Guardar',
                type: UiButtonType.primary,
                icon: Icons.save,
                iconPosition: UiButtonIconPosition.start,
              ),
              UiButton(
                onPressed: () {},
                label: 'Enviar',
                type: UiButtonType.secondary,
                icon: Icons.send,
                iconPosition: UiButtonIconPosition.end,
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          Text(
            'UiButton - Estados:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              UiButton(
                onPressed: () {},
                label: 'Normal',
                type: UiButtonType.primary,
              ),
              UiButton(
                onPressed: null,
                label: 'Deshabilitado',
                type: UiButtonType.primary,
              ),
              UiButton(
                onPressed: () {},
                label: 'Cargando...',
                type: UiButtonType.primary,
                isLoading: true,
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // AppTextField tests
          Text(
            'AppTextField:',
            style: AppTypography.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          AppTextField(
            labelText: 'Email',
            hintText: 'ejemplo@correo.com',
            prefixIcon: Icon(Icons.email, color: AppColors.grayMedium),
          ),
          const SizedBox(height: 16),
          AppTextField(
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            obscureText: true,
            prefixIcon: Icon(Icons.lock, color: AppColors.grayMedium),
          ),
          const SizedBox(height: 16),
          AppTextField(
            labelText: 'Teléfono',
            hintText: '+52 123 456 7890',
            keyboardType: TextInputType.phone,
            prefixIcon: Icon(Icons.phone, color: AppColors.grayMedium),
            errorText: 'Ejemplo de error',
          ),
        ],
      ),
    );
  }

  Widget _buildIconsTest() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Iconos de Material Design:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              Icon(Icons.menu, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.arrow_back, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.person, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.shopping_cart, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.favorite, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.credit_card, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.chat, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.share, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.mail, color: AppColors.orangeBrand, size: 24),
              Icon(Icons.settings, color: AppColors.orangeBrand, size: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThemeTest(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tema Aplicado:',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          // Color scheme test
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Color Primario del Tema',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Text theme test
          Text(
            'Texto usando el tema:',
            style: theme.textTheme.headlineSmall,
          ),
          Text(
            'Este texto usa el TextTheme del tema aplicado',
            style: theme.textTheme.bodyMedium,
          ),
          
          const SizedBox(height: 16),
          
          // Icon theme test
          Row(
            children: [
              Icon(Icons.check_circle, color: theme.iconTheme.color),
              const SizedBox(width: 8),
              Text(
                'Icono usando el IconTheme del tema',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
