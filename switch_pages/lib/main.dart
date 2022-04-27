import 'package:flutter/material.dart';
import 'package:switch_pages/one_page.dart';
import 'package:switch_pages/two_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        ),
      initialRoute: '/',
      routes: {
        '/': (_) => const OnePage(),
        '/twoPage': (_) => const TwoPage(),
      },
    );
  }
}