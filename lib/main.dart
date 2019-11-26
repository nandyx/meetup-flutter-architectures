import 'package:flutter/material.dart';

// import 'first_version/home_page.dart' as firstVersion;
import 'vanilla/vanilla.dart' as vanilla;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final Widget _page = firstVersion.HomePage();
  final Widget _page = vanilla.HomePage(
    repository: vanilla.HomeRepository(),
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
