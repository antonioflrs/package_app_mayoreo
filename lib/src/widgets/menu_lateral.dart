import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';
import 'expandable_menu_item.dart';
import 'category_item.dart';

/// Widget de menú lateral personalizable
class MenuLateral extends StatefulWidget {
  /// Logo del menú (opcional)
  final Widget? logoWidget;
  
  /// Título del menú (opcional)
  final String? title;
  
  /// Color de fondo del menú
  final Color? backgroundColor;
  
  /// Color del texto del título
  final Color? titleColor;
  
  /// Color de los iconos
  final Color? iconColor;
  
  /// Color del texto de los elementos del menú
  final Color? textColor;
  
  /// Color del texto del perfil
  final Color? profileTextColor;
  
  /// Color del texto "Ver perfil"
  final Color? viewProfileTextColor;
  
  /// Color del texto "Cerrar sesión"
  final Color? logoutTextColor;
  
  /// Nombre del usuario
  final String? userName;
  
  /// Lista de elementos del menú
  final List<MenuLateralItem> menuItems;
  
  /// Callback cuando se selecciona una categoría
  final Function(int index, String title)? onCategorySelected;
  
  /// Callback cuando se presiona "Ver perfil"
  final VoidCallback? onViewProfile;
  
  /// Callback cuando se presiona "Cerrar sesión"
  final VoidCallback? onLogout;
  
  /// Altura del header del menú
  final double headerHeight;
  
  /// Padding horizontal del menú
  final double horizontalPadding;
  
  /// Espaciado entre elementos del menú
  final double itemSpacing;

  const MenuLateral({
    super.key,
    this.logoWidget,
    this.title,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.textColor,
    this.profileTextColor,
    this.viewProfileTextColor,
    this.logoutTextColor,
    this.userName,
    required this.menuItems,
    this.onCategorySelected,
    this.onViewProfile,
    this.onLogout,
    this.headerHeight = 40.0,
    this.horizontalPadding = 16.0,
    this.itemSpacing = 5.0,
  });

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  void _selectCategory(int index) {
    widget.onCategorySelected?.call(index, widget.menuItems[index].title);
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();
    
    return Drawer(
      backgroundColor: colors.backgroundColor,
      child: Column(
        children: [
          // Header del menú
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // Header con logo y botón de cerrar
                SafeArea(
                  child: Container(
                    height: widget.headerHeight,
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.horizontalPadding,
                    ),
                    child: Stack(
                      children: [
                        // Logo o título (izquierda)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: widget.logoWidget ?? _buildTitle(colors),
                        ),
                        // Botón de cerrar (derecha)
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: colors.iconColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Elementos del menú
                ...widget.menuItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  
                  return Padding(
                    padding: EdgeInsets.only(bottom: widget.itemSpacing),
                    child: _buildMenuItem(item, index),
                  );
                }),
              ],
            ),
          ),

          // Sección de perfil de usuario
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre del usuario
                Text(
                  widget.userName ?? 'Usuario',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: colors.profileTextColor,
                  ),
                ),
                SizedBox(height: 4.0),
                // Opción "Ver perfil"
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: widget.onViewProfile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ver perfil',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: colors.viewProfileTextColor,
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: colors.viewProfileTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.0),

          // Opción "Cerrar sesión"
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
              vertical: 8.0,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: widget.onLogout,
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    size: 20.0,
                    color: colors.logoutTextColor,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "InterVariable",
                      color: colors.logoutTextColor,
                      fontFeatures: [
                        FontFeature('ss01'),
                        FontFeature('cv11'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Separador final
          Divider(
            height: 32.0,
            thickness: 1.0,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(_MenuLateralColors colors) {
    if (widget.title == null) return const SizedBox.shrink();
    
    return Text(
      widget.title!,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: colors.titleColor,
        fontFamily: 'InterVariable',
      ),
    );
  }

  Widget _buildMenuItem(MenuLateralItem item, int index) {
    if (item is MenuLateralExpandableItem) {
      return ExpandableMenuItem(
        title: item.title,
        children: item.children,
        onSubcategorySelected: (subIndex, subItem) {
          _selectCategory(index);
        },
      );
    } else if (item is MenuLateralSimpleItem) {
      return CategoryItem(
        title: item.title,
        variant: CategoryItemVariant.withIcon,
        initialSelected: item.isSelected,
        onTap: () {
          _selectCategory(index);
          item.onTap?.call();
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  _MenuLateralColors _getColors() {
    return _MenuLateralColors(
      backgroundColor: widget.backgroundColor ?? AppColors.white,
      titleColor: widget.titleColor ?? AppColors.black,
      iconColor: widget.iconColor ?? AppColors.black,
      textColor: widget.textColor ?? AppColors.black,
      profileTextColor: widget.profileTextColor ?? AppColors.black,
      viewProfileTextColor: widget.viewProfileTextColor ?? Colors.grey[600]!,
      logoutTextColor: widget.logoutTextColor ?? AppColors.black,
    );
  }
}

/// Clase para personalizar colores del MenuLateral
class _MenuLateralColors {
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;
  final Color textColor;
  final Color profileTextColor;
  final Color viewProfileTextColor;
  final Color logoutTextColor;

  const _MenuLateralColors({
    required this.backgroundColor,
    required this.titleColor,
    required this.iconColor,
    required this.textColor,
    required this.profileTextColor,
    required this.viewProfileTextColor,
    required this.logoutTextColor,
  });
}

/// Clase base para elementos del menú lateral
abstract class MenuLateralItem {
  final String title;
  final VoidCallback? onTap;

  const MenuLateralItem({
    required this.title,
    this.onTap,
  });
}

/// Elemento expandible del menú
class MenuLateralExpandableItem extends MenuLateralItem {
  final List<SubcategoryItem> children;
  final String? activeIconPath;
  final String? inactiveIconPath;

  const MenuLateralExpandableItem({
    required super.title,
    required this.children,
    this.activeIconPath,
    this.inactiveIconPath,
    super.onTap,
  });
}

/// Elemento simple del menú
class MenuLateralSimpleItem extends MenuLateralItem {
  final String? activeIconPath;
  final String? inactiveIconPath;
  final bool isSelected;

  const MenuLateralSimpleItem({
    required super.title,
    this.activeIconPath,
    this.inactiveIconPath,
    this.isSelected = false,
    super.onTap,
  });
}

/// Widget de menú lateral con tema oscuro predefinido
class MenuLateralDark extends StatelessWidget {
  final Widget? logoWidget;
  final String? title;
  final String? userName;
  final List<MenuLateralItem> menuItems;
  final Function(int index, String title)? onCategorySelected;
  final VoidCallback? onViewProfile;
  final VoidCallback? onLogout;

  const MenuLateralDark({
    super.key,
    this.logoWidget,
    this.title,
    this.userName,
    required this.menuItems,
    this.onCategorySelected,
    this.onViewProfile,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return MenuLateral(
      logoWidget: logoWidget,
      title: title,
      userName: userName,
      menuItems: menuItems,
      backgroundColor: const Color(0xFF1E1E1E),
      titleColor: Colors.white,
      iconColor: Colors.white,
      textColor: Colors.white,
      profileTextColor: Colors.white,
      viewProfileTextColor: Colors.white70,
      logoutTextColor: Colors.white,
      onCategorySelected: onCategorySelected,
      onViewProfile: onViewProfile,
      onLogout: onLogout,
    );
  }
}

/// Widget de menú lateral con tema de marca personalizable
class MenuLateralBrand extends StatelessWidget {
  final Widget? logoWidget;
  final String? title;
  final String? userName;
  final List<MenuLateralItem> menuItems;
  final Color primaryColor;
  final Color secondaryColor;
  final Function(int index, String title)? onCategorySelected;
  final VoidCallback? onViewProfile;
  final VoidCallback? onLogout;

  const MenuLateralBrand({
    super.key,
    this.logoWidget,
    this.title,
    this.userName,
    required this.menuItems,
    required this.primaryColor,
    required this.secondaryColor,
    this.onCategorySelected,
    this.onViewProfile,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return MenuLateral(
      logoWidget: logoWidget,
      title: title,
      userName: userName,
      menuItems: menuItems,
      backgroundColor: primaryColor,
      titleColor: secondaryColor,
      iconColor: secondaryColor,
      textColor: secondaryColor,
      profileTextColor: secondaryColor,
      viewProfileTextColor: secondaryColor.withValues(alpha: 0.7),
      logoutTextColor: secondaryColor,
      onCategorySelected: onCategorySelected,
      onViewProfile: onViewProfile,
      onLogout: onLogout,
    );
  }
}
