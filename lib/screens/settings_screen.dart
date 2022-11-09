import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

class SettinsScreen extends StatefulWidget {
  const SettinsScreen({super.key});

  @override
  State<SettinsScreen> createState() => _SettinsScreenState();
}

class _SettinsScreenState extends State<SettinsScreen> {
  String activeLanguage = "";

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.C_121212,
        title: Text(
          "settings".tr(),
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.white.withOpacity(0.87)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(MyImages.arrowBack)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 30).r,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: MyColors.C_121212,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "settings".tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.C_AFAFAF),
            ),
            SizedBox(
              height: 4.h,
            ),
            SettingsItems(MyImages.brush, "change_app_color".tr(),() {}),
            SizedBox(
              height: 8.h,
            ),
            SettingsItems(
                MyImages.text, "change_app_typography".tr(), () {}),
            SizedBox(
              height: 8.h,
            ),
            SettingsItems(MyImages.language, "change_app_language".tr(),
                () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: MyColors.C_363636,
                      actions: [
                      Container(
                        child: Column(children: [
                          LanguageContainer("english".tr(), () {
                            if (activeLanguage != "en-US") {
                              setState(() {
                                context.setLocale( Locale('en', 'US'));
                                activeLanguage = "en-US";
                              });
                            }
                          }, activeLanguage == "en-US"),
                          LanguageContainer(
                            tr("russian"),
                            () {
                              if (activeLanguage != "ru-RU") {
                                setState(() {
                                  context.setLocale( Locale('ru', 'RU'));
                                  activeLanguage = "ru-RU";
                                });
                              }
                            },
                            activeLanguage == "ru-RU",
                          ),
                          LanguageContainer("uzbek".tr(), () {
                            if (activeLanguage != "uz-UZ") {
                              setState(() {
                                context.setLocale( Locale('uz', 'UZ'));
                                activeLanguage = "uz-UZ";
                              });
                            }
                          }, activeLanguage == "uz-UZ",),
                        ]),
                        width: double.infinity,
                        height: 250.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: MyColors.C_363636),
                      ),
                    ]);
                  });
            }),
            Padding(
                padding: EdgeInsets.only(top: 16, bottom: 4).r,
                child: Text(
                  "Import",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.C_AFAFAF),
                )),
            SettingsItems(
                MyImages.import, "import_from_google_calendar".tr(),() {}),
          ],
        ),
      ),
    );
  }

  Widget SettingsItems(
      String iconName, String title, VoidCallback onTap) {
    return SizedBox(
      width: 327.w,
      height: 48.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
             SvgPicture.asset(
            iconName,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.white.withOpacity(0.87)),
          ),
          ],),
         
      
          Row(children: [
            InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                MyImages.arrow_forward,
                width: 24.w,
                height: 24.h,
              )),
          ],)
        ],
      ),
    );
  }

  Widget LanguageContainer(String textt, VoidCallback onTap, bool isActive) {
    return InkWell(
      onTap: onTap,
      child: Container(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
        width: double.infinity,
        height: 50.h,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textt,style: TextStyle(color: MyColors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),),
            Visibility(
              child: isActive ? const Icon(Icons.check_box, color: MyColors.white,) : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
