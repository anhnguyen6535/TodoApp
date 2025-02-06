import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';

class GenericTaskPage extends StatefulWidget {
  final String listName;
  final List initialData;

  const GenericTaskPage({
    super.key,
    required this.listName,
    required this.initialData,
  });


  @override
  State<GenericTaskPage> createState() => _GenericTaskPageState();
}

class _GenericTaskPageState extends State<GenericTaskPage> {
  AppDatabase db = AppDatabase();
  final _controller = TextEditingController();
  late List taskList;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    taskList = db.loadData(widget.listName, widget.initialData);
  }

  void checkBoxChanged(int index){
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
    db.updateDb(widget.listName, taskList);
  }

  void saveNewTask(){
    print(_controller.text);
    if(_formKey.currentState!.validate()){
      setState(() {
        taskList.add([_controller.text, false]);
      });
      _controller.clear();
      Navigator.of(context).pop();
      db.updateDb(widget.listName, taskList);
    }

  }

  void cancelNewTask(){
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          formKey: _formKey,
          controller: _controller,
          onSave: saveNewTask,
          onCancel: cancelNewTask,  
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      taskList.removeAt(index);
    });
    db.updateDb(widget.listName, taskList);
    
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
        itemCount: taskList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: taskList[index][0], 
            taskCompleted: taskList[index][1], 
            onChanged:(value) => checkBoxChanged(index),
            deleteTask: (context) => deleteTask(index),
          );
        },
        
      ),
    );
  }
}