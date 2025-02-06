import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../../../Utils/AppIcons/app_icons.dart';

class CreateStudySchedule extends StatefulWidget {
  const CreateStudySchedule({super.key});

  @override
  State<CreateStudySchedule> createState() => _CreateStudyScheduleState();
}

class _CreateStudyScheduleState extends State<CreateStudySchedule> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar for all the pages
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
      body: Column(
        children: [
          Expanded(
            flex: 1, // Half of the screen
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: false,
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  leftChevronIcon: Icon(Icons.arrow_back, color: Colors.black),
                  rightChevronIcon:
                      Icon(Icons.arrow_forward, color: Colors.black),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.blue),
                  weekdayStyle: TextStyle(color: Colors.blue.shade800),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1, // Second half for other content
            child: Center(
              child: Text(
                "Other Content Here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
