import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../core/models.dart' show MovieModel;
import '../core/contracts.dart' show IMovieProvider;
import '../widgets/movie_item.dart';

class HomePage extends StatefulWidget {
  final IMovieProvider provider;
  HomePage({@required this.provider});
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieModel _model;
  @override
  void initState() {
    super.initState();
    _model = MovieModel(provider: widget.provider);
    _model.load();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: ScopedModelDescendant<MovieModel>(
          builder: (context, _, model) => _buildBody(model),
        ),
      ),
    );
  }

  Widget _buildBody(MovieModel model) => model.isLoading
      ? Center(child: CircularProgressIndicator())
      : ListView(
          children: model.allMovies.map((m) => MovieItem(movie: m)).toList(),
        );
}
