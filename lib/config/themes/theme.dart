import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';

ThemeData getAppTheme(BuildContext context) => ThemeData(
  useMaterial3: false,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
      //opacity: 0
    )
  )
);
//change here
