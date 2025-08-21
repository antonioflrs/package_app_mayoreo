import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Widget de pestañas de producto dinámico y personalizable
class ProductTabsWidget extends StatefulWidget {
  /// Lista de pestañas con sus títulos y contenidos
  final List<ProductTab> tabs;
  
  /// Color de fondo del contenedor principal
  final Color? backgroundColor;
  
  /// Color de fondo de las pestañas inactivas
  final Color? inactiveTabBackgroundColor;
  
  /// Color del borde inferior de las pestañas activas
  final Color? activeTabBorderColor;
  
  /// Color del borde inferior de las pestañas inactivas
  final Color? inactiveTabBorderColor;
  
  /// Color del texto de las pestañas activas
  final Color? activeTabTextColor;
  
  /// Color del texto de las pestañas inactivas
  final Color? inactiveTabTextColor;
  
  /// Color del texto del contenido
  final Color? contentTextColor;
  
  /// Color del texto del disclaimer
  final Color? disclaimerTextColor;
  
  /// Texto del disclaimer (opcional)
  final String? disclaimerText;
  
  /// Radio de borde del contenedor principal
  final double? borderRadius;
  
  /// Padding del contenido
  final EdgeInsets? contentPadding;
  
  /// Padding de las pestañas
  final EdgeInsets? tabPadding;
  
  /// Tamaño de fuente de las pestañas
  final double? tabFontSize;
  
  /// Tamaño de fuente del contenido
  final double? contentFontSize;
  
  /// Tamaño de fuente del disclaimer
  final double? disclaimerFontSize;
  
  /// Pestaña seleccionada por defecto
  final int initialTabIndex;

  const ProductTabsWidget({
    super.key,
    required this.tabs,
    this.backgroundColor,
    this.inactiveTabBackgroundColor,
    this.activeTabBorderColor,
    this.inactiveTabBorderColor,
    this.activeTabTextColor,
    this.inactiveTabTextColor,
    this.contentTextColor,
    this.disclaimerTextColor,
    this.disclaimerText,
    this.borderRadius,
    this.contentPadding,
    this.tabPadding,
    this.tabFontSize,
    this.contentFontSize,
    this.disclaimerFontSize,
    this.initialTabIndex = 0,
  });

  @override
  State<ProductTabsWidget> createState() => _ProductTabsWidgetState();
}

class _ProductTabsWidgetState extends State<ProductTabsWidget> {
  late int selectedTabIndex;

  @override
  void initState() {
    super.initState();
    // Validar que haya al menos una pestaña
    if (widget.tabs.isEmpty) {
      throw ArgumentError('Debe haber al menos una pestaña');
    }
    selectedTabIndex = widget.initialTabIndex.clamp(0, widget.tabs.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contenedor principal con pestañas y contenido
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.softGray,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          ),
          child: Column(
            children: [
              // Sección de pestañas
              Row(
                children: widget.tabs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final tab = entry.value;
                  final isSelected = selectedTabIndex == index;
                  
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        padding: widget.tabPadding ?? const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? Colors.transparent 
                              : (widget.inactiveTabBackgroundColor ?? AppColors.white),
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected 
                                  ? (widget.activeTabBorderColor ?? AppColors.orangeBrand)
                                  : (widget.inactiveTabBorderColor ?? AppColors.silverGrayMedium),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          tab.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: widget.tabFontSize ?? 14,
                            fontFamily: "InterVariable",
                            fontWeight: isSelected 
                                ? FontWeight.w700 
                                : FontWeight.w400,
                            color: isSelected 
                                ? (widget.activeTabTextColor ?? AppColors.black)
                                : (widget.inactiveTabTextColor ?? AppColors.grayMedium),
                            fontFeatures: const [
                              FontFeature('ss01'),
                              FontFeature('cv11'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              
              // Sección de contenido
              Container(
                padding: widget.contentPadding ?? const EdgeInsets.all(20),
                child: Text(
                  widget.tabs[selectedTabIndex].content,
                  style: TextStyle(
                    fontSize: widget.contentFontSize ?? 14,
                    fontFamily: "InterVariable",
                    fontWeight: FontWeight.w400,
                    color: widget.contentTextColor ?? AppColors.black,
                    height: 1.4,
                    fontFeatures: const [
                      FontFeature('ss01'),
                      FontFeature('cv11'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
        // Texto de disclaimer fuera del contenedor
        if (widget.disclaimerText != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.disclaimerText!,
              style: TextStyle(
                fontSize: widget.disclaimerFontSize ?? 11,
                fontFamily: "InterVariable",
                fontWeight: FontWeight.w400,
                color: widget.disclaimerTextColor ?? AppColors.grayMedium,
                height: 1.3,
                fontFeatures: const [
                  FontFeature('ss01'),
                  FontFeature('cv11'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

/// Clase que representa una pestaña del widget
class ProductTab {
  /// Título de la pestaña
  final String title;
  
  /// Contenido de la pestaña
  final String content;

  const ProductTab({
    required this.title,
    required this.content,
  });
}

/// Widget ProductTabsWidget con configuración predefinida para modo de uso e ingredientes
class ProductTabsWidgetDefault extends StatelessWidget {
  final String modoDeUso;
  final String ingredientes;
  final String? disclaimerText;
  final Color? backgroundColor;
  final Color? activeTabBorderColor;
  final Color? activeTabTextColor;

  const ProductTabsWidgetDefault({
    super.key,
    required this.modoDeUso,
    required this.ingredientes,
    this.disclaimerText,
    this.backgroundColor,
    this.activeTabBorderColor,
    this.activeTabTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ProductTabsWidget(
      tabs: [
        ProductTab(
          title: 'MODO DE USO',
          content: modoDeUso,
        ),
        ProductTab(
          title: 'INGREDIENTES',
          content: ingredientes,
        ),
      ],
      disclaimerText: disclaimerText ?? 'Este producto no es un medicamento. El consumo de este producto es responsabilidad de quien lo recomienda y de quien lo usa.',
      backgroundColor: backgroundColor,
      activeTabBorderColor: activeTabBorderColor,
      activeTabTextColor: activeTabTextColor,
    );
  }
}

/// Widget ProductTabsWidget con configuración personalizada para productos de bienestar
class ProductTabsWidgetWellness extends StatelessWidget {
  final String descripcion;
  final String beneficios;
  final String? contraindicaciones;
  final String? disclaimerText;
  final Color? backgroundColor;
  final Color? activeTabBorderColor;
  final Color? activeTabTextColor;

  const ProductTabsWidgetWellness({
    super.key,
    required this.descripcion,
    required this.beneficios,
    this.contraindicaciones,
    this.disclaimerText,
    this.backgroundColor,
    this.activeTabBorderColor,
    this.activeTabTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = <ProductTab>[
      ProductTab(
        title: 'PESTAÑA #1',
        content: descripcion,
      ),
      ProductTab(
        title: 'PESTAÑA #2',
        content: beneficios,
      ),
    ];

    if (contraindicaciones != null) {
      tabs.add(ProductTab(
        title: 'PESTAÑA #3',
        content: contraindicaciones!,
      ));
    }

    return ProductTabsWidget(
      tabs: tabs,
      disclaimerText: disclaimerText ?? 'Este producto es un complemento alimenticio. Consulta con tu médico antes de consumir.',
      backgroundColor: backgroundColor,
      activeTabBorderColor: activeTabBorderColor,
      activeTabTextColor: activeTabTextColor,
    );
  }
}

/// Widget ProductTabsWidget con configuración para productos cosméticos
class ProductTabsWidgetCosmetic extends StatelessWidget {
  final String aplicacion;
  final String ingredientes;
  final String? precauciones;
  final String? disclaimerText;
  final Color? backgroundColor;
  final Color? activeTabBorderColor;
  final Color? activeTabTextColor;
  final Color? inactiveTabBackgroundColor;
  final Color? inactiveTabBorderColor;
  final Color? inactiveTabTextColor;
  final Color? contentTextColor;
  final Color? disclaimerTextColor;
  final double? borderRadius;
  final EdgeInsets? contentPadding;
  final EdgeInsets? tabPadding;
  final double? tabFontSize;
  final double? contentFontSize;
  final double? disclaimerFontSize;

  const ProductTabsWidgetCosmetic({
    super.key,
    required this.aplicacion,
    required this.ingredientes,
    this.precauciones,
    this.disclaimerText,
    this.backgroundColor,
    this.activeTabBorderColor,
    this.activeTabTextColor,
    this.inactiveTabBackgroundColor,
    this.inactiveTabBorderColor,
    this.inactiveTabTextColor,
    this.contentTextColor,
    this.disclaimerTextColor,
    this.borderRadius,
    this.contentPadding,
    this.tabPadding,
    this.tabFontSize,
    this.contentFontSize,
    this.disclaimerFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = <ProductTab>[
      ProductTab(
        title: 'PESTAÑA #1',
        content: aplicacion,
      ),
      ProductTab(
        title: 'PESTAÑA #2',
        content: ingredientes,
      ),
    ];

    if (precauciones != null) {
      tabs.add(ProductTab(
        title: 'PESTAÑA #3',
        content: precauciones!,
      ));
    }

    return ProductTabsWidget(
      tabs: tabs,
      disclaimerText: disclaimerText ?? 'Para uso externo únicamente. Evita el contacto con los ojos. En caso de irritación, suspende su uso.',
      backgroundColor: backgroundColor,
      activeTabBorderColor: activeTabBorderColor,
      activeTabTextColor: activeTabTextColor,
      inactiveTabBackgroundColor: inactiveTabBackgroundColor,
      inactiveTabBorderColor: inactiveTabBorderColor,
      inactiveTabTextColor: inactiveTabTextColor,
      contentTextColor: contentTextColor,
      disclaimerTextColor: disclaimerTextColor,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
      tabPadding: tabPadding,
      tabFontSize: tabFontSize,
      contentFontSize: contentFontSize,
      disclaimerFontSize: disclaimerFontSize,
    );
  }
}
