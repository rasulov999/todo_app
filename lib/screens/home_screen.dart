import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int _currentPage = 0;
  bool isSheet = false;
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  DateTime selectedDate = DateTime.now();
  final PageController _controller = PageController();
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.C_363636,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            isSheet = !isSheet;
          });
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24).r,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Task",
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
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: MyColors.C_1D1D1D,
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColors.C_979797)),
                                  hintText: "Enter your Username",
                                  hintStyle:
                                      TextStyle(color: MyColors.C_535353)),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Description",
                                  hintStyle:
                                      TextStyle(color: MyColors.C_535353)),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        showDatePicker(
                                          confirmText: 'Choose Time',
                                          cancelText: 'Cancel',
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime(2015),
                                          lastDate: DateTime(2101),
                                        );
                                      });
                                    },
                                    child: SvgPicture.asset(MyImages.timer)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 35, right: 35).r,
                                    child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(MyImages.tag))),
                                InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  MyColors.C_363636,
                                              //   title: ,
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
                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    4,
                                                                mainAxisSpacing:
                                                                    16,
                                                                crossAxisSpacing:
                                                                    16),
                                                            itemCount: 10,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    index) {
                                                              return GridContainer(
                                                                  numbers[
                                                                      index]);
                                                            }),
                                                      ),
                                                      SizedBox(
                                                        height: 18.h,
                                                      ),
                                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                Text("Cancel"),
                                                          ),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              width: 152.w,
                                                              height: 48.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(4
                                                                              .r),
                                                                  color: MyColors
                                                                      .C_8687E7),
                                                              child: Center(
                                                                child: Text(
                                                                    "Save"),
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
                                          });
                                    },
                                    child: SvgPicture.asset(MyImages.flag)),
                                SizedBox(
                                  width: 170.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    MyImages.send,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      height: 350.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        color: MyColors.C_363636,
                      ),
                    ),
                  ));
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.home), label: "Index"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.calendar), label: "Calendar"),
          BottomNavigationBarItem(icon: SvgPicture.asset(MyImages.add), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.focuse), label: "Focuse"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(MyImages.profile), label: "Profile"),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24).r,
        color: MyColors.C_121212,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                InkWell(onTap: () {}, child: SvgPicture.asset(MyImages.menu)),
                Padding(
                    padding: EdgeInsets.only(left: 126, right: 108).r,
                    child: Text(
                      "Index",
                      style: TextStyle(
                        color: MyColors.white.withOpacity(0.87),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 174.h,
            ),
            !isSheet
                ? SvgPicture.asset(
                    MyImages.home_logo,
                    width: 226.w,
                    height: 226.h,
                  )
                : Container(),
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
    ));
  }

  Widget GridContainer(int num) {
    return Container(
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
            "${num}",
            style: TextStyle(
              color: MyColors.white.withOpacity(0.87),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
