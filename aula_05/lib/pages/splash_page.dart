import 'package:aula_05/services/prefs_service.dart';
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

    /* Tudo isso é para fazer o AUTOLOGIN se o usuario ja foi autenticado */
    Future.wait([PrefsService.isAuth(),  //Verificando se o metodo isAuth foi executado com sucesso, se foi executa o then
     Future.delayed(Duration(seconds: 3)) //delay
    ])

    .then((value) => value[0] 
    ? Navigator.of(context).pushReplacementNamed('/home') //se deu certo vai para pagina de login
    : Navigator.of(context).pushReplacementNamed('/login') //senao volta para o login
     );//indice 0 na lista de value corresponde ao PrefsService
    /* Fim Autologin */
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 253, 253, 159),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
