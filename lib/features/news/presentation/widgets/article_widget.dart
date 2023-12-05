import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
import 'package:news_app/features/news/presentation/widgets/abstract.dart';
import 'package:news_app/features/news/presentation/widgets/article_image.dart';
import 'package:news_app/features/news/presentation/widgets/cached_image.dart';
import 'package:news_app/features/news/presentation/widgets/title.dart';
import 'package:news_app/features/news/presentation/widgets/who_and_when.dart';
class ArticleContent extends StatelessWidget {
  ArticleContent({super.key,required this.model});
 Results? model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.vs,
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: ArticleTitle(model: model,titleFontSize: 20.0)),
        10.vs,
        AbstractText(model:model),
        10.vs,
        WhoAndWhen(model: model),
        10.vs,
        model!.media!.isEmpty ?
         CachedImage(imageHeight: 80.h,imageWidth: 80.w,)
            :
        model!.media![0].mediaMetadata!.isEmpty ?
         CachedImage(imageHeight: 80.h,imageWidth: 80.w,)
            :
        ArticlImage(model:model),

        Text("Source ${model!.source!} ",style:getRegularTextStyle(fontSize:10),),
        15.vs,
        const Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
      ],
    );;
  }
}
