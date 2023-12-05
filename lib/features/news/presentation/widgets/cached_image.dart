import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
class CachedImage extends StatelessWidget {
  CachedImage({super.key,this.imageWidth,this.imageHeight});
  double? imageWidth;
  double? imageHeight;
  @override
  Widget build(BuildContext context) {
    return Image(image:
    const AssetImage("assets/images/profileImg.png",)
      , width:imageWidth, height:imageHeight,);
  }
}
