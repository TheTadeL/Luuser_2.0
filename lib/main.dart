import 'package:flutter/material.dart';
import 'screens/home/index.dart';
import 'routes.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Luuser 2.0",
      routes: routes,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
