import 'package:aula02_exemplo/pages/home_page.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

//Toda configuracao do material app
class MyApp extends StatelessWidget {
    const MyApp({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        ),
        home: HomePage(), // chama a home page criada externamente
        ); 
    }
  }