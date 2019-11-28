import 'package:architectures/bloc/core/contracts/movie_bloc.dart';
import 'package:architectures/bloc/core/state/movie_state.dart';

import '../core/contracts.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../core/viewmodels.dart' show Movie;

class MovieBloc extends IMovieBloc {
  final IMovieProvider provider;
  final dataSubject = new BehaviorSubject<List<Movie>>();
  final loadSubject = new BehaviorSubject<bool>();

  MovieBloc({@required this.provider});

  set isLoading(bool value) => loadSubject.sink.add(value);
  set currentData(List<Movie> data) => dataSubject.sink.add(data);

  Stream<MovieState> get state => Observable.combineLatest2(
      dataSubject,
      loadSubject,
      (d, l) => MovieState(
            isLoading: l,
            movies: d,
          ));
  @override
  void load() {
    loadSubject.sink.add(true);
    provider.fetchMovies().then((movies) {
      dataSubject.sink.add(movies);
      loadSubject.sink.add(false);
    });
  }

  @override
  dispose() async {
    await dataSubject.drain();
    await loadSubject.drain();
    dataSubject?.close();
    loadSubject?.close();
  }
}
