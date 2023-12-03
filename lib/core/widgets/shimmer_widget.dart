import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:shimmer/shimmer.dart';
class CustomShimmer extends StatelessWidget {
  double? height;
  double? width;
  BoxShape? boxShape;
  double? radius;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  List<BoxShadow>? boxShadow;
  Color? baseColor;
  Color? highlightColor;
  CustomShimmer({
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.baseColor,
    this.highlightColor,
    this.margin,
    this.boxShadow,
    this.boxShape = BoxShape.rectangle,
    Key? key,
  }) : super(key: key);
  CustomShimmer.fromRectangle({
    super.key,
    this.height=12,
    this.width=20,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  }) : boxShape = BoxShape.rectangle;

  CustomShimmer.fromCircular({
    super.key,
    this.radius,
    this.baseColor,
    this.highlightColor,
  }) : boxShape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey,
      highlightColor: highlightColor ?? AppColors.outlinedColor,
      //direction: context.read<LanguageCubit>().isEn ? ShimmerDirection.ltr : ShimmerDirection.rtl,
      child: boxShape == BoxShape.rectangle
          ? Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        clipBehavior: Clip
            .antiAliasWithSaveLayer, // is used to clip the internal child widget of container when u define border radius,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: AppColors.primaryColor.withOpacity(0.6),
          boxShadow: boxShadow,
        ),
      )
          : CircleAvatar(
        backgroundColor: AppColors.primaryColor.withOpacity(0.4),
        radius: radius,
      ),
    );
  }
}
