import 'dart:convert';

import 'package:aula_06_movieapp/models/movies_model.dart';
import 'package:aula_06_movieapp/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<Movies> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
