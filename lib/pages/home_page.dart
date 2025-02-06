import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/dialog_box.dart';
import 'package:todoapp/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  final _controller = TextEditingController();
  
  @override
  void initState() {
    // check if the first time ever open the app
    if(!_myBox.containsKey("TODOLIST")){
      db.createInitialData();
      db.updateDb();
    }else{
      // there ready exist data
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDb();
  }

  void saveNewTask(){
    print(_controller.text);
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateDb();
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
    db.updateDb();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.palette),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange[800],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Housechores'
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal Tasks'
          ),  
        ]
      ),
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