import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //criando um tempo para ficar na splash page (launch screen ) e apos 3 segundos enviando para pagina de login sem a opcao para o usario retornar, como se nao tivesse uma NavigationBar(swift)
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 253, 253, 159),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
