import 'package:flutter/material.dart';

import '../utils/colors.dart';

class FocuseScreen extends StatelessWidget {
  const FocuseScreen({super.key});

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
