

import '../model/movie.dart';

abstract class Repository{
  Future<List<Movie>> fetchMovies();
}