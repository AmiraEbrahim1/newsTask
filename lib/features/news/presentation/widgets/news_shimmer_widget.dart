import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/widgets/shimmer_widget.dart';
class ShimmerItem extends StatefulWidget {
  const ShimmerItem({super.key});

  @override
  State<ShimmerItem> createState() => _NewsShimmerItemState();
}

class _NewsShimmerItemState extends State<ShimmerItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:(context,index)=> Padding(
        padding:EdgeInsets.only(left: 16.w,right: 16.w,top: 20.h),
        child: CustomShimmer.fromRectangle(
          height:82.h,
          width:105.w,
          borderRadius: BorderRadius.circular(15),
          baseColor: AppColors.primaryColor,
          highlightColor: AppColors.whiteColor,
        ),
      ),
    );
  }
}