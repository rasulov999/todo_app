import 'package:flutter/material.dart';

import '../../database/local_database.dart';
import '../../models/todo_model.dart';

class AddTaskWidget extends StatefulWidget {
  VoidCallback onNewTask;

  AddTaskWidget({Key? key, required this.onNewTask}) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String newTitle = "";
  String newDescription = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (val) {
                newTitle = val ?? "";
              },
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              onSaved: (val) {
                newDescription = val ?? "";
              },
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  formKey.currentState?.save();
                  var newTodo = TodoModel(
                    title: newTitle,
                    description: newDescription,
                    date: "date",
                    priority: "priority",
                    isCompleted: 0,
                  );
                  LocalDatabase.insertToDatabase(newTodo);

                  widget.onNewTask();

                  Navigator.pop(context);
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
