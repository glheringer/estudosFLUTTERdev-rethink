import 'package:aula_05/models/post_model.dart';
import 'package:aula_05/repositories/home_repository.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var dio = Dio();
    try{
      var response = await dio.get('https://jsonplaceholder.typicode.com/posts'); 
       return (response.data as List).map((e) => PostModel.fromJson(e)).toList(); //retornando o conteudo do json como uma lista do tipo postmodel 
    }catch(e){
      print(e);
    }
    return [] ;
  }
}
