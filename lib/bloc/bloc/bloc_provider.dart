import 'package:flutter/widgets.dart';

import '../core/contracts/movie_bloc.dart';


/// This is an InheritedWidget that wraps around [MovieBloc]. Think about this
/// as Scoped Model for that specific class.
///
/// This merely solves the "passing reference down the tree" problem for us.
/// You can solve this in other ways, like through dependency injection.
class BlocProvider extends InheritedWidget {
  final IMovieBloc movieBloc;
  BlocProvider({Key key, IMovieBloc movieBloc, Widget child})
      : movieBloc = movieBloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static IMovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .movieBloc;
}
