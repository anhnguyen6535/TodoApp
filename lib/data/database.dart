import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList = [];
  final _mybox = Hive.box('mybox');
  
  // only run the first time openning this app
  void createInitialPersonalTasks(){
    todoList = [
      ["Make tut", false],
      ["Do exercise", false],
      ["Bake", false],
    ];
  }

  void loadPersonalTasksData(){
    todoList = _mybox.get("TODOLIST");
  }

  void updatePersonalTasksDb(){
    _mybox.put("TODOLIST", todoList);
  }
}
