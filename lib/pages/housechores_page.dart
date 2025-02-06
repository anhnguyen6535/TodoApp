import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/utils/task_page.dart';

class HouseChoresPage extends StatelessWidget {
  final AppDatabase db = AppDatabase();
  HouseChoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericTaskPage(
      listName: "CHORESLIST", 
      initialData: [
        ["Do laundry", false],
        ["Buy groceries", false],
      ],
    );
  }
}