import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/register_screen.dart';
import 'package:todo_app/utils/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24).r,
          color: MyColors.C_121212,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: MyColors.white,
                  )),
              SizedBox(
                height: 46.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28).r,
                child: Center(
                  child: Text(
                    "Welcome to UpTodo",
                    style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Center(
                child: Text(
                  "Please login to your account or create \nnew account to continue",
                  style: TextStyle(
                      color: MyColors.white.withOpacity(0.67),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 370.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Container(
                  width: 326.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: MyColors.C_8875FF,
                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
           
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Container(
                  width: 326.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: MyColors.C_121212,
                      border: Border.all(color: MyColors.C_8875FF, width: 1.w)),
                  child: Center(
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
