import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screens/main_page.dart';
import 'package:todo_app/screens/authentication/register_screen.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
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
              icon: const Icon(
                Icons.arrow_back_ios,
                color: MyColors.white,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "LOGIN",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 52,
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
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: MyColors.C_1D1D1D,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.C_979797)),
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
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: MyColors.C_1D1D1D,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.C_979797)),
                  hintText: "* * * * * * * * * * *",
                  hintStyle: TextStyle(color: MyColors.C_535353)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 68).r,
              child: InkWell(
                onTap: () {
                  saveLogin(context);
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
              children: const [
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
              padding: EdgeInsets.only(top: 28, bottom: 20).r,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 82).r,
                  width: 326.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: MyColors.C_121212,
                    border: Border.all(color: MyColors.C_8875FF),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(MyImages.google),
                      SizedBox(
                        width: 10..h,
                      ),
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
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 82).r,
                width: 326.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: MyColors.C_121212,
                  border: Border.all(color: MyColors.C_8875FF),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(MyImages.apple),
                    SizedBox(width: 10.h),
                    Text(
                      "Login with Apple",
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
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
                            builder: (context) => const RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "Register",
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
    ));
  }

  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", true);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
        (route) => false);
  }
}
