import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/core/errors/exceptions.dart';
import '../abstract/api_consumer.dart';
import '../api_constants/api_endpoinst.dart';
import '../api_constants/status_codes.dart';
import '../helpers/network_utils.dart';
import 'dio_interceptors.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;
  final DioInterceptor dioInterceptor;
  final LogInterceptor logInterceptor;
  static Dio? stClient;
  DioConsumer({
    required this.client,
    required this.dioInterceptor,
    required this.logInterceptor,
  });

  void dioInit() {
    /* (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
 */

    client.options
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..receiveDataWhenStatusError = true
      ..connectTimeout = const Duration(seconds: 1000)
      ..receiveTimeout = const Duration(seconds: 60)
      ..receiveDataWhenStatusError = true
      ..baseUrl = EndPoints.baseUrl
      ..validateStatus = (status) => status! < StatusCode.internalServerError;
    client.interceptors.add(dioInterceptor);
    // we use login interceptor in debug model only
    if (kDebugMode) {
      client.interceptors.add(logInterceptor);
    }
    stClient = client;
    debugPrint("initialize");
    //  Workmanager().initialize(callbackDispatcher,isInDebugMode: true);
  }

  @override
  Future getRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? queryParams,
  }) async {
    if (await isNetworkAvailable()) {
      try {
        client.options.baseUrl = baseUrl;
        final Response<dynamic> response = await client.get(path, queryParameters: queryParams);
        debugPrint(response.realUri.toString());
        //   debugPrint(response.data.json);
        debugPrint(" status code is ${response.statusCode}");
        return handleResponse(response);
      } on DioException catch (error) {
        buildHandleDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
  dynamic buildHandleDioError({required DioException error}) {
    debugPrint(error.error.toString());
    switch (error.type) {
      case DioExceptionType.connectionError:
        throw FetchDataException();
      case DioExceptionType.connectionTimeout:
        throw FetchDataException();
      case DioExceptionType.sendTimeout:
        throw FetchDataException();
      case DioExceptionType.receiveTimeout:
        throw FetchDataException();
      //  case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerException();
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException();
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
    }
  }

  Future handleResponse(Response response) async {
    switch (response.statusCode) {
      case StatusCode.badRequest:
        throw const BadRequestException();
      case StatusCode.unauthorized:
      case StatusCode.forbidden:
        throw const UnauthorizedException();
      case StatusCode.notFound:
        throw const NotFoundException();
      case StatusCode.conflict:
        throw const ConflictException();
      case StatusCode.internalServerError:
        throw const InternalServerException();
      case StatusCode.ok:
        return jsonDecode(response.data.toString());
    }
  }

  @override
  Future deleteRequest(
      {String baseUrl = EndPoints.baseUrl,
      required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams}) async {
    if (await isNetworkAvailable()) {
      try {
        final Response<dynamic> response = await client.delete(
          path,
          queryParameters: queryParams,
          data: body,
        );
        return handleResponse(response);
      } on DioException catch (error) {
        buildHandleDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }

  static const String downloadTaskName = "download file";
  static Function(int, int)? onRecvProgess;
  @override
  Future<void> downloadFile({
    required String url,
    required String fileName,
    required String savePath,
    Function(int, int)? onReceiveProgress,
  }) async {
    if (await isNetworkAvailable()) {
      client
          .download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
        deleteOnError: true,
      )
          .then((Response value) {
        //  handleResponse(value);
      }, onError: ((error) {
        debugPrint("$error");
      }));
    } else {
      throw NoInternetConnectionException();
    }
  }
}
