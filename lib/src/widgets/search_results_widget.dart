import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<SearchResult> results;
  final VoidCallback? onClose;

  const SearchResultsWidget({
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
      decoration: BoxDecoration(
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
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header con botón de cerrar
          if (onClose != null)
            Container(
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
            ),
          
          // Lista de resultados
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300.0),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: results.length,
              separatorBuilder: (context, index) => Divider(
                height: 1.0,
                color: AppColors.silverGrayMedium.withValues(alpha: 0.2),
              ),
              itemBuilder: (context, index) {
                return _SearchResultItem(result: results[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final SearchResult result;

  const _SearchResultItem({required this.result});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: result.onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // Icono del resultado
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: _getTypeColor().withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Center(
                child: result.iconPath != null
                    ? SafeSvgIcon(
                        iconPath: result.iconPath!,
                        width: 16.0,
                        height: 16.0,
                        color: _getTypeColor(),
                      )
                    : Icon(
                        result.icon ?? Icons.widgets,
                        size: 16.0,
                        color: _getTypeColor(),
                      ),
              ),
            ),
            
            const SizedBox(width: 12.0),
            
            // Contenido del resultado
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                                     Text(
                     result.title,
                     style: const TextStyle(
                       fontSize: 14.0,
                       fontWeight: FontWeight.w600,
                       color: AppColors.black,
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                   const SizedBox(height: 2.0),
                   Text(
                     result.description,
                     style: const TextStyle(
                       fontSize: 12.0,
                       color: AppColors.darkGray,
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                   if (result.iconPath != null) ...[
                     const SizedBox(height: 4.0),
                     Text(
                       result.iconPath!,
                       style: const TextStyle(
                         fontSize: 10.0,
                         color: AppColors.grayMedium,
                         fontFamily: 'monospace',
                       ),
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                     ),
                   ],
                  if (result.category != null) ...[
                    const SizedBox(height: 4.0),
                    Container(
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
                    ),
                  ],
                ],
              ),
            ),
            
            // Icono de navegación
            Icon(
              Icons.arrow_forward_ios,
              size: 14.0,
              color: AppColors.grayMedium,
            ),
          ],
        ),
      ),
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
