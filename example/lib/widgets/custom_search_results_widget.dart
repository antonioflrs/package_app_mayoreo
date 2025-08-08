import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import '../services/search_navigation_service.dart';

/// Widget personalizado para mostrar resultados de búsqueda con navegación integrada
/// 
/// Este widget extiende la funcionalidad del SearchResultsWidget del package
/// agregando navegación correcta a las pantallas correspondientes.
/// 
/// Ejemplo de uso:
/// ```dart
/// CustomSearchResultsWidget(
///   results: searchResults,
///   onClose: () {
///     // Callback para cerrar los resultados
///   },
/// )
/// ```
class CustomSearchResultsWidget extends StatelessWidget {
  /// Lista de resultados de búsqueda
  final List<SearchResult> results;
  
  /// Callback opcional para cerrar los resultados
  final VoidCallback? onClose;

  const CustomSearchResultsWidget({
    super.key,
    required this.results,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: _buildContainerDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onClose != null) _buildHeader(),
          _buildResultsList(),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: AppColors.silverGrayMedium.withValues(alpha: 0.3),
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withValues(alpha: 0.1),
          blurRadius: 8.0,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.silverGrayMedium.withValues(alpha: 0.2),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            '${results.length} resultado${results.length == 1 ? '' : 's'}',
            style: const TextStyle(
              fontSize: 12.0,
              color: AppColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onClose,
            icon: const Icon(
              Icons.close,
              size: 18.0,
              color: AppColors.darkGray,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 24.0,
              minHeight: 24.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300.0),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: results.length,
        separatorBuilder: (context, index) => _buildSeparator(),
        itemBuilder: (context, index) {
          final result = results[index];
          return _CustomSearchResultItem(result: result);
        },
      ),
    );
  }

  Widget _buildSeparator() {
    return Divider(
      height: 1.0,
      color: AppColors.silverGrayMedium.withValues(alpha: 0.2),
    );
  }
}

/// Widget individual para cada resultado de búsqueda
class _CustomSearchResultItem extends StatelessWidget {
  final SearchResult result;

  const _CustomSearchResultItem({required this.result});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleNavigation(context),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            _buildResultIcon(),
            const SizedBox(width: 12.0),
            Expanded(child: _buildResultContent()),
            _buildNavigationIcon(),
          ],
        ),
      ),
    );
  }

  void _handleNavigation(BuildContext context) {
    SearchNavigationService.navigateToSearchResult(result, context);
  }

  Widget _buildResultIcon() {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: _getTypeColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: _buildIconContent(),
      ),
    );
  }

  Widget _buildIconContent() {
    if (result.iconPath != null) {
      return SafeSvgIcon(
        iconPath: result.iconPath!,
        width: 16.0,
        height: 16.0,
        color: _getTypeColor(),
        fallback: _buildFallbackIcon(),
      );
    }
    return _buildFallbackIcon();
  }

  Widget _buildFallbackIcon() {
    return Icon(
      result.icon ?? Icons.widgets,
      size: 16.0,
      color: _getTypeColor(),
    );
  }

  Widget _buildResultContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 2.0),
        _buildDescription(),
        if (result.iconPath != null) ...[
          const SizedBox(height: 4.0),
          _buildIconPath(),
        ],
        if (result.category != null) ...[
          const SizedBox(height: 4.0),
          _buildCategoryBadge(),
        ],
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      result.title,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription() {
    return Text(
      result.description,
      style: const TextStyle(
        fontSize: 12.0,
        color: AppColors.darkGray,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildIconPath() {
    return Text(
      result.iconPath!,
      style: const TextStyle(
        fontSize: 10.0,
        color: AppColors.grayMedium,
        fontFamily: 'monospace',
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCategoryBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        color: _getTypeColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        result.category!,
        style: TextStyle(
          fontSize: 10.0,
          color: _getTypeColor(),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildNavigationIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 14.0,
      color: AppColors.grayMedium,
    );
  }

  Color _getTypeColor() {
    switch (result.type) {
      case SearchResultType.component:
        return AppColors.orangeBrand;
      case SearchResultType.token:
        return AppColors.black;
      case SearchResultType.icon:
        return AppColors.orangeBrand;
      case SearchResultType.color:
        return Colors.purple;
      case SearchResultType.typography:
        return Colors.blue;
    }
  }
}
