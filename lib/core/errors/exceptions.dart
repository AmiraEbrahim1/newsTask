import 'package:news_app/core/utils/app_string.dart';

class ServerException implements Exception {
  final String? message;
  const ServerException({this.message});

}

class NoInternetConnectionException implements Exception {
  @override
  String toString() {
    // TODO: implement toString
    return AppString.errorInternetNotAvailable;
  }
}

class FetchDataException extends ServerException {
  FetchDataException() : super(message: "Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException() : super(message: "Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException() : super(message: "Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException() : super(message: "Request Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException() : super(message: "Conflict Occurred");
}

class InternalServerException extends ServerException {
  const InternalServerException() : super(message: "Internal Server Error");
}

class CacheException implements Exception {}