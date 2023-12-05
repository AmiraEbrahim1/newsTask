import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class PublishedDate extends StatelessWidget {
  PublishedDate({super.key,required this.model});
 Results? model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Icon(Icons.calendar_today,color:AppColors.greyColor,size:15,),
        2.hs,
        Text(
            model!.publishedDate == null?"":model!.publishedDate.toString()
            ,overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:getRegularTextStyle(
                color: AppColors.greyColor,
                fontSize: 12
            )
          // const TextStyle(
          //     color: AppColors.greyColor,
          //     fontSize: 12
          // ),
        ),
        60.hs,
      ],
    );
  }
}
