import 'package:flutter/material.dart';

import 'vanilla/vanilla.dart' as vanilla;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget _page = vanilla.HomePage(
    repository: vanilla.MovieRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architectures',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _page,
    );
  }
}
