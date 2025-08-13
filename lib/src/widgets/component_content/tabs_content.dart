import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class TabsContent extends StatefulWidget {
  const TabsContent({super.key});

  @override
  State<TabsContent> createState() => _TabsContentState();
}

class _TabsContentState extends State<TabsContent> {
  bool _showPreview = true;
  final List<TabItem> _dynamicTabs = [
    const TabItem(
      id: 'tab1',
      title: 'Pestaña 1',
    ),
    const TabItem(
      id: 'tab2',
      title: 'Pestaña 2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ComponentScreenTemplate(
      componentTitle: 'Widget de Tabs',
      componentDescription: 'Widget de tabs personalizable con diferentes variantes de diseño. Soporta estados activo/inactivo, items dinámicos y múltiples estilos visuales.',
      
      examples: [
        ComponentExample(
          id: 'variants_showcase',
          title: 'Variantes de Diseño',
          description: 'Muestra las tres variantes disponibles: underlined, rounded light y rounded dark.',
          previewWidget: TabsVariantsShowcase(),
          codeExample: '''TabsVariantsShowcase(
  margin: EdgeInsets.all(16),
)''',
        ),
        
        ComponentExample(
          id: 'underlined_tabs',
          title: 'Tabs con Subrayado',
          description: 'Variante underlined con subrayado naranja para el estado activo.',
          previewWidget: CustomTabsWidget(
            variant: TabVariant.underlined,
            tabs: [
              const TabItem(
                id: 'info',
                title: 'Información',
                isSelected: true,
              ),
              const TabItem(
                id: 'config',
                title: 'Configuración',
                isSelected: false,
              ),
              const TabItem(
                id: 'help',
                title: 'Ayuda',
                isSelected: false,
              ),
            ],
            onTabChanged: (tabId) {
              setState(() {
                // Update selection logic here
              });
            },
          ),
          codeExample: '''CustomTabsWidget(
  variant: TabVariant.underlined,
  tabs: [
    TabItem(
      id: 'info',
      title: 'Información',
      isSelected: true,
    ),
    TabItem(
      id: 'config',
      title: 'Configuración',
      isSelected: false,
    ),
    TabItem(
      id: 'help',
      title: 'Ayuda',
      isSelected: false,
    ),
  ],
  onTabChanged: (tabId) {
    // Handle tab selection
  },
)''',
        ),
        
        ComponentExample(
          id: 'rounded_light_tabs',
          title: 'Tabs con Fondo Redondeado Claro',
          description: 'Variante roundedLight con fondo gris claro y bordes redondeados.',
          previewWidget: CustomTabsWidget(
            variant: TabVariant.roundedLight,
            tabs: [
              const TabItem(
                id: 'home',
                title: 'Inicio',
                isSelected: true,
              ),
              const TabItem(
                id: 'profile',
                title: 'Perfil',
                isSelected: false,
              ),
              const TabItem(
                id: 'settings',
                title: 'Ajustes',
                isSelected: false,
              ),
            ],
            onTabChanged: (tabId) {
              setState(() {
                // Update selection logic here
              });
            },
          ),
          codeExample: '''CustomTabsWidget(
  variant: TabVariant.roundedLight,
  tabs: [
    TabItem(
      id: 'home',
      title: 'Inicio',
      isSelected: true,
    ),
    TabItem(
      id: 'profile',
      title: 'Perfil',
      isSelected: false,
    ),
    TabItem(
      id: 'settings',
      title: 'Ajustes',
      isSelected: false,
    ),
  ],
  onTabChanged: (tabId) {
    // Handle tab selection
  },
)''',
        ),
        
        ComponentExample(
          id: 'rounded_dark_tabs',
          title: 'Tabs con Fondo Redondeado Oscuro',
          description: 'Variante roundedDark con fondo gris más oscuro y sombras sutiles.',
          previewWidget: CustomTabsWidget(
            variant: TabVariant.roundedDark,
            tabs: [
              const TabItem(
                id: 'dashboard',
                title: 'Dashboard',
                isSelected: true,
              ),
              const TabItem(
                id: 'analytics',
                title: 'Analytics',
                isSelected: false,
              ),
              const TabItem(
                id: 'reports',
                title: 'Reportes',
                isSelected: false,
              ),
            ],
            onTabChanged: (tabId) {
              setState(() {
                // Update selection logic here
              });
            },
          ),
          codeExample: '''CustomTabsWidget(
  variant: TabVariant.roundedDark,
  tabs: [
    TabItem(
      id: 'dashboard',
      title: 'Dashboard',
      isSelected: true,
    ),
    TabItem(
      id: 'analytics',
      title: 'Analytics',
      isSelected: false,
    ),
    TabItem(
      id: 'reports',
      title: 'Reportes',
      isSelected: false,
    ),
  ],
  onTabChanged: (tabId) {
    // Handle tab selection
  },
)''',
        ),
        
        ComponentExample(
          id: 'preview_code_tabs',
          title: 'Tabs Vista Previa/Código',
          description: 'Widget especializado para alternar entre vista previa y código, con variante configurable.',
          previewWidget: PreviewCodeTabs(
            showPreview: _showPreview,
            onPreviewTap: () => setState(() => _showPreview = true),
            onCodeTap: () => setState(() => _showPreview = false),
            variant: TabVariant.underlined,
          ),
          codeExample: '''PreviewCodeTabs(
  showPreview: _showPreview,
  onPreviewTap: () => setState(() => _showPreview = true),
  onCodeTap: () => setState(() => _showPreview = false),
  variant: TabVariant.underlined, // or roundedLight, roundedDark
)''',
        ),
        
        ComponentExample(
          id: 'dynamic_tabs',
          title: 'Tabs Dinámicos con Botón Agregar',
          description: 'Tabs que permiten agregar y remover pestañas dinámicamente, con variante configurable.',
          previewWidget: DynamicTabsWidget(
            initialTabs: _dynamicTabs,
            variant: TabVariant.roundedLight,
            showAddButton: true,
            onTabAdded: () {
              setState(() {
                // Handle tab added
              });
            },
            contentBuilder: (tabId) => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.softGray,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.grayMedium.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                'Contenido de la pestaña: $tabId',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          codeExample: '''DynamicTabsWidget(
  initialTabs: [
    TabItem(id: 'tab1', title: 'Pestaña 1'),
    TabItem(id: 'tab2', title: 'Pestaña 2'),
  ],
  variant: TabVariant.roundedLight,
  showAddButton: true,
  onTabAdded: () {
    // Handle new tab added
  },
  contentBuilder: (tabId) => Text('Contenido: \$tabId'),
)''',
        ),
        
        ComponentExample(
          id: 'custom_spacing',
          title: 'Tabs con Espaciado Personalizado',
          description: 'Tabs con espaciado y márgenes personalizados para diferentes diseños.',
          previewWidget: CustomTabsWidget(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            spacing: 32,
            variant: TabVariant.underlined,
            tabs: [
              const TabItem(
                id: 'overview',
                title: 'Vista General',
                isSelected: true,
              ),
              const TabItem(
                id: 'details',
                title: 'Detalles',
                isSelected: false,
              ),
            ],
          ),
          codeExample: '''CustomTabsWidget(
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  spacing: 32,
  variant: TabVariant.underlined,
  tabs: [
    TabItem(
      id: 'overview',
      title: 'Vista General',
      isSelected: true,
    ),
    TabItem(
      id: 'details',
      title: 'Detalles',
      isSelected: false,
    ),
  ],
)''',
        ),
      ],
      
      properties: [
        ComponentProperty(
          name: 'tabs',
          type: 'List<TabItem>',
          description: 'Lista de items de tabs a mostrar.',
          required: true,
        ),
        ComponentProperty(
          name: 'variant',
          type: 'TabVariant',
          description: 'Estilo visual de las tabs: underlined, roundedLight, o roundedDark.',
          required: false,
          defaultValue: 'TabVariant.underlined',
        ),
        ComponentProperty(
          name: 'margin',
          type: 'EdgeInsets?',
          description: 'Márgenes externos del contenedor de tabs.',
          required: false,
        ),
        ComponentProperty(
          name: 'spacing',
          type: 'double?',
          description: 'Espaciado entre tabs individuales.',
          required: false,
          defaultValue: '24.0',
        ),
        ComponentProperty(
          name: 'onTabChanged',
          type: 'Function(String)?',
          description: 'Callback que se ejecuta cuando se selecciona una tab.',
          required: false,
        ),
        ComponentProperty(
          name: 'showAddButton',
          type: 'bool',
          description: 'Determina si se muestra el botón para agregar nuevas tabs.',
          required: false,
          defaultValue: 'false',
        ),
        ComponentProperty(
          name: 'onAddTab',
          type: 'VoidCallback?',
          description: 'Callback que se ejecuta cuando se presiona el botón agregar.',
          required: false,
        ),
      ],
      
      methods: [
        ComponentMethod(
          name: 'build',
          returnType: 'Widget',
          description: 'Construye y retorna el widget de tabs con la variante especificada.',
          parameters: ['BuildContext context'],
        ),
        ComponentMethod(
          name: 'onTabChanged',
          returnType: 'void',
          description: 'Maneja el cambio de selección de tabs.',
          parameters: ['String tabId'],
        ),
        ComponentMethod(
          name: 'onAddTab',
          returnType: 'void',
          description: 'Maneja la adición de nuevas tabs.',
          parameters: [],
        ),
      ],
      
      usageNotes: '''
• **Variantes**: Use la propiedad `variant` para cambiar el estilo visual entre underlined, roundedLight y roundedDark.
• **TabItem**: Cada tab debe tener un ID único, título y estado de selección.
• **Estados**: Las tabs seleccionadas se muestran con diferentes estilos según la variante:
  - **underlined**: Subrayado naranja grueso
  - **roundedLight**: Fondo gris claro con bordes redondeados
  - **roundedDark**: Fondo gris oscuro con sombras sutiles
• **Espaciado**: El espaciado por defecto es 24px, pero puede personalizarse.
• **Botón Agregar**: Solo se muestra cuando showAddButton es true.
• **Responsive**: Los tabs se adaptan automáticamente al contenido.
• **Accesibilidad**: Incluye tooltips y gestos táctiles apropiados.
• **Tema**: Usa los colores y tipografía del sistema de diseño de la app.
• **Diseño Limpio**: Sigue un enfoque minimalista sin iconos innecesarios.
      ''',
    );
  }
}
