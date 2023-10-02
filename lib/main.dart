import 'package:flutter/material.dart';
import 'package:news_app/data/network/dio_factory/dioFactory.dart';
import 'package:news_app/resources/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      onGenerateRoute: RoutesManager.getRoute,
    );
  }
}
