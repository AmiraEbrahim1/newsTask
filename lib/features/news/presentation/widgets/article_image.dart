import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class ArticlImage extends StatelessWidget {
  ArticlImage({super.key,required this.model});
  Results?model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 240.h,
      decoration: BoxDecoration(
          borderRadius:7.0.borderRadius,
          image: DecorationImage(image: NetworkImage(model!.media![0].mediaMetadata![2].url!),fit: BoxFit.cover)
      ),
    );
  }
}
