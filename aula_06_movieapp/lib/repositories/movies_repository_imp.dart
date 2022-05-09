
import 'package:aula_06_movieapp/models/movies_model.dart';
import 'package:aula_06_movieapp/repositories/movies_repository.dart';
import 'package:aula_06_movieapp/utils/apis.utils.dart';
import '../service/dio_service.dart';

class MoviesRepostoryImp implements MoviesRepository{
  final DioService _dioService;

  MoviesRepostoryImp(this._dioService);

  @override
  Future<Movies> getMovies()  async {
    await Future.delayed(Duration(seconds: 3));
    var result =  await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }

}   