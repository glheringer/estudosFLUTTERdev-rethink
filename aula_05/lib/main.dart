import 'package:aula_05/pages/details_page.dart';
import 'package:aula_05/pages/home_page.dart';
import 'package:aula_05/pages/login_page.dart';
import 'package:aula_05/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,

          ),
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => const SplashPage(),
          '/login': (_) => LoginPage(),
          '/home': (_) => const HomePage(),
          '/details': (_) => DetailsPage(),
        });
  }
}
