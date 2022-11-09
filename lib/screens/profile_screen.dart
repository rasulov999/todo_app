import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/local_data/shared_preference.dart';
import 'package:todo_app/screens/settings_screen.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController ctrl_name = TextEditingController();
  String accountName = "";

  @override
  void initState() {
    super.initState();
    accountName = StorageRepository.getString("accountName");
  }

  String name = StorageRepository.getString('name');
  final formKey = GlobalKey<FormState>();
  final cantrollerEditName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Container(
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
                      name,
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
                              "task_left".tr(),
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
                              "task_done".tr(),
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
                    "settings".tr(),
                    style: TextStyle(
                        color: MyColors.C_AFAFAF,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  settingsItems(
                    MyImages.settings,
                    "app_settings".tr(),
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SettinsScreen()));
                      setState(() {});
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
                    "change_account_name".tr(),
                    () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: MyColors.C_363636,
                              actions: [
                                diolog(),
                              ],
                            );
                          });
                    },
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  settingsItems(
                    MyImages.key,
                    "change_account_password".tr(),
                    () {},
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  settingsItems(
                    MyImages.camera,
                    "change_account_image".tr(),
                    () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Container(
                          width: 375.w,
                          height: 244.h,
                          decoration: BoxDecoration(
                            color: MyColors.C_363636,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.r),
                                topRight: Radius.circular(4.r)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "change_account_image".tr(),
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
                    "about_us".tr(),
                    () {},
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  settingsItems(
                    MyImages.info,
                    "FAQ",
                    () {},
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  settingsItems(
                    MyImages.flash,
                    "help&feedback".tr(),
                    () {},
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  settingsItems(
                    MyImages.flash,
                    "support_us".tr(),
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
                            "log_out".tr(),
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
      ),
    );
  }

  Widget settingsItems(
    String iconName,
    String title,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: 327.w,
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
            ],
          ),
          Row(
            children: [
              InkWell(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    MyImages.arrow_forward,
                    width: 24.w,
                    height: 24.h,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget diolog() {
    return Container(
      width: 327.w,
      height: 187.h,
      decoration: BoxDecoration(
        color: MyColors.C_363636,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            "change_account_name".tr(),
          ),
          Divider(),
          TextFormField(
            //initialValue: name,
            controller: cantrollerEditName,
            onChanged: (val) {
              name = val;
            },
            // controller:  ctrl_name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Expanded(
                  child: Container(
                    height: 48.h,
                    // width: 153.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),

                    child: Center(
                      child: Text('cancel').tr(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await StorageRepository.saveString(
                      'name', cantrollerEditName.text);
                  // cantrollerEditName.text = '';
                    setState(() {
                      
                    });
                  Navigator.pop(context);
                },
                child: Expanded(
                  child: Container(
                    height: 48.h,
                    width: 153.w,
                    decoration: BoxDecoration(
                      color: MyColors.C_8687E7,
                    ),
                    child: Center(
                      child: Text('edit').tr(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
