import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get allInCaps => toUpperCase();

  String get capitalizeFirstofEach => split(" ")
      .map((str) => str[0].toUpperCase() + str.substring(1))
      .join(" ");
}

class CommonStyle {
  static const double headerFontSize = 23;

  static TextStyle getInterFont(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      double? height,
      List<Shadow>? shadows,
      double? letterSpacing,
      MaterialColor? decorationColor}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        letterSpacing: letterSpacing ?? 0.3,
        decoration: decoration ?? TextDecoration.none,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        decorationColor: decorationColor,
        height: height,
        shadows: shadows,
      ),
    );
  }
}
