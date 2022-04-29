import 'package:aula_05/components/login/custom_login_component.dart';
import 'package:aula_05/controllers/login_controller.dart';
import 'package:aula_05/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people,
                  size: MediaQuery.of(context).size.height *
                      0.3 //Configurando o Icone para ocupar 30% da altura da tela
                  ),
              CustomTextField(
                  onChanged: _loginController.setLogin,
                  label: 'Login'
              ),
              CustomTextField(
                  onChanged: _loginController.setPass,
                  label: 'Senha',
                  obscureText: true, //Ocultar senha
              ),
              SizedBox(height: 15),
              CustomLoginComponent(loginController: _loginController),
            ]),
      ),
    );
  }
}
