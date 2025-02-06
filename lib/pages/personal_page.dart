import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});


  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  final _controller = TextEditingController();
  
  @override
  void initState() {
    // check if the first time ever open the app
    if(!_myBox.containsKey("TODOLIST")){
      db.createInitialPersonalTasks();
      db.updatePersonalTasksDb();
    }else{
      // there ready exist data
      db.loadPersonalTasksData();
    }

    super.initState();
  }

  void checkBoxChanged(int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updatePersonalTasksDb();
  }

  void saveNewTask(){
    print(_controller.text);
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updatePersonalTasksDb();
  }

  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),  
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updatePersonalTasksDb();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: db.todoList[index][0], 
            taskCompleted: db.todoList[index][1], 
            onChanged:(value) => checkBoxChanged(index),
            deleteTask: (context) => deleteTask(index),
          );
        },
        
      ),
    );
  }
}