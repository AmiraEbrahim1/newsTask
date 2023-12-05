import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class ByLine extends StatelessWidget {
  ByLine({super.key,required this.model});
  Results? model;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
          model!.byline == null?"":model!.byline.toString()
          ,overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style:getRegularTextStyle(
              color: AppColors.greyColor,
              fontWeight: FontWeight.w600,
              fontSize: 12
          )
      ),
    );
  }
}
