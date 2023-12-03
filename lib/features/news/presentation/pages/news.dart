import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/core/utils/app-color.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/size-utils.dart';
import 'package:news_app/features/news/presentation/manager/news_bloc.dart';
import 'package:news_app/features/news/presentation/pages/news_details.dart';
import 'package:news_app/features/news/presentation/widgets/news_image_shimmer.dart';
import 'package:news_app/features/news/presentation/widgets/news_shimmer_widget.dart';
import 'package:news_app/injection_container.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:buildAppBar,
        body: BlocProvider(
  create: (BuildContext context) {
    return getIt<NewsBloc>()..add(GetNewsEvent());
  },
  child: BlocBuilder<NewsBloc, NewsState>(
  builder: (context, state) {
    if (state is NewsErrorState) {
      /* dealing with error state*/
      return const Text("error message");
    } else if (state is NewsLoadedState && state.news.isEmpty) {
      /* dealing with empty state*/
      return buildDataEmpty;
    }
    return buildListArticles(state);
  },
),
),
      );
  }
  buildListArticles(NewsState state){
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder:(context,index){
          if(state is NewsLoadedState){
            return buildArticle(state,index) ;
          }
          else {
            return const ShimmerItem();
          }
        },
        itemCount:state is NewsLoadedState?state.news.length:10
    );
  }
  buildArticle(NewsLoadedState state,int index){
    return InkWell(
      onTap: (){
       // Routes.newsDetailsRoute.pushWithData({NewsDetails.modelKey:state.news[index]});
        Navigator.push(context, MaterialPageRoute(builder:(context)=>NewsDetails( model: state.news[index],)));
      },
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal:16.w),
        child: Stack(
          children: [
            buildListTile(state,index),
            buildCalender(state,index)
          ],
        ),
      ),
    );
  }
  buildCalender(NewsLoadedState state,int index){
    return Positioned(
      top: 115.h,
      left: 220.w,
      child: Wrap(
        children: [
          buildIconCalender,
          buildPublishedDate(state,index)
        ],
      ),
    );
  }
  buildListTile(NewsLoadedState state,int index){
    return SizedBox(
      width:width,
      height:135.h ,
      child: Row(
        children: [
          buildCircleImage(state,index),
          15.hs,
          buildListTileTitle(state.news[index].title!,state.news[index].byline!),
          const Spacer(),
          buildReverseIcon
        ],
      ),
    );
  }
  get buildReverseIcon=>const Icon(Icons.arrow_forward_ios_rounded);
  buildCircleImage(NewsLoadedState state,int index){
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image:NetworkImage(state.news[index].media![0].mediaMetadata![0].url!??''))
      ),
    );
  }
  get buildDataEmpty=>SizedBox(
    height: 158.h,
    width: width,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(" data is empty")
      ],
    ),
  );
  get buildAppBar=>AppBar(
    leading: const Icon(Icons.menu),
    actions:[
      Icon(Icons.search),
      8.hs,
      Icon(Icons.more_vert),
      8.hs,
    ],
    title:buildTitle,
    centerTitle: true,
  );
  get buildTitle=>Text("NY Times Most Popular",style:getRegularTextStyle(
      color: AppColors.whiteColor,
      fontSize: 17,
      fontWeight: FontWeight.w700
  ),);
  buildListTileTitle(String title,String subTitle){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTileTitle(title),
        10.vs,
        buidSubTitle(subTitle),
      ],
    );
  }
  get buildIconCalender=>const Icon(Icons.calendar_today_rounded,size:13 ,color: AppColors.greyColor,);
  buildPublishedDate(NewsLoadedState state,int index){
    return Text(state.news[index].publishedDate!,style:getRegularTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColors.greyColor),);
  }
  buildTileTitle(String title){
    return SizedBox(
      width:220,
      child: Text(title,style: getRegularTextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.blakColor,
          fontSize: 16,
          overflow: TextOverflow.ellipsis
      ),
        maxLines:2,
      ),
    );
  }
  buidSubTitle(String subTitle){
    return SizedBox(
      width:220,
      child: Text(subTitle,style: getRegularTextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          overflow: TextOverflow.ellipsis
          ,color: AppColors.greyColor
      ),maxLines: 2,),
    );
  }
}
