import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService{
  
  static final String _key = 'key';


  static save(String user) async {
    var prefs = await SharedPreferences.getInstance(); //Se alguma classe tem esse metodo getInstance significa que essa classe e um Singleton, o que quer dizer que essa classe so vai ter uma instancia, em qualquer lugar sera a mesma instancia
    prefs.setString( //Converte o objeto para um json string
      _key,
       jsonEncode({ //salvando usuario no json
        "user": user,
        "isAuth":true,
      })
    );
  }
  static Future isAuth() async{
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }
    return false;
  }
  
  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}