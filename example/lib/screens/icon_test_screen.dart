/*
 * ANÁLISIS EXHAUSTIVO DE MEJORES PRÁCTICAS PARA CARGAR ICONOS SVG DESDE PAQUETES DE FLUTTER
 * 
 * 1. ERRORES EN PUBSPEC.YAML:
 *    - Declaraciones incorrectas: Los assets deben declararse con rutas relativas desde la raíz del package
 *    - Falta de barra final (/): Las carpetas deben terminar en / para incluir todo el contenido
 *    - Assets no declarados: Flutter no incluirá assets no declarados en pubspec.yaml
 *    - Rutas absolutas incorrectas: Usar rutas relativas, no absolutas
 * 
 * 2. SINTAXIS DE RUTA DEL ASSET (CRÍTICO):
 *    - Asset local: 'assets/icons/mi_icono.svg' (desde la app principal)
 *    - Asset de package: 'packages/[nombre_package]/assets/icons/mi_icono.svg' (desde dependencia)
 *    - Diferencia clave: Los packages requieren el prefijo 'packages/[nombre_package]/'
 *    - Error común: Usar rutas locales para assets de packages
 *    - Verificación: Los assets de packages solo funcionan con la sintaxis completa
 * 
 * 3. PROBLEMAS CON FLUTTER_SVG:
 *    - SVGs complejos: Gradientes, máscaras, filtros pueden causar errores de renderizado
 *    - Dimensiones no definidas: Siempre especificar width/height para evitar errores de layout
 *    - ColorFilter: Usar ColorFilter.mode() para aplicar colores a SVGs
 *    - Error handling: Implementar errorBuilder para manejar fallos de carga
 *    - Placeholder: Usar placeholderBuilder para mostrar indicador de carga
 * 
 * 4. PROBLEMAS DE COMPILACIÓN:
 *    - Tree shaking: Flutter puede excluir assets no utilizados si no se declaran correctamente
 *    - Build optimization: Los assets deben estar en la lista de assets del pubspec.yaml
 *    - Hot reload: Los cambios en assets requieren hot restart, no hot reload
 *    - Platform differences: Algunos assets pueden comportarse diferente en iOS vs Android
 * 
 * 5. VERIFICACIÓN DE EXISTENCIA:
 *    - Runtime validation: Verificar que el asset existe antes de intentar cargarlo
 *    - Debug information: Mostrar rutas de assets en modo debug
 *    - Fallback widgets: Proporcionar widgets alternativos cuando falla la carga
 *    - Error logging: Registrar errores para facilitar debugging
 * 
 * MEJORES PRÁCTICAS IDENTIFICADAS:
 *    - Usar rutas constantes definidas en clases para evitar errores de tipeo
 *    - Implementar widgets con manejo de errores (SafeSvgIcon)
 *    - Probar assets en modo release, no solo debug
 *    - Documentar las rutas de assets en el package
 *    - Usar prefijos de package consistentes
 *    - Validar assets en tiempo de compilación cuando sea posible
 * 
 * SOLUCIÓN IMPLEMENTADA:
 *    - Sistema PackageIcon que emula Material Design
 *    - Validación de iconos en tiempo de compilación
 *    - API consistente y predecible
 *    - Manejo robusto de errores
 *    - Fácil de usar para desarrolladores
 */

import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class IconTestScreen extends StatefulWidget {
  const IconTestScreen({super.key});

  @override
  State<IconTestScreen> createState() => _IconTestScreenState();
}

class _IconTestScreenState extends State<IconTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de Iconos SVG - Material Design Style'),
        backgroundColor: AppColors.orangeBrand,
        foregroundColor: AppColors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x00FFFFFF), Color(0xFFFFFFFF)],
            stops: [0.15, 0.65],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            Text(
              'Sistema de Iconos estilo Material Design',
              style: AppTypography.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.orangeBrand,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Implementación robusta que emula el comportamiento de Material Design',
              style: AppTypography.bodyMedium?.copyWith(
                color: AppColors.grayMedium,
              ),
            ),
            const SizedBox(height: 24),
            // Badges informativos
            Row(
              children: [
                StatusBadge(
                  text: 'Material Design Style',
                  color: AppColors.orangeBrand,
                  size: BadgeSize.medium,
                ),
                const SizedBox(width: 8),
                StatusBadge(
                  text: 'SVG',
                  color: AppColors.greenFree,
                  size: BadgeSize.medium,
                ),
                const SizedBox(width: 8),
                NotificationBadge(
                  text: 'Validado',
                  color: AppColors.ochreBrand,
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Sección 1: Iconos de Material Design (Control)
            _buildSectionTitle('✅ Control: Iconos de Material Design'),
            const SizedBox(height: 16),
            _buildMaterialIconsSection(),
            
            const SizedBox(height: 32),
            
            // Sección 2: Iconos del Package usando PackageIcon
            _buildSectionTitle('🔄 Prueba: PackageIcon (Estilo Material Design)'),
            const SizedBox(height: 16),
            
            // Icono 1: B Toolkit Copia usando PackageIcon
            _buildPackageIconSection(
              'Icono 1: B Toolkit Copia',
              PackageIcons.bToolkitCopia,
              'Uso: PackageIcon(iconPath: PackageIcons.bToolkitCopia, size: 80)',
              'package_icon_1',
            ),
            
            const SizedBox(height: 16),
            
            // Icono 2: Colors usando PackageIcon
            _buildPackageIconSection(
              'Icono 2: Colors',
              PackageIcons.colors,
              'Uso: PackageIcon(iconPath: PackageIcons.colors, size: 80)',
              'package_icon_2',
            ),
            
            const SizedBox(height: 32),
            
            // Sección 3: Comparación de APIs
            _buildSectionTitle('📊 Comparación de APIs'),
            const SizedBox(height: 16),
            _buildApiComparisonSection(),
            
            const SizedBox(height: 32),
            
            // Información de debug
            _buildDebugInfo(),
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.orangeBrand.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.orangeBrand.withValues(alpha: 0.3)),
      ),
      child: Text(
        title,
        style: AppTypography.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.orangeBrand,
        ),
      ),
    );
  }

  Widget _buildMaterialIconsSection() {
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
            'API de Material Design (Funcionando)',
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMaterialIcon(Icons.home, 'Home'),
              _buildMaterialIcon(Icons.search, 'Search'),
              _buildMaterialIcon(Icons.favorite, 'Favorite'),
              _buildMaterialIcon(Icons.settings, 'Settings'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.silverGrayMedium),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 32,
              color: AppColors.orangeBrand,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTypography.labelSmall?.copyWith(
            color: AppColors.grayMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildPackageIconSection(String title, String iconPath, String description, String statusKey) {
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
          // Título de la sección
          Text(
            title,
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTypography.bodySmall?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
          const SizedBox(height: 16),
          
          // Contenedor del icono usando PackageIcon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.silverGrayMedium),
            ),
            child: Center(
              child: PackageIcon(
                iconPath: iconPath,
                size: 80,
                color: AppColors.orangeBrand,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Ruta del asset
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              iconPath,
              style: AppTypography.bodySmall?.copyWith(
                fontFamily: 'monospace',
                color: AppColors.darkGray,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApiComparisonSection() {
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
            'Comparación de APIs',
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 16),
          
          // Material Design API
          _buildApiExample(
            'Material Design',
            'Icon(Icons.home, size: 24, color: Colors.blue)',
            '✅ Robusto y predecible',
            Colors.green,
          ),
          
          const SizedBox(height: 12),
          
          // PackageIcon API
          _buildApiExample(
            'PackageIcon',
            'PackageIcon(iconPath: PackageIcons.bToolkitCopia, size: 24, color: Colors.blue)',
            '✅ Emula Material Design',
            Colors.green,
          ),
          
          const SizedBox(height: 12),
          
          // SvgPicture.asset API
          _buildApiExample(
            'SvgPicture.asset',
            'SvgPicture.asset("packages/.../icon.svg", width: 24, height: 24)',
            '⚠️ Propenso a errores',
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildApiExample(String title, String code, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.silverGrayMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTypography.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: AppTypography.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              code,
              style: AppTypography.bodySmall?.copyWith(
                fontFamily: 'monospace',
                color: AppColors.darkGray,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDebugInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softGray,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silverGrayMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Información de Debug:',
            style: AppTypography.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '• PackageIcon emula la API de Material Design\n'
            '• Validación de iconos en tiempo de compilación\n'
            '• Manejo robusto de errores con fallbacks\n'
            '• API consistente y predecible\n'
            '• Fácil de usar para desarrolladores\n'
            '• Rutas de package automáticamente manejadas',
            style: AppTypography.bodySmall?.copyWith(
              color: AppColors.grayMedium,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.orangeBrand.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estado de los Iconos:',
                  style: AppTypography.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.orangeBrand,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '• Material Icons: ✅ Funcionando\n'
                  '• PackageIcon: ✅ Implementado\n'
                  '• Validación: ✅ En tiempo de compilación\n'
                  '• API: ✅ Consistente con Material Design',
                  style: AppTypography.bodySmall?.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
