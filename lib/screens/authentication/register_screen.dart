import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/local_data/shared_preference.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/main_page.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username_ctrl = TextEditingController();
  TextEditingController password_ctrl = TextEditingController();
  TextEditingController c_password_ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  TextField(
                    obscureText: false,
                    controller: username_ctrl,
                    decoration: InputDecoration(
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
                  TextField(
                    obscureText: true,
                    controller: password_ctrl,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: MyColors.C_1D1D1D,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.C_979797)),
                        hintText: "* * * * * * * * * * * *",
                        hintStyle: TextStyle(color: MyColors.C_535353)),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
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
                  TextField(
                    obscureText: true,
                    controller: c_password_ctrl,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: MyColors.C_1D1D1D,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.C_979797)),
                        hintText: "* * * * * * * * * * * *",
                        hintStyle: TextStyle(color: MyColors.C_535353)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40).r,
                    child: InkWell(
                      onTap: () async{
                         if((username_ctrl.text.isNotEmpty&&password_ctrl.text.isNotEmpty && (password_ctrl.text==c_password_ctrl.text))==true){
                      await StorageRepository.saveString("name", username_ctrl.text);
                      await StorageRepository.saveString('password', password_ctrl.text);
                      await StorageRepository.saveBool('login', true);

                     Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                            (route) => false);
                    }
                     if(username_ctrl.text.isNotEmpty && (password_ctrl.text!=c_password_ctrl.text)){
                      ScaffoldMessenger.of(context).showSnackBar(const
                      SnackBar(
                          content: Text("The entered passwords are not similar",
                          style: TextStyle(color: Colors.red),
                          ),
                        backgroundColor: Colors.black54,
                        duration: Duration(seconds: 3),

                      ));
                    }
                     if(username_ctrl.text.isEmpty || password_ctrl.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text( "${username_ctrl.text.isEmpty==false?"Password":"Username"} not entered!",
                          style: TextStyle(color: Colors.red),
                        ),
                        backgroundColor: Colors.black54,
                        duration: Duration(seconds: 3),
                      ));
                    }
                        
                      },
                      child: Container(
                        decoration:
                            const BoxDecoration(color: MyColors.C_8875FF),
                        width: 326.w,
                        height: 48.h,
                        child: Center(
                          child: Text(
                            'Register',
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
                    padding: EdgeInsets.only(top: 24, bottom: 20).r,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 82).r,
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
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 82).r,
                      child: Row(
                        children: [
                          SvgPicture.asset(MyImages.apple),
                          SizedBox(
                            width: 10..h,
                          ),
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
