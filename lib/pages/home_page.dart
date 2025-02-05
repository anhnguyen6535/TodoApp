import 'package:flutter/material.dart';
import 'package:todoapp/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: todoList[index][0], 
            taskCompleted: todoList[index][1], 
            onChanged:(value) => checkBoxChanged(index),
          );
        },
        
      ),
    );
  }
}