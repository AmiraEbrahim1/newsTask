import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/widgets/shimmer_widget.dart';
class NewsShimmerItem extends StatefulWidget {
  const NewsShimmerItem({super.key});

  @override
  State<NewsShimmerItem> createState() => _NewsImageShimmerItemState();
}

class _NewsImageShimmerItemState extends State<NewsShimmerItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: 16.w,right: 16.w,top: 20.h),
      child: CustomShimmer.fromCircular(
        radius:60.w ,
        baseColor: AppColors.primaryColor,
        highlightColor: AppColors.whiteColor,
      ),
    );
  }
}