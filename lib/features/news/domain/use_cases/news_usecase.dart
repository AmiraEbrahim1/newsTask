import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repo.dart';

class NewsUseCases{
  final NewsRepo  newsRepo;
  NewsUseCases({required this.newsRepo});
  Future<Either<Failure,NewsResponseModel>> getNews()=>newsRepo.getNews();
}