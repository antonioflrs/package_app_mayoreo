import 'package:flutter/material.dart';
import '../../theme/colors/app_colors.dart';

/// Custom text field widget for the app_mayoreo package
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = false,
    this.focusNode,
    this.size = AppTextFieldSize.medium,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final bool autofocus;
  final FocusNode? focusNode;
  final AppTextFieldSize size;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: theme.textTheme.labelLarge?.copyWith(
              color: _hasFocus 
                  ? AppColors.orangeBrand
                  : AppColors.grayMedium,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          autofocus: widget.autofocus,
          style: _getTextStyle(theme),
          decoration: _buildInputDecoration(theme),
        ),
        if (widget.helperText != null && widget.errorText == null) ...[
          const SizedBox(height: 4),
          Text(
            widget.helperText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.grayMedium,
            ),
          ),
        ],
      ],
    );
  }

  TextStyle _getTextStyle(ThemeData theme) {
    return theme.textTheme.bodyLarge?.copyWith(
      color: widget.enabled 
          ? AppColors.black
          : AppColors.grayMedium,
    ) ?? const TextStyle();
  }

  InputDecoration _buildInputDecoration(ThemeData theme) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: theme.textTheme.bodyLarge?.copyWith(
        color: AppColors.grayMedium,
      ),
      prefixIcon: widget.prefixIcon,
      suffixIcon: _buildSuffixIcon(theme),
      filled: true,
      fillColor: widget.enabled 
          ? AppColors.softGray
          : AppColors.backCards,
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildBorder(isFocused: true),
      errorBorder: _buildBorder(isError: true),
      focusedErrorBorder: _buildBorder(isFocused: true, isError: true),
      contentPadding: _getContentPadding(),
      errorText: widget.errorText,
      errorStyle: theme.textTheme.bodySmall?.copyWith(
        color: AppColors.digitalRed,
      ),
    );
  }

  Widget? _buildSuffixIcon(ThemeData theme) {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.grayMedium,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    return widget.suffixIcon;
  }

  OutlineInputBorder _buildBorder({
    bool isFocused = false,
    bool isError = false,
  }) {
    Color borderColor;
    double borderWidth = 1;

    if (isError) {
      borderColor = AppColors.digitalRed;
    } else if (isFocused) {
      borderColor = AppColors.orangeBrand;
      borderWidth = 2;
    } else {
      borderColor = AppColors.silverGrayMedium;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }

  EdgeInsets _getContentPadding() {
    switch (widget.size) {
      case AppTextFieldSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case AppTextFieldSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case AppTextFieldSize.large:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    }
  }
}

/// Text field size options
enum AppTextFieldSize { small, medium, large } 