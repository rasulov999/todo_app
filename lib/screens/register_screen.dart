import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screens/home_screen.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: double.infinity,
        color: MyColors.C_121212,
        child: Column(
          children: [
            Container(
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
              height: 16.h,
            ),
            Text(
              "Register",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "Username",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                 filled: true,
                fillColor: MyColors.C_1D1D1D,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.C_979797
                    )
                  ),
                  hintText: "Enter your Username",
                  hintStyle: TextStyle(color: MyColors.C_535353)),
            ),
            SizedBox(
              height: 26.h,
            ),
            Text(
              "Password",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                 filled: true,
                fillColor: MyColors.C_1D1D1D,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.C_979797
                    )
                  ),
                  hintText: "* * * * * * * * * * * *",
                  hintStyle: TextStyle(color: MyColors.C_535353)),
            ),
            SizedBox(height: 24.h,),
            Text(
              "Confirm Password",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                 filled: true,
                fillColor: MyColors.C_1D1D1D,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.C_979797
                    )
                  ),
                  hintText: "* * * * * * * * * * * *",
                  hintStyle: TextStyle(color: MyColors.C_535353)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40).r,
              child: InkWell(
                onTap: () {
                   Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                },
                child: Container(
                  decoration: BoxDecoration(color: MyColors.C_8875FF),
                  width: 326.w,
                  height: 48.h,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.50),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Divider(
                  color: MyColors.C_979797,
                ),
                Center(child: Text("or")),
                Divider(
                  color: MyColors.C_979797,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 20).r,
              child: InkWell(
                onTap: () {},
                child: Container(padding: EdgeInsets.symmetric(horizontal: 82).r,
                  child: Row(
                    children: [
                      SvgPicture.asset(MyImages.google),
                      SizedBox(width: 10..h,),
                      Text(
                        "Login with Google",
                        style: TextStyle(
                          color: MyColors.white.withOpacity(0.87),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  width: 326.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: MyColors.C_121212,
                    border: Border.all(color: MyColors.C_8875FF),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(padding: EdgeInsets.symmetric(horizontal: 82).r,
                child: Row(
                  children: [
                    SvgPicture.asset(MyImages.apple),  SizedBox(width: 10..h,),
                    Text(
                      "Login with Appe",
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                width: 326.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: MyColors.C_121212,
                  border: Border.all(color: MyColors.C_8875FF),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: MyColors.C_979797,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
          ],
        ),
      ),
    ));
  }
}