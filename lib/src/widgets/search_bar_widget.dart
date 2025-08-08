import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool enabled;
  final EdgeInsetsGeometry? margin;
  final String? iconPath;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Buscar en B Life®️ Mayoreo',
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.margin,
    this.iconPath,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
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
    
    // Cancelar el timer anterior
    _debounceTimer?.cancel();
    
    // Crear un nuevo timer para debouncing
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        _performSearch(query);
      }
    });
  }

  void _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showResults = false;
        _isSearching = false;
      });
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
        setState(() {
          _searchResults = [];
          _showResults = false;
          _isSearching = false;
        });
        // Mostrar error de búsqueda
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error en la búsqueda: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _clearSearch() {
    _controller.clear();
    _debounceTimer?.cancel();
    setState(() {
      _searchResults = [];
      _showResults = false;
      _isSearching = false;
    });
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
        // Barra de búsqueda
        Padding(
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: AppColors.silverGrayMedium,
                  width: 0.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: AppColors.silverGrayMedium,
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: AppColors.orangeBrand,
                  width: 1.0,
                ),
              ),
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
        ),
        
        // Resultados de búsqueda
        if (_showResults || _isSearching)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _isSearching 
                ? _buildLoadingIndicator()
                : SearchResultsWidget(
                    results: _searchResults,
                    onClose: _closeResults,
                  ),
          ),
      ],
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
} 