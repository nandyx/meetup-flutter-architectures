import 'package:flutter/material.dart';

import 'first_version/home_page.dart' as firstVersion;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget _page = firstVersion.HomePage();

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
