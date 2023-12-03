import 'failures.dart';

const String serverErrorMessage = 'Please try again later, Server Problem';
const String emptyCacheFailureMessage = 'No Data';
const String offlineFailureMessage = 'Please Check your Internet Connection';
const String unExpectedErrorMessage = 'Unexpected Error,Please try again later';
const String accessingCashFailure = 'Cant Write or From Local';

String mapFailureToMessage(Failure failure) {
  String message = '';
  switch (failure.runtimeType) {
    case ServerFailure:
      message = serverErrorMessage;
      break;
    case OfflineFailure:
      message = offlineFailureMessage;
      break;
    case CacheFailure:
      message = accessingCashFailure;
      break;
    default:
      message = unExpectedErrorMessage;
  }
  return message;
}
