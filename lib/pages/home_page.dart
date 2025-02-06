import 'package:flutter/material.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ["Make tut", false],
    ["Do exercise", false],
    ["Bake", false],
  ];

  void checkBoxChanged(int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask(){
    print(_controller.text);
    setState(() {
      todoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
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
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: todoList[index][0], 
            taskCompleted: todoList[index][1], 
            onChanged:(value) => checkBoxChanged(index),
            deleteTask: (context) => deleteTask(index),
          );
        },
        
      ),
    );
  }
}