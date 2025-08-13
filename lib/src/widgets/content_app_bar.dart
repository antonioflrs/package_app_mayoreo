import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

/// App bar unificado para pantallas de contenido de widgets.
/// Incluye botón de retroceso, título y una sugerencia UX opcional.
class ContentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? hintText;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool showDivider;
  final Color? backgroundColor;

  const ContentAppBar({
    super.key,
    required this.title,
    this.hintText,
    this.onBack,
    this.actions,
    this.showDivider = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color bg = backgroundColor ?? theme.colorScheme.surface;

    return AppBar(
      titleSpacing: 0,
      backgroundColor: bg,
      elevation: 0,
      leading: _buildBackButton(context),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(_bottomHeight(theme)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (hintText != null) _buildHint(theme),
            if (showDivider)
              Container(
                height: 1,
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      tooltip: 'Volver',
      onPressed: onBack ?? () => Navigator.maybePop(context),
      icon: const SafeSvgIcon(
        iconPath: PackageIcons.arrowLeft,
        height: 20,
      ),
    );
  }

  Widget _buildHint(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.softGray,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.grayMedium.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            const SafeSvgIcon(
              iconPath: PackageIcons.alertIcon,
              height: 16,
              color: AppColors.grayMedium,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                hintText!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.darkGray,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _bottomHeight(ThemeData theme) {
    double height = 0;
    if (hintText != null) {
      height += 8 + 8 + 16; // padding + chip height approx
    }
    if (showDivider) height += 1;
    return height;
  }

  @override
  Size get preferredSize {
    // kToolbarHeight + bottom preferred size
    final double bottom = (hintText != null ? 32 : 0) + (showDivider ? 1 : 0);
    return Size.fromHeight(kToolbarHeight + bottom);
  }
}


