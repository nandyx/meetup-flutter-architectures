import '../viewmodels/movie.dart';

class MovieState {
  bool isLoading;
  List<Movie> movies;

  MovieState({
    this.isLoading,
    this.movies,
  });
  MovieState.initState() {
    isLoading = true;
    movies = [];
  }
}
