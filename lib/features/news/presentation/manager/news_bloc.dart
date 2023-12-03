import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/errors/map_failure_to_massage.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
import 'package:news_app/core/utils/extensions.dart';
import '../../domain/use_cases/news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<Results> news = [];
  NewsUseCases newsUseCases;
  NewsBloc({required this.newsUseCases}) : super(NewsInitial()) {

    on<GetNewsEvent>(getNews);
  }
FutureOr<void> getNews(GetNewsEvent event,Emitter<NewsState> emit )async{
  Either<Failure, NewsResponseModel> either = await newsUseCases.getNews();
  either.fold((Failure failure) => emit(NewsErrorState()),
          (NewsResponseModel newsResponse) {
    print("news response ${newsResponse.status}");
        if (newsResponse.status=='OK') {
          news.addAll(newsResponse.results!);
          emit(NewsLoadedState(news: newsResponse.results!));

        } else {
          emit(NewsErrorState());
        }
      });
}
  bool get isListLoading =>  state is NewsLoadingState;
  bool get isListLoaded => state is NewsLoadedState && news.isNotEmpty;
  int get length {
    if (isListLoaded) {
      return news.length;
    }
    return 6;
  }
}
