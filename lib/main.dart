import 'package:flutter/material.dart';

import 'scopedmodel/scope_model.dart' as scopeModel;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final Widget _page = scopeModel.HomePage(
    provider: scopeModel.MovieProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Flutter Architectures',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _page,
    );
  }
}
