import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class AbstractText extends StatelessWidget {
  AbstractText({super.key,required this.model});
  Results?model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height: 80.h,
      child: Text(
        model!.abstract!,style: getRegularTextStyle(
          fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.greyColor),),
    );
  }
}
