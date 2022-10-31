import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/images.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
            
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(MyImages.home), label: "Index"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(MyImages.calendar), label: "Calendar"),
            BottomNavigationBarItem(icon: Icon(null), label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(MyImages.focuse), label: "Focuse"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(MyImages.profile), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
