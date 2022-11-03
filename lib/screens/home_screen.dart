import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/database/local_database.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/widgets/add_task_widget.dart';
import 'package:todo_app/widgets/task_items.dart';
import '../models/todo_model.dart';
import '../utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
        future: LocalDatabase.getList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Container(padding: EdgeInsets.only(top: 200).r,
                  height: double.infinity,
                  width: double.infinity,
                  color: MyColors.C_121212,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                        height: 10.h,
                      ),
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
              );
            }
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24).r,
              color: MyColors.C_121212,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset(MyImages.menu)),
                      Padding(
                        padding: EdgeInsets.only(left: 126, right: 108).r,
                        child: Text(
                          "Index",
                          style: TextStyle(
                            color: MyColors.white.withOpacity(0.87),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
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

                  Container(
                    width: double.infinity,
                    height: 600,
                    child: ListView.builder(
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
                 
                ],
              ),
            );

           
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
