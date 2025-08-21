import 'package:flutter/material.dart';
import '../../theme/colors/app_colors.dart';

class CustomTextInput extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextInput({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  CustomTextInputState createState() => CustomTextInputState();
}

class CustomTextInputState extends State<CustomTextInput> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  late final TextEditingController _internalController;
  bool _usingInternalController = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);

    if (widget.controller == null) {
      _internalController = TextEditingController();
      _usingInternalController = true;
    } else {
      _internalController = widget.controller!;
      _usingInternalController = false;
    }

    _internalController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();

    _internalController.removeListener(_onTextChanged);
    if (_usingInternalController) {
      _internalController.dispose();
    }

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool showFocusedStyle = _isFocused || _internalController.text.isNotEmpty;

    return TextField(
      controller: _internalController,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.silverGrayMedium,
      style: TextStyle(
        fontSize: showFocusedStyle ? 14.0 : 14.0,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        isDense: true,
        labelText: showFocusedStyle ? widget.hintText : null,
        labelStyle: TextStyle(color: AppColors.warmGray, fontSize: 14.0),
        hintText: showFocusedStyle ? null : widget.hintText,
        hintStyle: TextStyle(color: AppColors.warmGray, fontSize: 14.0),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color:
                showFocusedStyle
                    ? AppColors.silverGrayMedium
                    : AppColors.silverGrayMedium,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color:
                showFocusedStyle
                    ? AppColors.silverGrayMedium
                    : AppColors.silverGrayMedium,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color:
                showFocusedStyle
                    ? AppColors.silverGrayMedium
                    : AppColors.silverGrayMedium,
          ),
        ),
      ),
    );
  }
}

/// Text field size options (mantenido para compatibilidad)
enum AppTextFieldSize { small, medium, large }

/// Alias para compatibilidad hacia atrás
class AppTextField extends CustomTextInput {
  const AppTextField({
    super.key,
    required super.hintText,
    super.keyboardType,
    super.controller,
  });
} 