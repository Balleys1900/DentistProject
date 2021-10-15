import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/cart/InstanceTime.dart';
import 'package:table_calendar/table_calendar.dart';

class PageBookingCalendar extends StatefulWidget {
  PageBookingCalendar({
    Key? key,
  }) : super(key: key);

  @override
  _PageBookingCalendarState createState() => _PageBookingCalendarState();
}

class _PageBookingCalendarState extends State<PageBookingCalendar> {
  CalendarController _calendarController = CalendarController();
  InstanceTime instanceTime = InstanceTime();
  bool isSelected = false;
  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TableCalendar(
                calendarController: _calendarController,
                initialCalendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                formatAnimation: FormatAnimation.slide,
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                  leftChevronMargin: EdgeInsets.only(left: 70),
                  rightChevronMargin: EdgeInsets.only(right: 70),
                ),
                calendarStyle: CalendarStyle(
                    weekendStyle: TextStyle(color: Colors.white),
                    weekdayStyle: TextStyle(color: Colors.white)),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.white),
                    weekdayStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            'Thời gian hợp lệ',
            style: TextStyle(
              color: Color(0xff363636),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 2.6,
            children: [
              ...instanceTime.listTime
                  .map((e) => clinicTiming(e.ID, e.time, e.status))
                  .toList(),
            ],
          ),
        ),
        // Expanded(
        //   child: Container(
        //     padding: EdgeInsets.all(20),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(40),
        //             topRight: Radius.circular(40)),
        //         color: Colors.white),
        //     child: Container(
        //       child: SingleChildScrollView(
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 Text(
        //                   "18 April 2020",
        //                   style: TextStyle(color: Colors.grey),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 15,
        //             ),
        //             Column(
        //               children: [],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  clinicTiming(int ID, String time, String status) {
    if (status == 'default') {
      return new Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.access_time,
                color: Colors.black,
                // size: 18,
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () => setState(() {
                  instanceTime.changeStatusActive(ID);
                }),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else if (status == 'active') {
      return new Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.cyan[600],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.access_time,
                color: Colors.white,
                size: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 2),
              child: TextButton(
                onPressed: () => setState(() {
                  instanceTime.changeStatusDefault(ID);
                }),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    return new Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Colors.white,
              size: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 2),
            child: TextButton(
              onPressed: () => null,
              child: Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
