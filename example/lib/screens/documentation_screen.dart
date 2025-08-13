import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class DocumentationScreen extends StatefulWidget {
  const DocumentationScreen({super.key});

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {
  int _selectedIndex = 0;

  final List<DocumentationSection> _sections = [
    DocumentationSection(
      'Introducción',
      Icons.info,
      'Información general sobre el paquete',
    ),
    DocumentationSection(
      'Instalación',
      Icons.download,
      'Cómo instalar y configurar el paquete',
    ),
    DocumentationSection(
      'Componentes',
      Icons.widgets,
      'Documentación de todos los componentes',
    ),
    DocumentationSection(
      'Iconos',
      Icons.style,
      'Guía de uso de iconos SVG',
    ),
    DocumentationSection(
      'Tema',
      Icons.palette,
      'Configuración de colores y tipografía',
    ),
    DocumentationSection(
      'Ejemplos',
      Icons.code,
      'Ejemplos de código y casos de uso',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Documentación',
        showMenuButton: false,
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert, color: AppColors.grayMedium),
            onSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context) => _sections.asMap().entries.map((entry) {
              final index = entry.key;
              final section = entry.value;
              return PopupMenuItem<int>(
                value: index,
                child: Row(
                  children: [
                    Icon(
                      section.icon,
                      color: _selectedIndex == index ? AppColors.orangeBrand : AppColors.grayMedium,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            section.title,
                            style: AppTypography.bodyMedium?.copyWith(
                              color: _selectedIndex == index ? AppColors.orangeBrand : AppColors.darkGray,
                              fontWeight: _selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
                            ) ?? TextStyle(
                              color: _selectedIndex == index ? AppColors.orangeBrand : AppColors.darkGray,
                              fontWeight: _selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                          Text(
                            section.description,
                            style: AppTypography.bodySmall?.copyWith(
                              color: AppColors.grayMedium,
                            ) ?? TextStyle(
                              color: AppColors.grayMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Badge de estado para la sección seleccionada
                    if (_selectedIndex == index)
                      StatusBadge(
                        text: 'Activo',
                        color: AppColors.orangeBrand,
                        size: BadgeSize.small,
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.orangeBrand,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.description,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Documentación del Paquete',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Guías completas para implementar el sistema de diseño',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGray,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Badges informativos
          Row(
            children: [
              StatusBadge(
                text: '${_sections.length} Secciones',
                color: AppColors.ochreBrand,
                size: BadgeSize.small,
              ),
              const SizedBox(width: 8),
              StatusBadge(
                text: 'Flutter',
                color: AppColors.oliveBrand,
                size: BadgeSize.small,
              ),
              const SizedBox(width: 8),
              NotificationBadge(
                text: 'Completa',
                color: AppColors.greenFree,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        // Category selector
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _sections.length,
            itemBuilder: (context, index) {
              final section = _sections[index];
              final isSelected = _selectedIndex == index;
              
              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        section.icon,
                        size: 16,
                        color: isSelected ? AppColors.white : AppColors.grayMedium,
                      ),
                      const SizedBox(width: 4),
                      Text(section.title),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  backgroundColor: AppColors.backCards,
                  selectedColor: AppColors.orangeBrand,
                  checkmarkColor: AppColors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.grayMedium,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
        // Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _buildSectionContent(_sections[_selectedIndex]),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionContent(DocumentationSection section) {
    switch (section.title) {
      case 'Introducción':
        return _buildIntroductionContent();
      case 'Instalación':
        return _buildInstallationContent();
      case 'Componentes':
        return _buildComponentsContent();
      case 'Iconos':
        return _buildIconsContent();
      case 'Tema':
        return _buildThemeContent();
      case 'Ejemplos':
        return _buildExamplesContent();
      default:
        return _buildIntroductionContent();
    }
  }

  Widget _buildIntroductionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Introducción', Icons.info),
        const SizedBox(height: 16),
        _buildContentCard(
          '¿Qué es flutter_package_app_mayoreo?',
          'flutter_package_app_mayoreo es un paquete de Flutter que proporciona un sistema de diseño completo para aplicaciones móviles. Incluye componentes UI reutilizables, iconos personalizados, paleta de colores y tipografía consistente.',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Características principales',
          '• Componentes UI predefinidos (botones, campos de texto)\n• Biblioteca de iconos SVG personalizados\n• Sistema de colores consistente\n• Tipografía optimizada\n• Tema Material 3 integrado\n• Fácil de usar y personalizar',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Versión actual',
          'Versión: 1.38.0\n\nEsta versión incluye:\n• Componentes básicos de UI\n• Iconos SVG organizados por categorías\n• Sistema de colores completo\n• Documentación detallada',
        ),
      ],
    );
  }

  Widget _buildInstallationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Instalación', Icons.download),
        const SizedBox(height: 16),
        _buildContentCard(
          '1. Agregar dependencia',
          'Agrega la dependencia a tu pubspec.yaml:\n\n```yaml\ndependencies:\n  flutter_package_app_mayoreo: ^1.38.0\n```',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          '2. Instalar dependencias',
          'Ejecuta el siguiente comando:\n\n```bash\nflutter pub get\n```',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          '3. Importar el paquete',
          'Importa el paquete en tu archivo Dart:\n\n```dart\nimport \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n```',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          '4. Configurar el tema',
          'Configura el tema en tu MaterialApp:\n\n```dart\nMaterialApp(\n  theme: FlutterPackageAppMayoreo.theme,\n  // ... resto de configuración\n)\n```',
        ),
      ],
    );
  }

  Widget _buildComponentsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Componentes', Icons.widgets),
        const SizedBox(height: 16),
        _buildContentCard(
          'UiButton',
          'Botón estandarizado con diferentes tipos y tamaños.\n\n**Tipos disponibles:**\n• Primary: Botón principal\n• Secondary: Botón secundario\n• Text: Botón de texto\n• Destructive: Botón destructivo\n\n**Tamaños:**\n• Small: 32px de altura\n• Medium: 40px de altura\n• Large: 48px de altura',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'AppTextField',
          'Campo de texto personalizado con estados y validación.\n\n**Características:**\n• Etiquetas y placeholders\n• Iconos prefix y suffix\n• Estados de error\n• Diferentes tamaños\n• Validación integrada',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Uso básico',
          '```dart\n// Botón primario\nUiButton(\n  onPressed: () {},\n  label: \'Mi Botón\',\n  type: UiButtonType.primary,\n)\n\n// Campo de texto\nAppTextField(\n  labelText: \'Email\',\n  hintText: \'ejemplo@correo.com\',\n  prefixIcon: Icon(Icons.email),\n)\n```',
        ),
      ],
    );
  }

  Widget _buildIconsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Iconos', Icons.style),
        const SizedBox(height: 16),
        _buildContentCard(
          'Biblioteca de iconos SVG',
          'El paquete incluye una biblioteca completa de iconos SVG organizados por categorías:\n\n• **Navegación:** Menú, flechas, cerrar, etc.\n• **Usuario:** Perfil, usuario activo/inactivo\n• **Pedidos:** Carrito, pedidos activo/inactivo\n• **Categorías:** Listas, categorías\n• **Favoritos:** Iconos de favoritos\n• **Pagos:** Tarjetas activas/inactivas\n• **Social:** WhatsApp y otros',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Uso de iconos',
          '```dart\nimport \'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart\';\n\n// Usar icono de Material Design\nIcon(\n  Icons.menu,\n  size: 24,\n  color: AppColors.darkGray,\n)\n```',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Categorías de iconos',
          '**Navegación:**\n• menu, arrow_back, keyboard_arrow_down, close, check, add, refresh\n\n**Usuario:**\n• person, person_outline, account_circle\n\n**Pedidos:**\n• shopping_cart, shopping_cart_outlined, shopping_bag, shopping_bag_outlined\n\n**Categorías:**\n• category, category_outlined, list, list_outlined\n\n**Favoritos:**\n• favorite, favorite_border\n\n**Pagos:**\n• credit_card, credit_card_outlined\n\n**Social:**\n• chat, share, mail',
        ),
      ],
    );
  }

  Widget _buildThemeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Tema', Icons.palette),
        const SizedBox(height: 16),
        _buildContentCard(
          'Sistema de colores',
          'El paquete incluye un sistema de colores completo:\n\n**Colores principales:**\n• orangeBrand: #e1a141\n• mysticGray: #dde5e8\n• backCards: #f1f0ec\n• black: #232323\n• white: #ffffff\n\n**Escala de grises:**\n• grayMedium: #a7adba\n• darkGray: #3d3d3d\n• warmGray: #888888\n• silverGrayMedium: #d4d4d4',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Tipografía',
          'Sistema de tipografía basado en Material 3:\n\n**Encabezados:**\n• headlineLarge, headlineMedium, headlineSmall\n\n**Cuerpo de texto:**\n• bodyLarge, bodyMedium, bodySmall\n\n**Etiquetas:**\n• labelLarge, labelMedium, labelSmall',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Uso del tema',
          '```dart\n// Acceder a colores\nAppColors.orangeBrand\nAppColors.mysticGray\nAppColors.backCards\n\n// Acceder a tipografía\nAppTypography.headlineLarge\nAppTypography.bodyMedium\nAppTypography.labelSmall\n\n// Tema completo\nFlutterPackageAppMayoreo.theme\n```',
        ),
      ],
    );
  }

  Widget _buildExamplesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Ejemplos', Icons.code),
        const SizedBox(height: 16),
        _buildContentCard(
          'Formulario de login',
          '```dart\nColumn(\n  children: [\n    AppTextField(\n      labelText: \'Email\',\n      hintText: \'ejemplo@correo.com\',\n      prefixIcon: Icon(Icons.email),\n    ),\n    SizedBox(height: 16),\n    AppTextField(\n      labelText: \'Contraseña\',\n      hintText: \'Ingresa tu contraseña\',\n      obscureText: true,\n      prefixIcon: Icon(Icons.lock),\n    ),\n    SizedBox(height: 24),\n    UiButton(\n      onPressed: () {},\n      label: \'Iniciar Sesión\',\n      type: UiButtonType.primary,\n    ),\n  ],\n)\n```',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Navegación con iconos',
          '```dart\nRow(\n  children: [\n    Icon(\n      Icons.menu,\n      size: 24,\n    ),\n    SizedBox(width: 16),\n    Text(\'Mi Aplicación\'),\n    Spacer(),\n    Icon(\n      Icons.person,\n      size: 24,\n    ),\n  ],\n)\n```',
        ),
        const SizedBox(height: 24),
        _buildContentCard(
          'Tarjeta de producto',
          '```dart\nContainer(\n  padding: EdgeInsets.all(16),\n  decoration: BoxDecoration(\n    color: AppColors.backCards,\n    borderRadius: BorderRadius.circular(12),\n  ),\n  child: Column(\n    children: [\n      Text(\n        \'Producto\',\n        style: AppTypography.titleMedium,\n      ),\n      SizedBox(height: 8),\n      UiButton(\n        onPressed: () {},\n        label: \'Agregar al carrito\',\n        type: UiButtonType.primary,\n        icon: Icons.shopping_cart,\n      ),\n    ],\n  ),\n)\n```',
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.orangeBrand, size: 28),
        const SizedBox(width: 12),
        Text(
          title,
          style: AppTypography.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ) ?? const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backCards,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ) ?? const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: AppTypography.bodyMedium?.copyWith(
              color: AppColors.grayMedium,
              height: 1.5,
            ) ?? TextStyle(
              color: AppColors.grayMedium,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentationSection {
  final String title;
  final IconData icon;
  final String description;

  DocumentationSection(this.title, this.icon, this.description);
}
