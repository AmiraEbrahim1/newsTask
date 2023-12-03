import 'package:news_app/core/api/api_constants/api_endpoinst.dart';
abstract class ApiConsumer {
  Future getRequest({
    String baseUrl = EndPoints.baseUrl,
    required String path,
    Map<String, dynamic>? queryParams,
  });
}
