import 'package:login_db_sqlite/repositories/db_helper.dart';

class Student {
  String name;
  int age;
  bool male;
  Student({this.name, this.age, this.male});
  Student.fromJson(Map<String, dynamic> map) {}

  Map<String, dynamic> toJson() {
    return {
      DBhelper.studentNameColumn: this.name,
      DBhelper.studentAgeColumn: this.age,
      DBhelper.studentMaleColumn: this.male ? 1 : 0
    };
  }
}
