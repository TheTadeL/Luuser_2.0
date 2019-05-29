import 'package:flutter/material.dart';
import 'package:luuser_fltr/widgets/meatball_menu.dart';

/// HOME ///
class AboutScreen extends StatelessWidget {
  AboutScreen({Key key}) : super(key: key);
  static const String _title = 'About';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          MeatBallMenu(context: context),
        ],
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ABOUT SCREEN'),
    );
  }
}
