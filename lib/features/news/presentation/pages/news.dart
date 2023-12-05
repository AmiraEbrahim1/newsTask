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

import '../widgets/news_card.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: buildAppBar,
      body:
      BlocProvider(
        create: (BuildContext context) {
          return getIt<NewsBloc>()..add(GetNewsEvent());
        },
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsErrorState) {
              return const Text("error");
            }
            else if (state is NewsLoadedState
                && state.news.isEmpty
            ) {
              return buildDataEmpty;
          }else if(state is NewsLoadedState) {
              return SafeArea(
                child: ListView(
                    children: state.news.isEmpty ? [] :
                    state.news.map((e) {
                      return InkWell(
                        onTap: (){
                          Routes.newsDetailsRoute
                              .pushWithData({NewsDetails.modelKey:e});
                        },
                        child:e.media!.isEmpty?const Text(''): NewsCard(model: e,)
                      );
                    }).toList()
                ),
              )
              ;
            }
            else{
              return
                const ShimmerItem();
            }
          },
        ),
      ),
    );
  }
  get buildDataEmpty => SizedBox(
        height: 158.h,
        width: width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" data is empty")],
        ),
      );
  get buildAppBar => AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          8.hs,
          Icon(Icons.more_vert),
          8.hs,
        ],
        title: buildTitle,
        centerTitle: true,
      );
  get buildTitle => Text(
        "NY Times Most Popular",
        style: getRegularTextStyle(
            color: AppColors.whiteColor,
            fontSize: 17,
            fontWeight: FontWeight.w700),
      );
}
