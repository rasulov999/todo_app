import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/database/local_database.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/widgets/task_items.dart';
import '../models/todo_model.dart';
import '../utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const Drawer(),
      key: _scaffoldKey,
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return DataIsEmpty();
            }
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24).r,
              color: MyColors.C_121212,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomAppbar(),
                   SizedBox(
                    height: 16.h,
                  ),
                  CustomTextfiled(),
                  SizedBox(height: 30.h,),
                ExpansionTile(
                  iconColor: Colors.white,
                  title: Text("today",style: TextStyle(color: MyColors.white),).tr(),
                    children: [SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return TaskItems(
                                    model: snapshot.data?[index],
                                    onDeleted: () {
                                      LocalDatabase.deleteTaskById(
                                          snapshot.data?[index].id ?? 0);
                                      setState(() {});
                                    });
                              }),
                        ),
                      ),
                    ),
                    ]
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }

  Widget DataIsEmpty() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      height: double.infinity,
      width: double.infinity,
      color: MyColors.C_121212,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16.h,
          ),
          CustomAppbar(),
          SizedBox(
            height: 100.h,
          ),
          SvgPicture.asset(
            MyImages.home_logo,
            width: 226.w,
            height: 226.h,
          ),
          Text(
            "what_do_you_want_to_do_today?".tr(),
            style: TextStyle(
              color: MyColors.white.withOpacity(0.87),
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "tap+to_add your_tasks".tr(),
            style: TextStyle(
              color: MyColors.white.withOpacity(0.87),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget CustomAppbar() {
    return SizedBox(
      height: 42.h,
      width: 327.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: SvgPicture.asset(MyImages.menu)),
          Text(
            "Index",
            style: TextStyle(
              color: MyColors.white.withOpacity(0.87),
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
                      width: 42.w,
                      height: 42.h,
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
         
        ],
      ),
    );
  }

  Widget CustomTextfiled() {
    return Container(
      width: 327.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: MyColors.C_1D1D1D,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: MyColors.C_979797,width: 0.8.w),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,color: MyColors.C_AFAFAF,),
    
          hintText: "Search for your task...",
          hintStyle: TextStyle(
            color: MyColors.C_AFAFAF,fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

}
