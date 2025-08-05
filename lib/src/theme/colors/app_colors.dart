import 'package:flutter/material.dart';

/// Color scheme configuration for the app_mayoreo package
class AppColors {
  AppColors._();

  // Main colors
  static const Color orangeBrand = Color(0xffe1a141);
  static const Color ochreBrand = Color(0xffc79022);
  static const Color oliveBrand = Color(0xff84861c);
  static const Color lightTan = Color(0xfff1d992);
  static const Color backCards = Color(0xfff1f0ec);
  static const Color black = Color(0xff232323);
  static const Color grayMedium = Color(0xffa7adba);
  static const Color white = Color(0xffffffff);
  static const Color softGray = Color(0xfff9f9f9);

  // De apoyo
  static const Color digitalRed = Color(0xffff0000);
  static const Color orangeRed = Color(0xffff5757);
  static const Color fadedRed = Color(0xffd54c4c);
  static const Color cappuccinoWhite = Color(0xffe5e6c8);
  static const Color limeGreen = Color(0xff32cd32);
  static const Color greenFree = Color(0xff047B5D);
  static const Color smokeGreenMedium = Color(0xff9ba65c);
  static const Color greenBorder = Color(0xff21CD5B);
  static const Color truGreen = Color(0xff299617);
  static const Color yellow = Color(0xfffada28);
  static const Color amarilloSuscripciones = Color(0xffF3BE55);

  // Gray Scale
  static const Color backGratis = Color(0xffddffe9);
  static const Color mysticGray = Color(0xffdde5e8);
  static const Color silverGrayMedium = Color(0xffd4d4d4);
  static const Color slateCoolGray = Color(0xff708090);
  static const Color warmGray = Color(0xff888888);
  static const Color darkGray = Color(0xff3d3d3d);
  static const Color pureBlack = Color(0xff000000);

  /// Main color scheme for the app (single theme)
  static ColorScheme get colorScheme => const ColorScheme(
    brightness: Brightness.light,
    primary: orangeBrand,
    onPrimary: white,
    secondary: ochreBrand,
    onSecondary: white,
    tertiary: oliveBrand,
    onTertiary: white,
    error: digitalRed,
    onError: white,
    surface: backCards,
    onSurface: black,
    surfaceContainerHighest: softGray,
    onSurfaceVariant: grayMedium,
    outline: silverGrayMedium,
    outlineVariant: mysticGray,
    shadow: pureBlack,
    scrim: pureBlack,
    inverseSurface: black,
    onInverseSurface: white,
    inversePrimary: lightTan,
    surfaceTint: orangeBrand,
  );

  /// Legacy getters for backward compatibility (now all return the same scheme)
  static ColorScheme get lightColorScheme => colorScheme;
  static ColorScheme get darkColorScheme => colorScheme;
}