import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/database/local_database.dart';
import 'package:todo_app/screens/main_page.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

import '../models/todo_model.dart';

class TaskInfoScreen extends StatefulWidget {
   TaskInfoScreen({super.key,required this.model});
TodoModel? model;
  @override
  State<TaskInfoScreen> createState() => _TaskInfoScreenState();
}

class _TaskInfoScreenState extends State<TaskInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24).r,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: MyColors.C_121212,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: MyColors.C_1D1D1D,
                      ),
                      child: Center(
                        child: SvgPicture.asset(MyImages.cancel,height: 24.h,width: 24.w,),
                      ),
                    ),
                  ),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: MyColors.C_1D1D1D,
                    ),
                    child: Center(
                      child: SvgPicture.asset(MyImages.repeat, height: 24.h,width: 24.w,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h,),
              Row(
                children: [
                  Container(
                    width: 16.w, height: 16.h,
                    decoration: BoxDecoration(
                      color: MyColors.C_363636,
                      shape: BoxShape.circle,
                      border: Border.all(color: MyColors.white, width: 1.5.w),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 20,right: 100).r,
                    child: Text(widget.model!.title,style: TextStyle(
                      color: MyColors.white.withOpacity(0.87),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
                  SvgPicture.asset(MyImages.edit,width: 24.w,height: 24.h,),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 36,top: 15,bottom: 38).r,
                child: Text(widget.model!.description,style: TextStyle(
                        color: MyColors.C_AFAFAF,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),),
              ),
              SettingsItems(MyImages.timer, 'Task Time :', 108.w, 112.0.w, Center(child: Text("Today At 16:45",style: 
              TextStyle(fontSize: 12.sp, 
              fontWeight: FontWeight.w400, color: MyColors.white.withOpacity(0.87),
            ),
          ),
        ),
      ), SizedBox(height: 34.h,),
      SettingsItems(MyImages.tag, 'Task Category :', 118.w, 74.w, Row(), ),
      SizedBox(height: 26.h,),
      SettingsItems(MyImages.flag, 'Task Priority :', 70.w, 134.w, Center(child: Text("Default",style: 
              TextStyle(fontSize: 12.sp, 
              fontWeight: FontWeight.w400, color: MyColors.white.withOpacity(0.87), 
          ),
        ),
      ),
    ), SizedBox(height: 28.h,),
    SettingsItems(MyImages.subTask, 'Sub - Task', 104.w, 124.w, Center(
      child: Text("Add Sub - Task",style: TextStyle(fontSize: 12.sp, 
              fontWeight: FontWeight.w400, color: MyColors.white.withOpacity(0.87), 
          ),),
    ),),
    SizedBox(height: 29.h,),
    InkWell( onTap: (){
      showDialog(context: context, builder: (context) => AlertDialog(
        backgroundColor: MyColors.C_363636,
        actions: [
          deleteTask(),
        ],
      ));
    },
      child: SizedBox(
        width: 116.w, height: 24.h,
        child: Row(
          children: [
            SvgPicture.asset(MyImages.trash,width: 24.w,height: 24.h, color: MyColors.C_FF4949,),
            SizedBox(width: 16.w,),
            Text("Delete Task", style:TextStyle(fontSize: 16.sp, 
                fontWeight: FontWeight.w400, color: MyColors.C_FF4949, 
            ),)
          ],
        ),),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 218).r,
      child: InkWell( onTap:(){},
        child: Container(
          child: Center(
            child:  Text("Edit Task",style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16.sp,
              color: MyColors.white,
            ),),
          ),
          width: 327.w,height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: MyColors.C_8687E7,
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
  Widget SettingsItems(String iconName, String title,  double coontainerWidth,
  double width,Widget containerChild,){
    return SizedBox(
      width: 329.w,height: 37.h,
      child: Row(
        children: [
          SvgPicture.asset(iconName,width: 24.w,height: 24.h,),
          SizedBox(width: 10.w,),
          Text(title,style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w400,
            color: MyColors.white.withOpacity(0.87),
          ),),
          SizedBox(width: width,),
          Container(height: 40.h, width: coontainerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: const Color.fromRGBO(255,255, 255, 0.21),
            ),
            child: containerChild,)
        ],
      ),
    );
  }
  Widget deleteTask(){
    return Container(padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 4).r,
      width: 500.w, height: 200.h,
      decoration: BoxDecoration(
        color: MyColors.C_363636,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Delete Task',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700,
            color: MyColors.white.withOpacity(0.87),),),
          ),
          SizedBox(height: 10.h,),
          Divider(color: MyColors.C_979797,height: 1.h,),
          Text('Are You sure you want to delete this task?\nTask title : ${widget.model!.title}',style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500,
            color: MyColors.white.withOpacity(0.87),),textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            SizedBox(
              width: 311.w, height: 48.h,
              child: Row(children: [
                InkWell(onTap: (){
                  Navigator.pop(context);
                },
                  child: Text("Cancel",style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,
                  color: MyColors.C_8687E7),),),
                  SizedBox(width: 62.w,),
                  InkWell(onTap: ()async{
                    var res =await LocalDatabase.deleteTaskById( widget.model!.id!);
                     
                      if (res != 0) {
                        Navigator.pop(context);
                           // widget.onDeleted();
                            } // Navigator.pop(context);
                             Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                  },
                    child: Container(width: 152.w,height: 48.h,
                    decoration: BoxDecoration(
                      color: MyColors.C_8687E7,
                      borderRadius: BorderRadius.circular(4.r),
                    ),child: Center(
                      child: Text('Delete',style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,
                  color: MyColors.white),),
                    ),
                    ),
                  ),
              ],),
            ),
        ],
      ),
    );
  }
}
