import 'package:flutter/material.dart';

import 'core/contract/repository.dart';
import 'core/model/movie.dart';

class HomePage extends StatefulWidget {

  final Repository repository;
  HomePage({@required this.repository});
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> _allMovies;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _moviesAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: _allMovies.map(_buildItem).toList(),
            ),
    );
  }

  Widget _buildItem(Movie movie) {
    return Padding(
      key: Key(movie.id.toString()),
      padding: EdgeInsets.all(15.0),
      child: ExpansionTile(
        title: Text(movie.title, style: TextStyle(fontSize: 24.0)),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${movie.releaseDate} | ${movie.voteAverage}'),
              SizedBox(
                height: 10.0,
              ),
              Text(movie.overview),
            ],
          )
        ],
      ),
    );
  }

  _moviesAsync() async {
    setState(() => _isLoading = true);
    final movies = await widget.repository.fetchMovies();
    setState(() {
      _allMovies = movies;
      _isLoading = false;
    });
  }
}
