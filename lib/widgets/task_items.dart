import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/task_info_screen.dart';
import 'package:todo_app/utils/colors.dart';

import '../database/local_database.dart';

class TaskItems extends StatefulWidget {
  TaskItems({super.key, required this.model, required this.onDeleted});
  TodoModel? model;
  final VoidCallback onDeleted;
  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, ).r,
      child: InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TaskInfoScreen( model: widget.model,),));
      },
        child: Container(
          padding: EdgeInsets.only(left: 38, top: 10).r,
          width: 326.w,
          height: 72.h,
          decoration: BoxDecoration(
            color: MyColors.C_363636,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model?.title ?? "",
                style: TextStyle(
                  color: MyColors.white.withOpacity(0.87),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.model?.description ?? "",
                    style: TextStyle(
                      color: MyColors.white.withOpacity(0.87),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Delete"),
                                content: Text(
                                  "Are you sure to delete task ${widget.model?.title ?? ""}",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text("NO"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      var res =
                                          await LocalDatabase.deleteTaskById(
                                              widget.model!.id!);
                                      if (res != 0) {
                                        Navigator.pop(context);
                                        widget.onDeleted();
                                      }
                                    },
                                    child: Text("YES"),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                  //   Text((widget.model?.id).toString(),style: TextStyle(color: MyColors.white.withOpacity(0.87),fontSize: 16.sp, fontWeight: FontWeight.w400,),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
