
import 'package:desafio_todo_list/todo_list_page.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

//Toda configuracao do material app
class MyApp extends StatelessWidget {
    const MyApp({ Key? key }) : super(key: key);
  
 @override
  Widget build(BuildContext context) {
   
    return MaterialApp( //usar ele para retornar minha pagina
      debugShowCheckedModeBanner: false, //excluir selo de debugado
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)),
      home: TodoListPage(),
    );
    
    }
  }