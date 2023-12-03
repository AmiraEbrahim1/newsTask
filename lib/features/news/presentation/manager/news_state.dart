part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoadingState {}

class NewsLoadedState extends NewsInitial {
  final List<Results> news;
  NewsLoadedState({required this.news});
}

class NewsErrorState extends NewsInitial {
}