//criar um contrato (classe abstrata), todos sao obrigados a implementar os metodos dela
import 'package:aula_05/models/post_model.dart';

abstract class HomeRepository{
  Future<List <PostModel>> getList(); //criando uma lista de Postmodel
}