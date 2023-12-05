import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class CircleImage extends StatelessWidget {
  CircleImage({super.key,required this.model});
  Results?model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.2,
      child: CircleAvatar(
        foregroundColor: Colors.red,
        backgroundImage:NetworkImage(
          model!.media![0].mediaMetadata![0].url.toString(),) ,
        radius: 30.0,
      ),
    );
  }
}
