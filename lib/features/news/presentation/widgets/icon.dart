import 'package:flutter/material.dart';
import 'package:news_app/core/utils/size-utils.dart';
class ReverseIcon extends StatelessWidget {
  const ReverseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width:width*0.1,
        child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.black,size: 35,));
  }
}
