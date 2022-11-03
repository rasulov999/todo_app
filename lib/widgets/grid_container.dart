import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class GridContainer extends StatefulWidget {
  GridContainer({super.key, required this.num, required this.onTap});
  int num;
  VoidCallback onTap;
  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell( onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        width: 64.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: MyColors.C_272727,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          children: [
            SvgPicture.asset(MyImages.flag),
            SizedBox(
              height: 6.h,
            ),
            Text(
              "${widget.num}",
              style: TextStyle(
                color: MyColors.white.withOpacity(0.87),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
