import 'package:flutter/material.dart';

class LoginController{
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);
  String? _login;
  setLogin(String login) => _login = login;

  String? _pass;
  setPass(String pass) => _pass = pass;

  Future<bool> auth() async{
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2)); //await para so prosseguir dps de fazer essa operacao
    inLoader.value = false;
    return _login == 'admin' && _pass == '123';
  }
}