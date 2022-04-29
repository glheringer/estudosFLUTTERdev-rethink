import 'package:aula_05/controllers/home_controller.dart';
import 'package:aula_05/models/post_model.dart';
import 'package:aula_05/repositories/home_repository_imp.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(HomeRepositoryImp());
  @override
  void initState() {
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      // backgroundColor: Color.fromARGB(255, 255, 255, 213),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _homeController.posts, //valor que vai observar igual o observe do switch,assim que tiver alguma alteracao é disparado e recriado  o objeto
        builder: ((_, list, __) { //recriando objeto, esse metodo tem tres parametros; Contexto, valor(nossa lista de postmodel) e um widget. o _ é para ignorar
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_,idx) => ListTile( //retorna um contexto e um inteiro que é o index de cada elemento da lista. 
              leading: Text(list[idx].id.toString()),
              title: Text(list[idx].title), // a partir disso eu pego o index do objeto da lista  e assim o title(atribudo do nosso PostModel), com o listTile exibindo isso na tela
              trailing: Icon(Icons.arrow_forward),

            ),
            separatorBuilder: (_,__) => Divider(),
            );
        }),
      )

    );
  }
}
