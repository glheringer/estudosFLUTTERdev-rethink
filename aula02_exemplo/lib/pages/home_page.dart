import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int indexBottomNavigationBar = 0; // Variável Indice da nav bar de baixo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),

      drawer:  
        Drawer( //Cria um menu lateral
          child: ListView(
            children: [
              UserAccountsDrawerHeader  ( //Cabeçalho do Drawer
                accountName: Text('Ana Paula'), 
              accountEmail: Text('anapaulapires@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('A'),
                backgroundColor: Colors.yellow,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  _pageController.jumpToPage(0);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigationBar = 0;
                  });
                },
              ),
              ListTile(
              title: Text('Item 2'),
              trailing: Icon(Icons.arrow_forward),
               onTap: (){
                  _pageController.jumpToPage(1);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigationBar = 1;
                  });
                },
            ),
              ListTile(
              title: Text('Item 3'),
              trailing: Icon(Icons.arrow_forward),
               onTap: (){
                  _pageController.jumpToPage(2);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigationBar = 2;
                  });
                },
            ),
            ],
          ),
        ) ,

      body: PageView(
        controller: _pageController,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(   //Para estilizar esse body em especifico
                  color: Color.fromARGB(255, 241, 217, 100),
                  // shape: BoxShape.circle,
                ),
                child: Center(
                    child: Text(
                  'Olá Mundo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                )
                ),
              ),
              Row(
                children: [
                  Container(
                    color: Colors.orange,
                    height: 100,
                    width: 200,
                    child: Center(child: Text('Container 1')),
                  ),
                  Container(
                    color: Colors.redAccent,
                    height: 100,
                    width: 175,
                    child: Center(child: Text('Container 2')),
                  ), 
                ],
              )
            ],
          ),
          Container(color: Colors.teal,),
          Container(color: Colors.indigo,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar,
          //onTap funciona com uma funçao que retorna um inteiro , que corresponde ao numero do bar item selecionado, em ordem crescente
          onTap: (int page) {
            
            setState(() {
             indexBottomNavigationBar = page;
            });

              _pageController.animateToPage( //Criando uma funcao para transicao de paginas
                 page, //passa o retorno como parametro
                 duration: Duration(milliseconds: 300), // pa rametro duracao
                 curve: Curves.ease); //parametro tipo de transicao
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_rounded), label: 'Item 1'),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc_sharp), label: 'Item 2'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm_sharp), label: 'Item 3'),
          ]
          ),
    );
  }
}
