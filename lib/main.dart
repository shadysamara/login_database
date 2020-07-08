import 'package:flutter/material.dart';
import 'package:login_db_sqlite/ui/screens/students_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: StudentHome());
  }
}
