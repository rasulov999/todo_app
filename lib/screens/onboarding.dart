import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/authentication/login_screen.dart';
import 'package:todo_app/screens/authentication/register_screen.dart';
import 'package:todo_app/screens/authentication/start_screen.dart';
import 'package:todo_app/utils/images.dart';
import 'package:todo_app/widgets/onboarding_slider.dart';

import '../utils/colors.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  final List<Widget> _pages = [
    OnboardingSlider(
        img: MyImages.onboarding1,
        subtitle:
            "You can easily manage all of your daily \ntasks in DoMe for free",
        title: "Manage your tasks"),
    OnboardingSlider(
        img: MyImages.onboarding2,
        subtitle:
            "In Uptodo  you can create your \npersonalized routine to stay productive",
        title: "Create daily routine"),
    OnboardingSlider(
        img: MyImages.onboarding3,
        subtitle:
            "You can organize your daily tasks by \nadding your tasks into separate categories",
        title: "Orgonaize your tasks"),
  ];
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLog = _pref.getBool("isLoggedIn") ?? false;
    return _pref.getBool("isLoggedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24).r,
          color: MyColors.C_121212,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              isLog ? StartScreen() : StartScreen()));
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: MyColors.white.withOpacity(0.44),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55).r,
                child: Container(
                  height: 450,
                  child: PageView.builder(
                      controller: _controller,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _pages.length,
                      itemBuilder: (context, index) {
                        return _pages[index];
                      }),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.44),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: MyColors.C_8875FF,
                    ),
                    width: 90.w,
                    height: 48.h,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          if(_currentPage == (_pages.length - 1)){
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const StartScreen()));
                  }
                  else {
                    _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutQuint);
                  }
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            color: MyColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
