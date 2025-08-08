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
        final results = SearchService.search(query, context);
        setState(() {
          _searchResults = results;
          _showResults = query.isNotEmpty && results.isNotEmpty;
        });
      }
    });
  }

  void _clearSearch() {
    _controller.clear();
    setState(() {
      _searchResults = [];
      _showResults = false;
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
              suffixIcon: _controller.text.isNotEmpty 
                  ? IconButton(
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
                    )
                  : _buildSearchIcon(),
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
        if (_showResults)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SearchResultsWidget(
              results: _searchResults,
              onClose: _closeResults,
            ),
          ),
      ],
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