
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/viewmodels.dart' show Movie;
import '../core/contracts.dart' show IMovieProvider;

class MovieProvider implements IMovieProvider{

  Future<List<Movie>> fetchMovies() async {
    List<Movie> allMovies = List<Movie>();
    final url = Uri.https('api.themoviedb.org', '3/movie/now_playing', {
      'api_key': '024a684949be5b1cf8d3630dfdf4757a',
      'language': 'es-MX',
      'page': '1'
    });
    final response = await http.get(url);
    final decodeJson = json.decode(response.body);
    if (response.statusCode != 200) return [];
    for (var item in decodeJson['results'].toList().take(10)) {
      allMovies.add(Movie.fromJson(item));
    }
    return allMovies;
  }
}