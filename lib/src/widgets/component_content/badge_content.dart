import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class BadgeContent extends StatelessWidget {
  const BadgeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Badges',
      componentDescription: 'Los componentes Badge se utilizan para mostrar información adicional como notificaciones, estados, o contadores. Pueden aparecer como pequeños indicadores sobre otros elementos.',
      
      examples: [
        ComponentExample(
          id: 'basic_badges',
          title: 'Badges Básicos',
          description: 'Badges con diferentes colores y paddings optimizados para legibilidad.',
          previewWidget: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.grayMedium.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BadgeWidget(text: 'Nuevo', color: AppColors.greenFree),
                    BadgeWidget(text: 'Pro', color: AppColors.orangeBrand),
                    BadgeWidget(text: 'Beta', color: AppColors.yellow),
                    BadgeWidget(text: 'Error', color: AppColors.digitalRed),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BadgeWithIcon(text: '3', icon: Icons.notifications, color: AppColors.digitalRed),
                    BadgeWithIcon(text: '12', icon: Icons.mail, color: AppColors.orangeBrand),
                    BadgeWithIcon(text: '99+', icon: Icons.message, color: AppColors.greenFree),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BadgeWidget(text: 'Activo', color: AppColors.greenFree, showDot: true),
                    BadgeWidget(text: 'Pendiente', color: AppColors.yellow, showDot: true),
                    BadgeWidget(text: 'Inactivo', color: AppColors.grayMedium, showDot: true),
                  ],
                ),
              ],
            ),
          ),
          codeExample: '''// Badge básico con padding optimizado
Container(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding ideal para legibilidad
  decoration: BoxDecoration(
    color: AppColors.greenFree,
    borderRadius: BorderRadius.circular(20), // Radio proporcional al padding
  ),
  child: Text(
    'Nuevo',
    style: TextStyle(
      color: AppColors.white,
      fontSize: 14, // Tamaño de fuente proporcional al padding
      fontWeight: FontWeight.w600,
      height: 1.2, // Line height optimizado
      letterSpacing: 0.2, // Espaciado de letras para legibilidad
    ),
  ),
)''',
        ),
        
        ComponentExample(
          id: 'size_variants',
          title: 'Variantes de Tamaño',
          description: 'Diferentes tamaños de badges con paddings proporcionales para cada caso de uso.',
          previewWidget: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.grayMedium.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BadgeWidget(text: 'Pequeño', color: AppColors.orangeBrand, size: BadgeSize.small),
                    BadgeWidget(text: 'Mediano', color: AppColors.orangeBrand, size: BadgeSize.medium),
                    BadgeWidget(text: 'Grande', color: AppColors.orangeBrand, size: BadgeSize.large),
                    BadgeWidget(text: 'Extra Grande', color: AppColors.orangeBrand, size: BadgeSize.extraLarge),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Tamaños: Small (20px) | Medium (24px) | Large (28px) | Extra Large (32px)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grayMedium,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          codeExample: '''// Paddings optimizados por tamaño
// Pequeño: horizontal 8, vertical 4
Container(
  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  height: 20,
  child: Text('3', style: TextStyle(fontSize: 10)),
)

// Mediano: horizontal 12, vertical 6
Container(
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  height: 24,
  child: Text('3', style: TextStyle(fontSize: 12)),
)

// Grande: horizontal 16, vertical 8
Container(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  height: 28,
  child: Text('3', style: TextStyle(fontSize: 14)),
)''',
        ),
        
        ComponentExample(
          id: 'spacing_best_practices',
          title: 'Mejores Prácticas de Espaciado',
          description: 'Ejemplos de espaciado y padding que siguen las mejores prácticas de UI.',
          previewWidget: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.grayMedium.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Espaciado entre elementos:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    BadgeWidget(text: 'Badge 1', color: AppColors.orangeBrand),
                    const SizedBox(width: 12), // Espaciado consistente entre badges
                    BadgeWidget(text: 'Badge 2', color: AppColors.greenFree),
                    const SizedBox(width: 12),
                    BadgeWidget(text: 'Badge 3', color: AppColors.digitalRed),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Espaciado con iconos:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    BadgeWithIcon(text: '5', icon: Icons.notifications, color: AppColors.digitalRed),
                    const SizedBox(width: 16), // Más espacio para badges con iconos
                    BadgeWithIcon(text: '12', icon: Icons.mail, color: AppColors.orangeBrand),
                    const SizedBox(width: 16),
                    BadgeWithIcon(text: '99+', icon: Icons.message, color: AppColors.greenFree),
                  ],
                ),
              ],
            ),
          ),
          codeExample: '''// Espaciado consistente entre badges
Row(
  children: [
    BadgeWidget(text: 'Badge 1'),
    SizedBox(width: 12), // Espaciado estándar entre badges
    BadgeWidget(text: 'Badge 2'),
    SizedBox(width: 12),
    BadgeWidget(text: 'Badge 3'),
  ],
)

// Espaciado con iconos (más espacio)
Row(
  children: [
    BadgeWithIcon(text: '5', icon: Icons.notifications),
    SizedBox(width: 16), // Más espacio para badges con iconos
    BadgeWithIcon(text: '12', icon: Icons.mail),
  ],
)''',
        ),
        
        ComponentExample(
          id: 'accessibility_badges',
          title: 'Badges para Accesibilidad',
          description: 'Badges con paddings y tamaños optimizados para mejor accesibilidad y legibilidad.',
          previewWidget: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.grayMedium.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tamaños disponibles:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    BadgeWidget(text: 'Badge', color: AppColors.orangeBrand, size: BadgeSize.large),
                    const SizedBox(width: 16),
                    BadgeWidget(text: 'Badge', color: AppColors.orangeBrand, size: BadgeSize.extraLarge),
                    const SizedBox(width: 16),
                    BadgeWidget(text: 'Badge', color: AppColors.orangeBrand, size: BadgeSize.extraLarge),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Tamaños: Large (28px) | Extra Large (32px)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.grayMedium,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          codeExample: '''// Badge con tamaño mínimo para toque (44px)
Container(
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Mínimo recomendado
  height: 44, // Tamaño mínimo para toque
  decoration: BoxDecoration(
    color: AppColors.orangeBrand,
    borderRadius: BorderRadius.circular(22), // Radio = height / 2
  ),
  child: Center(
    child: Text(
      'Badge',
      style: TextStyle(
        color: AppColors.white,
        fontSize: 14, // Tamaño proporcional al padding
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    ),
  ),
)''',
        ),
      ],
      
      properties: [
        ComponentProperty(
          name: 'padding',
          type: 'EdgeInsets',
          description: 'Padding interno del badge. Recomendado: horizontal 12-16px, vertical 6-8px.',
          required: true,
          defaultValue: 'EdgeInsets.symmetric(horizontal: 12, vertical: 6)',
        ),
        ComponentProperty(
          name: 'borderRadius',
          type: 'BorderRadius',
          description: 'Radio de los bordes. Recomendado: proporcional al padding (8-20px).',
          required: true,
          defaultValue: 'BorderRadius.circular(12)',
        ),
        ComponentProperty(
          name: 'fontSize',
          type: 'double',
          description: 'Tamaño de fuente. Recomendado: proporcional al padding (10-16px).',
          required: true,
          defaultValue: '12.0',
        ),
        ComponentProperty(
          name: 'height',
          type: 'double',
          description: 'Altura del badge. Mínimo recomendado: 44px para accesibilidad.',
          required: true,
          defaultValue: '24.0',
        ),
        ComponentProperty(
          name: 'spacing',
          type: 'double',
          description: 'Espaciado entre badges. Recomendado: 12-16px.',
          required: false,
          defaultValue: '12.0',
        ),
      ],
      
      methods: [
        ComponentMethod(
          name: 'build',
          returnType: 'Widget',
          description: 'Construye el badge con padding y espaciado optimizados.',
          parameters: ['BuildContext context'],
        ),
        ComponentMethod(
          name: '_getOptimalPadding',
          returnType: 'EdgeInsets',
          description: 'Calcula el padding óptimo basado en el tamaño del badge.',
          parameters: ['BadgeSize size'],
        ),
        ComponentMethod(
          name: '_getOptimalSpacing',
          returnType: 'double',
          description: 'Calcula el espaciado óptimo entre elementos del badge.',
          parameters: ['BadgeSize size'],
        ),
      ],
      
      usageNotes: '''
• **Paddings Óptimos**: 
  - Horizontal: 12-16px para legibilidad
  - Vertical: 6-8px para proporción visual
  - Proporción recomendada: 2:1 (horizontal:vertical)

• **Tamaños de Fuente**:
  - Pequeño (20px): 10px
  - Mediano (24px): 12px
  - Grande (28px): 14px
  - Extra Grande (32px): 16px

• **Espaciado entre Badges**:
  - Badges simples: 12px
  - Badges con iconos: 16px
  - Badges en grupos: 8px

• **Accesibilidad**:
  - Altura mínima: 44px para toque
  - Padding mínimo: 16x8px
  - Contraste de color: 4.5:1 mínimo

• **Buenas Prácticas**:
  - Mantener consistencia en paddings
  - Usar espaciado proporcional al contenido
  - Considerar el contexto de uso
  - Optimizar para diferentes tamaños de pantalla
      ''',
    );
  }


} 