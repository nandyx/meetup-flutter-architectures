
import '../viewmodels.dart';

abstract class IMovieProvider{
  Future<List<Movie>> fetchMovies();
}