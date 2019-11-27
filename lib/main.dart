import 'package:architectures/bloc/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';

// import 'first_version/home_page.dart' as firstVersion;
// import 'vanilla/vanilla.dart' as vanilla;
// import 'scopemodel/scope_model.dart' as scopeModel;
import 'bloc/bloc/bloc_provider.dart';
import 'bloc/bloc.dart' as bloc;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final Widget _page = firstVersion.HomePage();
  // final Widget _page = vanilla.HomePage(
  //   repository: vanilla.HomeRepository(),
  // );
  // final Widget _page = scopeModel.HomePage(
  //   provider: scopeModel.MovieProvider(),
  // );
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
