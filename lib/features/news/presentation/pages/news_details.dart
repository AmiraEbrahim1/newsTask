import 'package:flutter/material.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class NewsDetails extends StatelessWidget {
   NewsDetails({super.key,required this.model});
   static const String modelKey="model";

   Results? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.0.w),
          child:buildArticle,
        ),
      ),
    );
  }
  get buildArticle=>Column(
    children: [
      buildArticleTitle,
      10.vs,
      buildArticleSubTitle,
      10.vs,
      buildByWhoAndDate,
      10.vs,
      buildArticleImage,
      buildSource,
      15.vs,
      buildArticleContent
    ],
  );
  get buildArticleContent=>Container(
    child:Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.') ,
  );
  get buildSource=>Text("Source ${model!.source!} ",style:getRegularTextStyle(fontSize:10),);
  get buildArticleImage=>Container(
    width: 330.w,
    height: 240.h,
    decoration: BoxDecoration(
        borderRadius:7.0.borderRadius,
        image: DecorationImage(image: NetworkImage(model!.media![0].mediaMetadata![2].url!),fit: BoxFit.cover)
    ),
  );
  get buildByWho=>Text(model!.byline!,
    style: getRegularTextStyle(fontSize: 12,fontWeight: FontWeight.w500),);
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
  get buildArticleTitle=>SizedBox(
      child: Text(model!.title!,style:getBoldTextStyle(fontSize: 20),));
  get buildArticleSubTitle=>Container(
    width:width,
    height: 80.h,
    child: Text(
      model!.abstract!,style: getRegularTextStyle(
        fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.greyColor),),
  );
  get buildDate=>Text(model!.publishedDate!,style: getRegularTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500
  ));
  get buildByWhoAndDate=>Row(
    children: [
      buildByWho,
      const Spacer(),
      buildDate
    ],
  );
}
