import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/config/routes/app_routes_helper.dart';
import 'package:news_app/core/utils/size-utils.dart';
extension StringExtension on String {
  String get removeSpaces => replaceAll(' ', '');
  int get codeFromString {
    String formattedStringColor = removeSpaces;
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6) ? formattedStringColor.addAtStart('FF') : formattedStringColor;
    return int.parse(formattedStringColor, radix: 16);
  }

  Color get colorFromString {
    String formattedStringColor = removeSpaces.toUpperCase();
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6) ? formattedStringColor.addAtStart('FF') : formattedStringColor;
    return Color(int.parse(formattedStringColor, radix: 16));
  }
  dynamic get fromStringToJson => jsonDecode(this);
  String get capitalize => toUpperCase();
  String addAtStart(String start) => "$start$this";
  bool isLengthEqual(int length) => this.length == length;
  int get toInt => int.parse(this);
  // String tr() {
  //   return AppLocalizations.of(AppService().getContext)!.translate(this) ?? this;
  // }

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => (isEmpty) || (this == 'null');
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }
  bool isJson() {
    try {
      json.decode(validate());
    } catch (e) {
      return false;
    }
    return true;
  }
  isEqualTo(value)=>this==value;
  isNotEqualTo(value)=>this!=value;
  get getBack => pop();
  // get moveToAndRemoveCurrent => pushRoute(this, isToReplace: true);
  get moveTo => pushRoute(this);
  // get pushAndRemoveAllUntil => pushRoute(this, isNewTask: true);
  // pushReplacementWithData(Map<String, dynamic>? arguments) => pushRoute(this, isToReplace: true, arguments: arguments);
   pushWithData(dynamic arguments) => pushRoute(this, arguments: arguments);
  // pushAndRemoveAllWithDataUntil(Map<String, dynamic>? arguments) => pushRoute(this, isNewTask: true, arguments: arguments);
  // popScreen([Object? object]) => pop(object);
  // popScreenWithArgument([Object? object]) => pop(object);
}

extension CutomMethodsOnNullObject on Object? {
  String get fromJsonToString => jsonEncode(this);
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNotNullAndIsFalse => this != null && this == false;
  bool get isNotNullAndIsTrue => this != null && this == true;
  bool get isNullOrIsFalse => this == null || this == true;
  bool get isNotNullOrFalse => this != null || this != true;
  bool get isNotFalse => this != false;
  bool get isNotTrue => this != true;
  bool get isTrue => this == true;
  bool get isFalse => this == false;
}
extension CutomMethodsOnObject on Object {
  isEqualTo(value)=>this==value;
  isNotEqualTo(value)=>this!=value;
}

extension StringNullExtension on String? {
  String get validate => this == null ? '' : this!;
  int get toInt => validate.isEmpty ? 0 : int.parse(this!);
  bool get isNotNull => this != null;
  bool get isNull => this == null;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  // String get tr => isNotNull ? AppLocalizations.tr(context)anslate(this!)! : "";
}

extension IntExtension on int {
  Duration get milliseconds => Duration(milliseconds: this);
  bool isSuccessful() => this >= 200 && this <= 206;
  double get h => getVerticalSize(toDouble());
  double get w => getHorizontalSize(toDouble());
  double get r => getVerticalSize(toDouble());

  SizedBox get vs => SizedBox(height: h);
  SizedBox get hs => SizedBox(width: w);
}

extension BullBoolExtension on bool? {
  /* null false , false false */
  bool get validate => this == null ? false : this!;
}
extension BoolExtension on bool {
  /* null false , false false */
  bool get isFalse=>this==false;
  bool get isTrue=>this==true;
}

extension ListExtension on List<dynamic>? {
  List<dynamic> get validate => this == null ? [] : this!;
}

/* json decode and encode*/
extension MapExtension on Map<String, dynamic> {}

extension DateTimeExtension on DateTime? {
  /*validate*/
  /* string to date time */
  /* formate */
}




extension DynamicExtension on dynamic {
  Map<String, dynamic> get json => jsonDecode(this);
  isEqualTo(value)=>this==value;
  isNotEqualTo(value)=>this!=value;
}

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension DoubleExtension on double {
  double get h => getVerticalSize(this);
  double get w => getHorizontalSize(this);
  double get r => getVerticalSize(this);

  SizedBox get vs => SizedBox(height:h);
  SizedBox get hs => SizedBox(width: w);
  Radius get radius=>Radius.circular(this);
  BorderRadius get borderRadius=>BorderRadius.circular(this);
}
