import 'package:flutter/material.dart';
import 'package:login_db_sqlite/models/student.dart';
import 'package:login_db_sqlite/repositories/db_helper.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('students home'),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          Student s = Student(name: 'farah', age: 6, male: false);
          DBhelper.dBhelper.insertNewStudent(s);
        }),
      ),
    );
  }
}
