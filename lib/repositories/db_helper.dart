import 'dart:io';

import 'package:login_db_sqlite/models/student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBhelper {
  DBhelper._();
  static DBhelper dBhelper = DBhelper._();
  static final String dbName = 'students.db';
  static final String studentTableName = 'students';
  static final String studentIdColumn = 'id';
  static final String studentNameColumn = 'name';
  static final String studentAgeColumn = 'age';
  static final String studentMaleColumn = 'Male';

  Database database;
  Future<Database> initDb() async {
    if (database != null) {
      return database;
    } else {
      database = await connectToDb();
      return database;
    }
  }

  Future<Database> connectToDb() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    String db_path = join(path, dbName);
    Database db = await openDatabase(
      db_path,
      version: 2,
      onCreate: (db, version) {
        db.execute('''
        create table $studentTableName(
          $studentIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $studentNameColumn TEXT NOT NULL,
          $studentAgeColumn INTEGER NOT NULL,
          $studentMaleColumn INTEGER NOT NULL
        )
        ''');
      },
    );
    return db;
  }

  insertNewStudent(Student student) async {
    database = await initDb();
    int rowIndex = await database.insert(studentTableName, student.toJson());
    print(rowIndex);
  }
}
