import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/config/routes/app_routes.dart';
import 'package:news_app/config/themes/theme.dart';
import 'package:news_app/core/utils/app_string.dart';
import 'package:news_app/features/news/presentation/pages/news.dart';
import 'package:news_app/services/app.service.dart';
import 'injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: getAppTheme(context),
      navigatorKey: AppService().navigatorKey,
      onGenerateRoute:RouteGenerator.getRoute,
      home: News(),
      debugShowCheckedModeBanner: false,
    );
  }
}

