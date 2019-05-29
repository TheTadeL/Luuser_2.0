import 'package:flutter/material.dart';
import 'widgets/new_school_form.dart';

/// HOME ///
class NewSchoolScreen extends StatelessWidget {
  NewSchoolScreen({Key key}) : super(key: key);
  static const String _title = 'Neue Schule erfassen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NewSchoolForm(),
    );
  }
}

