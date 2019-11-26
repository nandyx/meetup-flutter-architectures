import 'package:flutter/material.dart';

import '../bloc/bloc_provider.dart';
import '../widgets/movie_item.dart';
import '../core/state/movie_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    bloc.load();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: StreamBuilder<MovieState>(
          stream: bloc.state,
          initialData: MovieState.initState(),
          builder: (context, snapshot) {
            return _buildBody(snapshot.data);
          }),
    );
  }

  Widget _buildBody(MovieState state) => state.isLoading
      ? Center(child: CircularProgressIndicator())
      : ListView(
          children: state.movies.map((m) => MovieItem(movie: m)).toList(),
        );
}
