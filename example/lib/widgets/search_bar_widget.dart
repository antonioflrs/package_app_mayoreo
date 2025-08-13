import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';
import 'custom_search_results_widget.dart';

/// Widget personalizado de barra de búsqueda con navegación integrada
/// 
/// Este widget extiende la funcionalidad del SearchBarWidget del package
/// agregando navegación correcta a las pantallas correspondientes.
/// 
/// Ejemplo de uso:
/// ```dart
/// CustomSearchBarWidget(
///   hintText: 'Buscar componentes, tokens, iconos...',
///   onChanged: (query) {
///     // Callback opcional para manejar cambios en la búsqueda
///   },
/// )
/// ```
class CustomSearchBarWidget extends StatefulWidget {
  /// Texto de placeholder para la barra de búsqueda
  final String hintText;
  
  /// Callback que se ejecuta cuando cambia el texto de búsqueda
  final Function(String)? onChanged;
  
  /// Controlador de texto opcional
  final TextEditingController? controller;
  
  /// Si el widget está habilitado
  final bool enabled;
  
  /// Margen personalizado
  final EdgeInsetsGeometry? margin;
  
  /// Ruta del icono personalizado (opcional)
  final String? iconPath;

  const CustomSearchBarWidget({
    super.key,
    this.hintText = 'Buscar en B Life®️ Mayoreo',
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.margin,
    this.iconPath,
  });

  @override
  State<CustomSearchBarWidget> createState() => _CustomSearchBarWidgetState();
}

class _CustomSearchBarWidgetState extends State<CustomSearchBarWidget> {
  late TextEditingController _controller;
  List<SearchResult> _searchResults = [];
  bool _showResults = false;
  bool _isSearching = false;
  Timer? _debounceTimer;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _showResults = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    widget.onChanged?.call(query);
    
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        _performSearch(query);
      }
    });
  }

  void _performSearch(String query) async {
    if (query.isEmpty) {
      _clearSearchState();
      return;
    }

    setState(() {
      _isSearching = true;
    });

    try {
      final results = SearchService.search(query, context);
      if (mounted) {
        setState(() {
          _searchResults = results;
          _showResults = results.isNotEmpty;
          _isSearching = false;
        });
      }
    } catch (e) {
      if (mounted) {
        _clearSearchState();
        _showErrorSnackBar('Error en la búsqueda: $e');
      }
    }
  }

  void _clearSearchState() {
    setState(() {
      _searchResults = [];
      _showResults = false;
      _isSearching = false;
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _clearSearch() {
    _controller.clear();
    _debounceTimer?.cancel();
    _clearSearchState();
    widget.onChanged?.call('');
  }

  void _closeResults() {
    setState(() {
      _showResults = false;
    });
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
        if (_showResults || _isSearching) _buildSearchResults(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Barra de búsqueda principal
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: AppColors.grayMedium,
                      fontSize: 16,
                    ),
                    prefixIcon: _buildPrefixIcon(),
                    suffixIcon: _buildSuffixIcon(),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Badges informativos
          if (_searchResults.isNotEmpty || _isSearching)
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              child: Row(
                children: [
                  if (_isSearching)
                    StatusBadge(
                      text: 'Buscando...',
                      color: AppColors.orangeBrand,
                    )
                  else if (_searchResults.isNotEmpty)
                    StatusBadge(
                      text: '${_searchResults.length} resultados',
                      color: AppColors.greenFree,
                    ),
                  const SizedBox(width: 8),
                  if (_searchResults.isNotEmpty)
                    CategoryBadge(
                      text: 'Flutter',
                      color: AppColors.ochreBrand,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPrefixIcon() {
    if (widget.iconPath != null) {
      return SafeSvgIcon(
        iconPath: widget.iconPath!,
        width: 20,
        height: 20,
        color: AppColors.grayMedium,
      );
    }
    return Icon(
      Icons.search,
      color: AppColors.grayMedium,
      size: 20,
    );
  }

  Widget? _buildSuffixIcon() {
    if (_isSearching) {
      return const Padding(
        padding: EdgeInsets.only(right: 16),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.orangeBrand),
          ),
        ),
      );
    }

    if (_controller.text.isNotEmpty) {
      return IconButton(
        onPressed: _clearSearch,
        icon: const Icon(
          Icons.close,
          size: 18.0,
          color: AppColors.darkGray,
        ),
        padding: const EdgeInsets.all(5.0),
        constraints: const BoxConstraints(
          minWidth: 24.0,
          minHeight: 24.0,
        ),
      );
    }

    return null;
  }

  Widget _buildSearchResults() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: _isSearching 
          ? _buildLoadingIndicator()
          : CustomSearchResultsWidget(
              results: _searchResults,
              onClose: _closeResults,
            ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.grayMedium.withValues(alpha: 0.3),
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
      child: const Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.orangeBrand),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Buscando...',
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
