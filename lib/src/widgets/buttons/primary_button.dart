import 'package:flutter/material.dart';
import '../../theme/colors/app_colors.dart';

/// Un botón principal con estilo predefinido para la aplicación.
class PrimaryButton extends StatelessWidget {
  /// El texto que se mostrará dentro del botón.
  final String text;

  /// La función callback que se ejecuta cuando se presiona el botón.
  /// Si es nulo, el botón aparecerá deshabilitado.
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orangeBrand,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}