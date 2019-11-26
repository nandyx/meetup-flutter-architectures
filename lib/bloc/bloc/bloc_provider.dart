import 'package:flutter/widgets.dart';

import 'movie_bloc.dart';

/// This is an InheritedWidget that wraps around [MovieBloc]. Think about this
/// as Scoped Model for that specific class.
///
/// This merely solves the "passing reference down the tree" problem for us.
/// You can solve this in other ways, like through dependency injection.
///
/// Also note that this does not call [MovieBloc.dispose]. If your app
/// ever doesn't need to access the cart, you should make sure it's
/// disposed of properly.
class BlocProvider extends InheritedWidget {
  final MovieBloc movieBloc;
  BlocProvider({Key key, MovieBloc movieBloc, Widget child})
      : movieBloc = movieBloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .movieBloc;
}
