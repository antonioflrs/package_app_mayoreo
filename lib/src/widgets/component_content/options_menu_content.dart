import 'package:flutter/material.dart';
import '../../theme/colors/app_colors.dart';
import '../options_menu.dart';
import 'screen_template.dart';

class OptionsMenuContent extends StatelessWidget {
  const OptionsMenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Options Menu',
      componentDescription: 'Widget personalizable de menú de opciones con overlay que permite mostrar acciones contextuales mediante un botón trigger.',
      examples: [
        ComponentExample(
          id: 'basic-options-menu',
          title: 'Options Menu Básico',
          description: 'Menú de opciones con configuración básica y tres puntos verticales como trigger.',
          previewWidget: const OptionsMenuPreview(),
          codeExample: '''
OptionsMenu(
  options: [
    MenuOption(
      title: 'Editar',
      icon: Icons.edit,
      onTap: () => print('Editar'),
    ),
    MenuOption(
      title: 'Eliminar',
      icon: Icons.delete,
      onTap: () => print('Eliminar'),
    ),
  ],
  triggerIcon: Icons.more_vert,
  overlayWidth: 170.0,
)
          ''',
        ),
      ],
      properties: [
        ComponentProperty(
          name: 'options',
          type: 'List<MenuOption>',
          required: true,
          description: 'Lista de opciones del menú',
        ),
        ComponentProperty(
          name: 'triggerIcon',
          type: 'IconData?',
          required: false,
          description: 'Icono del botón trigger (por defecto: Icons.more_vert)',
          defaultValue: 'Icons.more_vert',
        ),
        ComponentProperty(
          name: 'inactiveIconColor',
          type: 'Color?',
          required: false,
          description: 'Color del icono cuando está inactivo',
        ),
        ComponentProperty(
          name: 'activeIconColor',
          type: 'Color?',
          required: false,
          description: 'Color del icono cuando está activo',
        ),
        ComponentProperty(
          name: 'iconSize',
          type: 'double',
          required: false,
          description: 'Tamaño del icono del botón trigger',
          defaultValue: '20.0',
        ),
        ComponentProperty(
          name: 'overlayWidth',
          type: 'double',
          required: false,
          description: 'Ancho del overlay del menú',
          defaultValue: '170.0',
        ),
        ComponentProperty(
          name: 'overlayOffset',
          type: 'Offset',
          required: false,
          description: 'Offset del overlay respecto al botón trigger',
          defaultValue: 'Offset(-143, 35)',
        ),
        ComponentProperty(
          name: 'elevation',
          type: 'double',
          required: false,
          description: 'Elevación del overlay',
          defaultValue: '8.0',
        ),
        ComponentProperty(
          name: 'borderRadius',
          type: 'double',
          required: false,
          description: 'Radio de los bordes del overlay',
          defaultValue: '8.0',
        ),
        ComponentProperty(
          name: 'overlayBackgroundColor',
          type: 'Color?',
          required: false,
          description: 'Color de fondo del overlay',
        ),
        ComponentProperty(
          name: 'separatorColor',
          type: 'Color?',
          required: false,
          description: 'Color de los separadores entre opciones',
        ),
        ComponentProperty(
          name: 'horizontalPadding',
          type: 'double',
          required: false,
          description: 'Padding horizontal de las opciones',
          defaultValue: '12.0',
        ),
        ComponentProperty(
          name: 'verticalPadding',
          type: 'double',
          required: false,
          description: 'Padding vertical de las opciones',
          defaultValue: '12.0',
        ),
        ComponentProperty(
          name: 'fontSize',
          type: 'double',
          required: false,
          description: 'Tamaño de fuente del texto de las opciones',
          defaultValue: '14.0',
        ),
        ComponentProperty(
          name: 'fontFamily',
          type: 'String?',
          required: false,
          description: 'Familia de fuente del texto de las opciones',
        ),
        ComponentProperty(
          name: 'pressedBackgroundColor',
          type: 'Color?',
          required: false,
          description: 'Color de fondo del overlay cuando se presiona una opción',
        ),
      ],
    );
  }
}

class OptionsMenuPreview extends StatefulWidget {
  const OptionsMenuPreview({super.key});

  @override
  State<OptionsMenuPreview> createState() => _OptionsMenuPreviewState();
}

class _OptionsMenuPreviewState extends State<OptionsMenuPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Variantes del Options Menu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 20),
        
        // Variante básica con tres puntos
        _buildVariant(
          title: 'Variante básica (tres puntos)',
          description: 'Menú básico con icono de tres puntos verticales',
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backCards,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Elemento de lista',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                OptionsMenu(
                  options: [
                    MenuOption(
                      title: 'Editar',
                      icon: Icons.edit,
                      onTap: () => _showSnackBar('Editar presionado'),
                    ),
                    MenuOption(
                      title: 'Eliminar',
                      icon: Icons.delete,
                      onTap: () => _showSnackBar('Eliminar presionado'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Variante con icono personalizado
        _buildVariant(
          title: 'Variante con icono personalizado',
          description: 'Menú con icono de configuración y colores personalizados',
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backCards,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Configuración',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                OptionsMenu(
                  triggerIcon: Icons.settings,
                  inactiveIconColor: AppColors.orangeBrand,
                  activeIconColor: AppColors.greenFree,
                  iconSize: 24,
                  options: [
                    MenuOption(
                      title: 'Configuración',
                      icon: Icons.settings,
                      onTap: () => _showSnackBar('Configuración presionado'),
                    ),
                    MenuOption(
                      title: 'Ayuda',
                      icon: Icons.help,
                      onTap: () => _showSnackBar('Ayuda presionado'),
                    ),
                    MenuOption(
                      title: 'Acerca de',
                      icon: Icons.info,
                      onTap: () => _showSnackBar('Acerca de presionado'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Variante con opciones sin iconos
        _buildVariant(
          title: 'Variante sin iconos',
          description: 'Menú con opciones que no tienen iconos',
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backCards,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Opciones simples',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                OptionsMenu(
                  triggerIcon: Icons.more_horiz,
                  overlayWidth: 140,
                  options: [
                    MenuOption(
                      title: 'Opción 1',
                      onTap: () => _showSnackBar('Opción 1 presionado'),
                    ),
                    MenuOption(
                      title: 'Opción 2',
                      onTap: () => _showSnackBar('Opción 2 presionado'),
                    ),
                    MenuOption(
                      title: 'Opción 3',
                      onTap: () => _showSnackBar('Opción 3 presionado'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Variante con overlay personalizado
        _buildVariant(
          title: 'Variante con overlay personalizado',
          description: 'Menú con colores y estilos personalizados del overlay',
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backCards,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Overlay personalizado',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                OptionsMenu(
                  triggerIcon: Icons.apps,
                  overlayWidth: 200,
                  overlayBackgroundColor: AppColors.orangeBrand,
                  separatorColor: AppColors.white,
                  borderRadius: 12,
                  elevation: 12,
                  options: [
                    MenuOption(
                      title: 'Acción principal',
                      icon: Icons.star,
                      iconColor: AppColors.white,
                      textColor: AppColors.white,
                      onTap: () => _showSnackBar('Acción principal presionado'),
                    ),
                    MenuOption(
                      title: 'Acción secundaria',
                      icon: Icons.favorite,
                      iconColor: AppColors.white,
                      textColor: AppColors.white,
                      onTap: () => _showSnackBar('Acción secundaria presionado'),
                    ),
                    MenuOption(
                      title: 'Acción terciaria',
                      icon: Icons.share,
                      iconColor: AppColors.white,
                      textColor: AppColors.white,
                      onTap: () => _showSnackBar('Acción terciaria presionado'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVariant({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.grayMedium,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
