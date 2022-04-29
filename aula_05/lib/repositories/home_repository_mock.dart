import 'dart:convert';

import 'package:aula_05/models/post_model.dart';
import 'package:aula_05/repositories/home_repository.dart';
import 'package:flutter/services.dart';

class HomeRepositoryMock implements HomeRepository{
  
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');//rootBundle identifica tudo que tem dentro do assets/data e conseguiremos trabalhar com ele
    List postJson = jsonDecode(value); //Decodifica em transformando em uma lista de post model
    return postJson.map((e) => PostModel.fromJson(e)).toList(); //'e' é cada objeto daquele json . Retorna uma lista de posmodel
  }
}