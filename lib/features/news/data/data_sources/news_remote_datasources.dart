import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/api/api_constants/api_endpoinst.dart';
import 'package:news_app/core/api/dio/dio-consumer.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';
abstract class NewsRemoteDataSource {
  Future<NewsResponseModel> getNews();
}

class NewsRemoteDataSourceImplWithDio extends NewsRemoteDataSource {
  DioConsumer client;
  NewsRemoteDataSourceImplWithDio({required this.client});
  @override
  Future<NewsResponseModel> getNews() async {
    /* dio is responsible for throwing exceptions and also converting json string to json*/
    var response = await client.getRequest(path: EndPoints.news+'${dotenv.env['APIKEY']}');
    print('JEMI => ${response}');
    print(NewsResponseModel.fromJson(response).results![0].title);
    return NewsResponseModel.fromJson(response);
  }
}