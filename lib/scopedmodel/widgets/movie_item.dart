import 'package:flutter/material.dart';

import '../core/viewmodels.dart' show Movie;

class MovieItem extends StatelessWidget {
  final Movie movie;
  MovieItem({this.movie});
  
  @override
  Widget build(BuildContext context) {
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
}
