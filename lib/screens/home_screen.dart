import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/colors.dart';
import '../utils/images.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24).r,
        color: MyColors.C_121212,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
             height: 10.h),
            Row(
              children: [
                InkWell(onTap: () {}, child: SvgPicture.asset(MyImages.menu)),
                Padding(
                    padding: EdgeInsets.only(left: 126, right: 108).r,
                    child: Text(
                      "Index",
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 174.h,),
            SvgPicture.asset(
              MyImages.home_logo,
              width: 226.w,
              height: 226.h,
            ),
            Text(
              "What do you want to do today?",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
             height: 10.h,),
            Text(
              "Tap + to add your tasks",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
