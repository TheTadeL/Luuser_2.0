import 'package:flutter/material.dart';
import 'package:luuser_fltr/screens/home/index.dart';
import 'package:luuser_fltr/screens/about/index.dart';
import 'package:luuser_fltr/screens/new_school/index.dart';

final routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => HomeScreen(),
  '/about': (BuildContext context) => AboutScreen(),
  '/new_school': (BuildContext context) => NewSchoolScreen(),
};
