import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  //refrence hive box
  final _box = Hive.box("todoBox");
  List todoList = [];

  // run this method if this is the first ever time to run this application
  void createInitialData() {
    todoList = [
      ['read a novel', false],
      ['buy a cup of coffe', false],
    ];
  }

  // load data from local database
  void loadData() {
    todoList = _box.get('TODOLIST');
  }

  // updata local database
  void updateDatabase() {
    _box.put('TODOLIST', todoList);
  }
}
