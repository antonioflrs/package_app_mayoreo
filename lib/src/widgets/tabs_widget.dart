import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// Tab variant styles
enum TabVariant {
  underlined,      // Tabs with underline for active state
  roundedLight,    // Tabs with light rounded background
  roundedDark,     // Tabs with darker rounded background
}

/// Tab item configuration
class TabItem {
  final String id;
  final String title;
  final bool isSelected;

  const TabItem({
    required this.id,
    required this.title,
    this.isSelected = false,
  });

  TabItem copyWith({
    String? id,
    String? title,
    bool? isSelected,
  }) {
    return TabItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Custom tabs widget with different variants
/// Follows the clean, minimalist design from the image
class CustomTabsWidget extends StatelessWidget {
  final List<TabItem> tabs;
  final TabVariant variant;
  final EdgeInsets? margin;
  final double? spacing;
  final Function(String)? onTabChanged;
  final bool showAddButton;
  final VoidCallback? onAddTab;
  final String? addButtonTooltip;

  const CustomTabsWidget({
    super.key,
    required this.tabs,
    this.variant = TabVariant.underlined,
    this.margin,
    this.spacing,
    this.onTabChanged,
    this.showAddButton = false,
    this.onAddTab,
    this.addButtonTooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          // Tabs
          ...tabs.map((tab) => _buildTab(tab)),
          
          // Spacing between tabs and add button
          if (showAddButton && tabs.isNotEmpty)
            SizedBox(width: spacing ?? 24),
          
          // Add button (optional)
          if (showAddButton) _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildTab(TabItem tab) {
    return Padding(
      padding: EdgeInsets.only(
        right: tabs.indexOf(tab) < tabs.length - 1 
            ? (spacing ?? 24) 
            : 0,
      ),
      child: _TabItemWidget(
        tab: tab,
        variant: variant,
        onTap: () => onTabChanged?.call(tab.id),
      ),
    );
  }

  Widget _buildAddButton() {
    return Tooltip(
      message: addButtonTooltip ?? 'Agregar nueva pestaña',
      child: GestureDetector(
        onTap: onAddTab,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.grayMedium.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            size: 16,
            color: AppColors.orangeBrand,
          ),
        ),
      ),
    );
  }
}

/// Individual tab item widget with variant support
class _TabItemWidget extends StatelessWidget {
  final TabItem tab;
  final TabVariant variant;
  final VoidCallback onTap;

  const _TabItemWidget({
    required this.tab,
    required this.variant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = tab.isSelected;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: _getDecoration(isSelected),
        child: Text(
          tab.title,
          style: _getTextStyle(theme, isSelected),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration(bool isSelected) {
    switch (variant) {
      case TabVariant.underlined:
        return BoxDecoration(
          border: isSelected ? Border(
            bottom: BorderSide(
              color: AppColors.orangeBrand,
              width: 3,
            ),
          ) : null,
        );
        
      case TabVariant.roundedLight:
        return BoxDecoration(
          color: isSelected ? AppColors.softGray : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(
            color: AppColors.grayMedium.withValues(alpha: 0.2),
            width: 1,
          ) : null,
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ] : null,
        );
        
      case TabVariant.roundedDark:
        return BoxDecoration(
          color: isSelected ? AppColors.grayMedium.withValues(alpha: 0.3) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(
            color: AppColors.grayMedium.withValues(alpha: 0.4),
            width: 1,
          ) : null,
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ] : null,
        );
    }
  }

  TextStyle _getTextStyle(ThemeData theme, bool isSelected) {
    return theme.textTheme.bodyMedium?.copyWith(
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      color: isSelected ? AppColors.black : AppColors.grayMedium,
      fontSize: 14,
    ) ?? const TextStyle();
  }
}

/// Convenience widget for preview/code tabs
class PreviewCodeTabs extends StatelessWidget {
  final bool showPreview;
  final VoidCallback onPreviewTap;
  final VoidCallback onCodeTap;
  final EdgeInsets? margin;
  final TabVariant variant;

  const PreviewCodeTabs({
    super.key,
    required this.showPreview,
    required this.onPreviewTap,
    required this.onCodeTap,
    this.margin,
    this.variant = TabVariant.underlined,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTabsWidget(
      margin: margin,
      variant: variant,
      tabs: [
        TabItem(
          id: 'preview',
          title: 'Vista previa',
          isSelected: showPreview,
        ),
        TabItem(
          id: 'code',
          title: 'Código',
          isSelected: !showPreview,
        ),
      ],
    );
  }
}

/// Tabs with dynamic content support
class DynamicTabsWidget extends StatefulWidget {
  final List<TabItem> initialTabs;
  final Widget Function(String tabId) contentBuilder;
  final EdgeInsets? margin;
  final double? spacing;
  final TabVariant variant;
  final bool showAddButton;
  final TabItem Function(int index)? tabBuilder;
  final VoidCallback? onTabAdded;
  final VoidCallback? onTabRemoved;

  const DynamicTabsWidget({
    super.key,
    required this.initialTabs,
    required this.contentBuilder,
    this.margin,
    this.spacing,
    this.variant = TabVariant.underlined,
    this.showAddButton = false,
    this.tabBuilder,
    this.onTabAdded,
    this.onTabRemoved,
  });

  @override
  State<DynamicTabsWidget> createState() => _DynamicTabsWidgetState();
}

class _DynamicTabsWidgetState extends State<DynamicTabsWidget> {
  late List<TabItem> _tabs;
  late String _selectedTabId;

  @override
  void initState() {
    super.initState();
    _tabs = List.from(widget.initialTabs);
    _selectedTabId = _tabs.isNotEmpty ? _tabs.first.id : '';
  }

  void _onTabChanged(String tabId) {
    setState(() {
      _selectedTabId = tabId;
    });
  }

  void _onAddTab() {
    final newIndex = _tabs.length;
    final newTab = widget.tabBuilder?.call(newIndex) ?? 
        TabItem(
          id: 'tab_$newIndex',
          title: 'Pestaña ${newIndex + 1}',
        );
    
    setState(() {
      _tabs.add(newTab);
      _selectedTabId = newTab.id;
    });
    
    widget.onTabAdded?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabs.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs header
        CustomTabsWidget(
          margin: widget.margin,
          spacing: widget.spacing,
          variant: widget.variant,
          tabs: _tabs.map((tab) => 
            tab.copyWith(isSelected: tab.id == _selectedTabId)
          ).toList(),
          onTabChanged: _onTabChanged,
          showAddButton: widget.showAddButton,
          onAddTab: _onAddTab,
        ),
        
        const SizedBox(height: 16),
        
        // Tab content
        if (_selectedTabId.isNotEmpty)
          widget.contentBuilder(_selectedTabId),
      ],
    );
  }
}

/// Tabs variants showcase widget
class TabsVariantsShowcase extends StatefulWidget {
  final EdgeInsets? margin;

  const TabsVariantsShowcase({
    super.key,
    this.margin,
  });

  @override
  State<TabsVariantsShowcase> createState() => _TabsVariantsShowcaseState();
}

class _TabsVariantsShowcaseState extends State<TabsVariantsShowcase> {
  String _selectedTabId = 'personal_info';

  final List<TabItem> _tabs = [
    const TabItem(
      id: 'personal_info',
      title: 'Información personal',
      isSelected: true,
    ),
    const TabItem(
      id: 'payment_methods',
      title: 'Métodos de pago',
      isSelected: false,
    ),
    const TabItem(
      id: 'account_settings',
      title: 'Configuración de cuenta',
      isSelected: false,
    ),
  ];

  void _onTabChanged(String tabId) {
    setState(() {
      _selectedTabId = tabId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Variantes',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Description
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.darkGray,
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'Utilice la propiedad '),
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.softGray,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'variant',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const TextSpan(text: ' para cambiar el estilo visual.'),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Preview/Code tabs
          PreviewCodeTabs(
            showPreview: true,
            onPreviewTap: () {},
            onCodeTap: () {},
            variant: TabVariant.underlined,
          ),
          
          const SizedBox(height: 24),
          
          // Tabs variants display
          Container(
            width: double.infinity,
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
                // Row 1: Underlined tabs
                CustomTabsWidget(
                  variant: TabVariant.underlined,
                  tabs: _tabs.map((tab) => 
                    tab.copyWith(isSelected: tab.id == _selectedTabId)
                  ).toList(),
                  onTabChanged: _onTabChanged,
                ),
                
                const SizedBox(height: 32),
                
                // Row 2: Rounded light tabs
                CustomTabsWidget(
                  variant: TabVariant.roundedLight,
                  tabs: _tabs.map((tab) => 
                    tab.copyWith(isSelected: tab.id == _selectedTabId)
                  ).toList(),
                  onTabChanged: _onTabChanged,
                ),
                
                const SizedBox(height: 32),
                
                // Row 3: Rounded dark tabs
                CustomTabsWidget(
                  variant: TabVariant.roundedDark,
                  tabs: _tabs.map((tab) => 
                    tab.copyWith(isSelected: tab.id == _selectedTabId)
                  ).toList(),
                  onTabChanged: _onTabChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
