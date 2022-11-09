import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/database/local_database.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/images.dart';
import '../screens/main_page.dart';
import '../utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'grid_container.dart';

class AddTaskWidget extends StatefulWidget {
  AddTaskWidget({
    super.key,
  });

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final formKey = GlobalKey<FormState>();
  String title = "";
  String newTitle = "";
  String newDescription = "";
  List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          height: double.infinity,
          color: MyColors.C_121212,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24).r,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "add_task".tr(),
                    style: TextStyle(
                      color: MyColors.white.withOpacity(0.87),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  TextFormField(
                    style: TextStyle(color: MyColors.white),
                    onChanged: (val) {
                      newTitle = val;
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: MyColors.C_1D1D1D,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.C_979797)),
                        hintText: "Title",
                        hintStyle: TextStyle(color: MyColors.C_535353)),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormField(
                    style: TextStyle(color: MyColors.white),
                    onChanged: (val) {
                      newDescription = val;
                    },
                    maxLines: 6,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(color: MyColors.C_535353)),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(MyImages.timer),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35, right: 35).r,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(MyImages.tag),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32, right: 145).r,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return AlertDialog(
                                        backgroundColor: MyColors.C_363636,
                                        actions: [
                                          Container(
                                            height: 360.h,
                                            width: 326.w,
                                            child: Column(
                                              children: [
                                                Text("Task Priority"),
                                                Expanded(
                                                  child: GridView.builder(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 4,
                                                              mainAxisSpacing:
                                                                  16,
                                                              crossAxisSpacing:
                                                                  16),
                                                      itemCount: 10,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        return GridContainer(
                                                            // currentIndex:currentIndex,
                                                            index: index,
                                                            onTap: () {
                                                              setState(
                                                                () {},
                                                              );
                                                            },
                                                            num: _numbers[
                                                                index]);
                                                      }),
                                                ),
                                                SizedBox(
                                                  height: 18.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 152.w,
                                                        height: 48.h,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.r),
                                                            color: MyColors
                                                                .C_8687E7),
                                                        child: const Center(
                                                          child: Text("Save"),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                          },
                          child: SvgPicture.asset(MyImages.flag),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (newTitle.isNotEmpty &&
                              newDescription.isNotEmpty) {
                            var newTodo = TodoModel(
                              title: newTitle,
                              description: newDescription,
                              date: "date",
                              priority: "priority",
                              isCompleted: 0,
                            );
                            LocalDatabase.insertToDatabase(newTodo);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()),
                                (route) => false);
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Oshibka qildin"),
                                content: Text("Hamasn toldrin"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Chundm"),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        child: SvgPicture.asset(MyImages.send),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomSheet: showModalBottomSheet<void>(context: context, builder: (context)=>Container())
    );
  }
}
