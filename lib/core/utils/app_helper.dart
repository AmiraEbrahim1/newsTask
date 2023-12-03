import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/core/errors/failures.dart';

hideKeyboard() => FocusManager.instance.primaryFocus!.unfocus();
Logger logger=Logger();

Future<Either<Failure, T>> execute<T>(Function() function) async {
  try {
    T value = await function.call();
    return Right(value);
  } on ServerException {
    return Left(ServerFailure());
  } on NoInternetConnectionException {
    return Left(OfflineFailure());
  }
}




