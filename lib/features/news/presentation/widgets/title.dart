import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class ArticleTitle extends StatelessWidget {
  ArticleTitle({super.key,required this.model,this.titleFontSize});
  Results?model;
  double? titleFontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
        model!.title == null?"":model!.title.toString()
        ,overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style:getBoldTextStyle(
          fontSize:titleFontSize?? 14,
        )
      // const TextStyle(
      //   fontSize: 14,
      //     fontWeight: FontWeight.bold
      // ),
    );
  }
}
