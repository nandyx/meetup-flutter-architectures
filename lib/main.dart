import 'package:architectures/vanilla/home_repository.dart';
import 'package:flutter/material.dart';

import 'vanilla/home_page.dart' as vanilla;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _page = vanilla.HomePage(
    repository: HomeRepository(),
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
