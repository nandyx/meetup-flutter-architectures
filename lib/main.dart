import 'package:architectures/bloc/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc/bloc_provider.dart';
import 'bloc/bloc.dart' as bloc;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget _page = bloc.HomePage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      movieBloc: MovieBloc( provider: bloc.MovieProvider()),
      child: MaterialApp(
        title: 'Flutter Architectures',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _page,
      ),
    );
  }
}
