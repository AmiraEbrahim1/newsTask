import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/utils/app_helper.dart';
import 'package:news_app/features/news/data/data_sources/news_remote_datasources.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repo.dart';
class NewsRepoImpl extends NewsRepo {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepoImpl({required this.newsRemoteDataSource});
  @override
  Future<Either<Failure, NewsResponseModel>> getNews() =>
      execute<NewsResponseModel>(() => newsRemoteDataSource.getNews());
}