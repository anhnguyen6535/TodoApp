import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase{
  List todoList = [];
  List choresList = [];
  final _mybox = Hive.box('mybox');

  // this function only runs the first time openning this app
  void createInitialData(){
    todoList = [
      ["Make tut", false],
      ["Do exercise", false],
      ["Bake", false],
    ];
    choresList = [
      ["Do laundry", false],
      ["Buy groceries", false],
    ];
  }
  
  void loadData(String listName){
    if(listName == "personal"){
      todoList = _mybox.get("TODOLIST");  
    }else if(listName == "chores"){
      choresList = _mybox.get("CHORESLIST");  
    }
  }

  void updateDb(String listName){
    if(listName == "personal"){
      _mybox.put("TODOLIST", todoList);  
    }else if(listName == "chores"){
      _mybox.put("CHORESLIST", choresList);  
    }
  }
}
