import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie.dart';

class HomePage extends StatefulWidget {
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
    final movies = await _fetchMovies();
    setState(() {
      _allMovies = movies;
      _isLoading = false;
    });
  }

  Future<List<Movie>> _fetchMovies() async {
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
