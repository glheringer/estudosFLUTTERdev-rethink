import 'package:flutter/material.dart';
import 'package:switch_pages/two_page.dart';

class OnePage extends StatelessWidget {
  const OnePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            //Navigator of trabalha com gerenciamento de paginas em forma de Pilha
            Navigator.of(context).pushNamed('/twoPage', arguments: '123').then((value) => null); //Then(apos em ingles ) é o retorno apos processamento
          },
          child: Text('Ir para Segunda Pagina'),
        ),
        ),
    );
  }
}