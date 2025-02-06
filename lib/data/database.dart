import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList = [];
  final _mybox = Hive.box('mybox');
  
  // only run the first time openning this app
  void createInitialData(){
    todoList = [
      ["Make tut", false],
      ["Do exercise", false],
      ["Bake", false],
    ];
  }

  void loadData(){
    todoList = _mybox.get("TODOLIST");
  }

  void updateDb(){
    _mybox.put("TODOLIST", todoList);
  }
}
