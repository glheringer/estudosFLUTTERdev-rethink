import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Olá Mundo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() { //clousure?
    
      _counter++;
    });
  }
   void _decrementCounter() {
    setState(() { //clousure?
    
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) { //Aqui onde definitivamente montamos nosso projeto
   
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title), //Para acessar a classe Statefull se chama a partir do widget.
      ),
      body: Center(
     
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end, //Alinhamento Vertical em coluna
      crossAxisAlignment: CrossAxisAlignment.end, //Alinhamento Horizontal em coluna

        children: [
         FloatingActionButton( //Botao 1
           onPressed: _incrementCounter,//quando clicado 
           tooltip: 'Increment', //texto que aperece quando se poe o mouse encima do botao
           child: const Icon(Icons.add), //icone
           backgroundColor: Color.fromARGB(255, 233, 73, 126),
         ),

         FloatingActionButton(//Botao 2
           onPressed: _decrementCounter,//quando clicado 
           tooltip: 'Increment', //texto que aperece quando se poe o mouse encima do botao
           child: const Icon(Icons.remove), //icone
           backgroundColor: Color.fromARGB(255, 207, 128, 161),
         ),
        ],
       )
    );
  }
} 
