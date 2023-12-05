import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.model});

  Results? model;

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          20.vs,
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                model!.media!.isEmpty ?
                SizedBox(
                  width:width*0.2,
                  child: Image(image:
                  const AssetImage("assets/images/profileImg.png",)
                    , width: 80.w, height: 80.h,),
                )
                    :
                model!.media![0].mediaMetadata!.isEmpty ?
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Image(image:
                  const AssetImage("assets/images/profileImg.png",)
                    , width: 80.w, height: 80.h,),
                )
                    :
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.2,
                  child: CircleAvatar(
                    foregroundColor: Colors.red,
                    backgroundImage:NetworkImage(
                      model!.media![0].mediaMetadata![0].url.toString(),) ,
                    radius: 30.0,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
                    child: Column(
                      children: [
                        15.vs,
                        Text(
                            model!.title == null?"":model!.title.toString()
                            ,overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:getBoldTextStyle(
                              fontSize: 14,
                            )
                        ),
                        15.vs,
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                              model!.byline == null?"":model!.byline.toString()
                              ,overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style:getRegularTextStyle(
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12
                              )
                          ),
                        ),
                        20.vs,
                      ],
                    ),
                  ),
                ),

                SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                    child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.black,size: 35,))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.calendar_today,color:AppColors.greyColor,size:15,),
              2.hs,
              Text(
                model!.publishedDate == null?"":model!.publishedDate.toString()
                ,overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style:const TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12
                ),
              ),
              60.hs,
            ],
          ),
          30.vs
        ],
      );
  }
}
