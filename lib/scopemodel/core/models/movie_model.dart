import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../contracts.dart' show IMovieProvider;
import '../viewmodels.dart' show Movie;

class MovieModel extends Model {
  final IMovieProvider provider;
  MovieModel({@required this.provider});

  bool _isLoading = false;
  List<Movie> _allMovies;

  bool get isLoading => _isLoading;
  List<Movie> get allMovies => _allMovies;

  void load() {
    _isLoading = true;
    notifyListeners();
    provider.fetchMovies().then((movies) {
      _allMovies = movies;
      _isLoading = false;
      notifyListeners();
    });
  }

  static MovieModel of(BuildContext context) =>
      ScopedModel.of<MovieModel>(context);
}
