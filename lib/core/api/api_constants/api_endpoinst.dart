import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  EndPoints._();
  static const String baseUrl = 'https://api.nytimes.com/svc';
  static const String news = '/mostpopular/v2/viewed/7.json?api-key=';

}
