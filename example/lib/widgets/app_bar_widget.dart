import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final bool showMenuButton;
  final bool showSearchButton;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.onMenuPressed,
    this.onSearchPressed,
    this.showMenuButton = true,
    this.showSearchButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AppBar(
      title: _buildTitle(),
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      leading: showMenuButton ? _buildMenuButton() : null,
      actions: _buildActions(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SafeSvgIcon(
              iconPath: PackageIcons.bToolkitCopia,
              width: 60,
              height: 24,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.softGray,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            '1.38.0',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.grayMedium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppColors.grayMedium),
      onPressed: onMenuPressed,
      tooltip: 'Abrir menú',
    );
  }

  List<Widget> _buildActions() {
    final List<Widget> actionWidgets = [];

    if (showSearchButton) {
      actionWidgets.add(
        IconButton(
          icon: const Icon(Icons.search, color: AppColors.grayMedium),
          onPressed: onSearchPressed,
          tooltip: 'Búsqueda',
        ),
      );
    }

    if (actions != null) {
      actionWidgets.addAll(actions!);
    }

    return actionWidgets;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} 