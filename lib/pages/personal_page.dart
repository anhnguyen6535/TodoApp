import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/task_page.dart';

class PersonalPage extends StatelessWidget {
  final AppDatabase db = AppDatabase();
  PersonalPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GenericTaskPage(
      listName: "TODOLIST", 
      initialData: [
        ["Make tut", false],
        ["Do exercise", false],
        ["Bake", false],
      ],
    );
  }
}