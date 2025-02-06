import 'package:flutter/material.dart';
import 'package:todoapp/utils/customized_button.dart';

class DialogBox extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.formKey,
    required this.controller,  
    required this.onSave,  
    required this.onCancel,  
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                ),
                validator: (value){
                  if (value == null || value.trim().isEmpty){
                    return "Task cannot be empty";
                  }
                  return null;
                }
              
              ),
            ),

            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomizedButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 8,),
                CustomizedButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}