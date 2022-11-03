import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: MyColors.C_121212,
        width: double.infinity,
        child: Column(),
      ),
    ));
  }
}
