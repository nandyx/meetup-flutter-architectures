

import 'package:flutter/foundation.dart';

import '../state/movie_state.dart';
import 'movie_provider.dart';

abstract class IMovieBloc{

  final IMovieProvider provider;
  Stream<MovieState> state;

  IMovieBloc({@required this.provider});

  load();
  dispose();
}