import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class WhoAndWhen extends StatelessWidget {
   WhoAndWhen({super.key,required this.model});
   Results? model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Text(model!.byline!,
      style: getRegularTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
        const Spacer(),
        Text(model!.publishedDate!,style: getRegularTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500
    ))
      ],
    ); ;
  }
}
