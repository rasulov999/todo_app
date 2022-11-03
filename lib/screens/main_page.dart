import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/screens/calendar_screen.dart';
import 'package:todo_app/screens/focuse_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List <Widget> _pages=[
    HomeScreen(),
    CalendarScreen(),
    Container(child: Center(
      child: Text("ADD TODO"),
    ),),
FocuseScreen(),
ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:_pages[selectedIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: MyColors.C_363636,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
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
            BottomNavigationBarItem(icon: SvgPicture.asset(MyImages.add), label: ""),
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
