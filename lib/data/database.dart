import 'package:hive_flutter/hive_flutter.dart';

class AppDatabase{
  List todoList = [];
  List choresList = [];
  final _mybox = Hive.box('mybox');
  
  List loadData(String listName, List initialData){
    // first time opening app
    if(!_mybox.containsKey(listName)){
      updateDb(listName, initialData);
      return List.from(initialData);
    }
    else{ 
      return List.from(_mybox.get(listName)); 
    }
  }

  void updateDb(String listName, List taskList){
    _mybox.put(listName, taskList);  
  }
}
