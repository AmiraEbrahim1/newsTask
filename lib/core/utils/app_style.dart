import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_fonts.dart';

TextStyle getBoldTextStyle({
  double? fontSize = 16,
  Color? color,
  String? fontFamily=FontFamilies.interFamily ,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return
    TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeights.bold,
    fontFamily: fontFamily=FontFamilies.interFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  )
  ;
}

// Primary Text Style
TextStyle getRegularTextStyle({
  double? fontSize=15,
  Color? color,
  FontWeight? fontWeight,
  String? fontFamily=FontFamilies.interFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
  TextOverflow?overflow
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight ?? FontWeight.w400,
    fontFamily: fontFamily=FontFamilies.interFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
    overflow: overflow
  );
}

// Secondary Text Style
TextStyle getSemiBoldTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  String? fontFamily=FontFamilies.interFamily ,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeights.semiBold,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}
