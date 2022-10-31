import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/colors.dart';

class OnboardingSlider extends StatefulWidget {
  OnboardingSlider({super.key, required this.img, required this.subtitle, required this.title});
  String title;
  String subtitle;
  String img;
  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.img),
          Text(widget.title,style: TextStyle(color: MyColors.white.withOpacity(0.87),fontSize: 32.sp,fontWeight: FontWeight.w700,),),
          SizedBox(height: 40.h,),
          Text(widget.subtitle,style: TextStyle(color: MyColors.white.withOpacity(0.87),fontSize: 16.sp,fontWeight: FontWeight.w400,),),
        ],
      ),
    );
  }
}
