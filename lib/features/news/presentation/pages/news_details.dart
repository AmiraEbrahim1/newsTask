import 'package:flutter/material.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
import 'package:news_app/features/news/presentation/widgets/article_widget.dart';
import 'package:news_app/features/news/presentation/widgets/title.dart';
class NewsDetails extends StatelessWidget {
   NewsDetails({super.key});
   static const String modelKey="model";

   Results? model;
  @override
  Widget build(BuildContext context) {
    model = (ModalRoute.of(context)!.settings.arguments as Map) ['model'] as Results;
    return Scaffold(
      appBar:buildAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.0.w),
          child:ArticleContent(model:model),
        ),
      ),
    );
  }
  get buildTitle=>Text("NY Times Most Popular",style:getRegularTextStyle(
      color: AppColors.whiteColor,
      fontSize: 17,
      fontWeight: FontWeight.w700
  ),);
  get buildAppBar=>AppBar(
    leading:IconButton(icon:Icon(Icons.arrow_back), onPressed: () {Routes.newsRoute.getBack; },),
    title:buildTitle,
    centerTitle: true,
  );

}
