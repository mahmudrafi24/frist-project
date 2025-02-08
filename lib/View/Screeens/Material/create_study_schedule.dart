import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frist_project/Utils/StaticString/static_string.dart';
import 'package:frist_project/View/Widgets/Custom_Button/custom_button.dart';
import 'package:frist_project/View/Widgets/Custom_Text/custom_text.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';
import '../../Widgets/CustomShowDialogBox/custom_show_dialog_box.dart';
import '../../Widgets/CustomTextField/custome_text_field.dart';

class CreateStudySchedule extends StatefulWidget {
  const CreateStudySchedule({super.key});

  @override
  State<CreateStudySchedule> createState() => _CreateStudyScheduleState();
}

class _CreateStudyScheduleState extends State<CreateStudySchedule> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<Map<String, String>> events = [
    {
      "date": "18 Sept",
      "title": "Mathematics Class",
      "subtitle": "Algebra & Geometry"
    },
    {"date": "19 Sept", "title": "Physics Class", "subtitle": "Newton's Laws"},
    {"date": "20 Sept", "title": "Chemistry Lab", "subtitle": "Acids & Bases"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.menu)),
        title: SvgPicture.asset(AppIcons.mainIcon),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.notification),
            onPressed: () {},
          )
        ],
        elevation: 1,
        backgroundColor: AppColors.white100,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1, // Half of the screen
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay ?? DateTime.now(), day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: AppColors.caledarColor,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.caledarColor,
                      shape: BoxShape.circle,
                    ),
                    outsideDaysVisible: false,
                    defaultTextStyle:
                        TextStyle(color: Colors.black), // Future days
                    disabledTextStyle:
                        TextStyle(color: Colors.grey), // Past days
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                    leftChevronIcon:
                        Icon(Icons.arrow_back, color: Colors.black),
                    rightChevronIcon:
                        Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: AppColors.calendarDay),
                    weekdayStyle: TextStyle(color: AppColors.calendarDay),
                  ),
                  enabledDayPredicate: (day) {
                    return day
                        .isAfter(DateTime.now().subtract(Duration(days: 1)));
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1, // Second half for other content
              child: Column(
                children: [
                  CustomText(
                    text: "Schedule",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black500,
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: List.generate(events.length, (index) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue50,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    color: AppColors.primary500,
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: events[index]["date"]!,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white100,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: events[index]["title"]!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black500,
                                      ),
                                      SizedBox(height: 4.h),
                                      CustomText(
                                        text: events[index]["subtitle"]!,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColors.black200,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(AppIcons.forward),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: AppColors.white100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: "Apply Study Schedule",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black500,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextField(
                                      borderRadius: 8,
                                      hintText: "Calendar",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey600,
                                      ),
                                      fillColor: AppColors.grey300,
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon:
                                            SvgPicture.asset(AppIcons.calendar),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    CustomTextField(
                                      borderRadius: 8,
                                      hintText: "Title",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey600,
                                      ),
                                      fillColor: AppColors.grey300,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    CustomTextField(
                                      borderRadius: 8,
                                      hintText: "Description",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey600,
                                      ),
                                      fillColor: AppColors.grey300,
                                      height: 300.h,
                                      maxLines: 8,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    CustomButton(
                                      onTap: () {
                                        // Handle your custom button action here
                                      },
                                      fillColor: AppColors.primary500,
                                      textColor: AppColors.white100,
                                      title: "Create",
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    fillColor: AppColors.primary500,
                    textColor: AppColors.white200,
                    title: AppString.createMyschedule,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
