import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';

class SettinsScreen extends StatelessWidget {
  const SettinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.C_E5E5E5,
        title: Text("Settings"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
