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
        _buildSearchTextField(),
        if (_showResults || _isSearching) _buildSearchResults(),
      ],
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.darkGray,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppColors.white,
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(isFocused: true),
          suffixIcon: _buildSuffixIcon(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 10.0,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({bool isFocused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: isFocused ? AppColors.orangeBrand : AppColors.silverGrayMedium,
        width: isFocused ? 1.0 : 0.5,
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (_isSearching) {
      return const Padding(
        padding: EdgeInsets.all(5.0),
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

    return _buildSearchIcon();
  }

  Widget _buildSearchIcon() {
    if (widget.iconPath != null) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: SafeSvgIcon(
          iconPath: widget.iconPath!,
          width: 20,
          height: 20,
          color: AppColors.grayMedium,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        Icons.search,
        size: 20,
        color: AppColors.grayMedium,
      ),
    );
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
