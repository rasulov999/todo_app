import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/screens/settings_screen.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24).r,
          color: MyColors.C_121212,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28.h,
                ),
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 10).r,
                    child: Container(
                      width: 85.w,
                      height: 85.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Name ',
                    style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 154.w,
                        height: 58.h,
                        decoration: BoxDecoration(
                          color: MyColors.C_363636,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            "10 Task left",
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 154.w,
                        height: 58.h,
                        decoration: BoxDecoration(
                          color: MyColors.C_363636,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            "5 Task done",
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: MyColors.C_AFAFAF,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                settingsItems(
                  MyImages.settings,
                  "App Settings",
                  212.4,
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SettinsScreen()));
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      color: MyColors.C_AFAFAF,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                settingsItems(
                  MyImages.profile,
                  "Change account name",
                  144.6,
                  () {},
                ),
                SizedBox(
                  height: 8.h,
                ),
                settingsItems(
                  MyImages.key,
                  "Change account password",
                  111.4,
                  () {},
                ),
                SizedBox(
                  height: 8.h,
                ),
                settingsItems(
                  MyImages.camera,
                  "Change account Image",
                  137.4,
                  () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Container(
                        width: 375.w,
                        height: 244.h,
                        decoration: BoxDecoration(
                          color: MyColors.C_363636,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r),topRight:Radius.circular(4.r)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Change account Image",
                                style: TextStyle(
                                    color: MyColors.white.withOpacity(0.87),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Divider(),
                            
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Uptodo",
                  style: TextStyle(
                      color: MyColors.C_AFAFAF,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4.h,
                ),
                settingsItems(
                  MyImages.menupr,
                  "About US",
                  237,
                  () {},
                ),
                SizedBox(
                  height: 8.h,
                ),
                settingsItems(
                  MyImages.info,
                  "FAQ",
                  276,
                  () {},
                ),
                SizedBox(
                  height: 8.h,
                ),
                settingsItems(
                  MyImages.flash,
                  "Help & Feedback",
                  183,
                  () {},
                ),
                SizedBox(
                  height: 8.h,
                ),
                settingsItems(
                  MyImages.flash,
                  "Support US",
                  223,
                  () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 86.w,
                    height: 24.h,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          MyImages.logout,
                          width: 24.w,
                          height: 24.h,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Log out",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget settingsItems(
    String iconName,
    String title,
    double height,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: 327.w,
      height: 48.h,
      child: Row(
        children: [
          SvgPicture.asset(
            iconName,
            height: 24.h,
            width: 24.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15).r,
            child: Text(
              title,
              style: TextStyle(
                  color: MyColors.white.withOpacity(0.87),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: height,
          ),
          InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                MyImages.arrow_forward,
                width: 24.w,
                height: 24.h,
              )),
        ],
      ),
    );
  }
}
