
import 'package:flutter/material.dart';
import '../../controllers/login_controller.dart';

class CustomLoginComponent extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginComponent({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  // .then para pegar o valor de retorno
                  if (result == true) {
                    Navigator.of(context).pushReplacementNamed('/home');
                    //quando aunteticado, enviar para tela de inicial
                  } else {
                    //Exibindo Snack Bar
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Falha ao efetuar login.'),
                      duration: const Duration(seconds: 5),
                    ));
                  }
                });
              },
              child: Text('Login'),
            ),
    );
  }
}