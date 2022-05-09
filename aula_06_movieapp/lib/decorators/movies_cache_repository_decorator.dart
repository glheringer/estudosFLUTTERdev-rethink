import 'dart:convert';

import 'package:aula_06_movieapp/decorators/movies_repository_decorator.dart';
import 'package:aula_06_movieapp/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies_model.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();

    String jsonMovies = jsonEncode(movies
        .toJson()); //Encode recebe um json (que é um map), o metodo transforma esse objeto json em String

    prefs.setString('movies_cache', jsonMovies);
    print('salvou no cache os filmes ' + movies.toString());
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(
        moviesJsonString); //json é um mapa, o encode transforma a string em um mapa, fazendo processo inverso ao anterior
    var movies = Movies.fromJson(json); //recebe um json
    print('recuperou do cache os filmes ' + movies.toString());
    return movies;
  }
}
