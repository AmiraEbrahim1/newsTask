import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/news_response_model.dart';

import '../../../../core/errors/failures.dart';
abstract class NewsRepo{
  Future<Either<Failure,NewsResponseModel>> getNews();
}