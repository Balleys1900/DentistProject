import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/api/http_service_booking.dart';
import 'package:flutter_dentist_app/cart/InstanceTime.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class PageBookingCalendar extends StatefulWidget {
  final VoidCallback selecte;
  final VoidCallback unselect;
  PageBookingCalendar({
    Key? key,
    required this.selecte,
    required this.unselect,
  }) : super(key: key);

  @override
  _PageBookingCalendarState createState() => _PageBookingCalendarState();
}

class _PageBookingCalendarState extends State<PageBookingCalendar> {
  CalendarController _calendarController = CalendarController();
  @override
  void initState() {
    super.initState();
    instanceTime.changeAllStatusToDefault();
    instanceTime.changeStatusDay(DateTime.now());

    HttpServiceBooking()
        .getTimeAvailable(
            new DateFormat('dd-MM-yyyy').format(instanceTime.date))
        .then(
          (value) => setState(
            () {
              // check lại logic ngày hệ thống(realtime)
              instanceTime.changeStatusInactive(value);
            },
          ),
        );
  }

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
                startDay: DateTime.now(),
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
                onDaySelected: (day, events, holidays) => {
                  setState(() {
                    instanceTime.changeStatusDay(day);
                    HttpServiceBooking()
                        .getTimeAvailable(new DateFormat('dd-MM-yyyy')
                            .format(instanceTime.date))
                        .then((value) => setState(() {
                              instanceTime.changeStatusInactive(value);
                            }));
                  }),
                },
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
            'Thời gian phù hợp',
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
                  .map((time) => clinicTiming(time))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }

  clinicTiming(time) {
    if (time.status == 'default') {
      return new Container(
        margin: EdgeInsets.only(top: 10, right: 8, left: 8),
        decoration: BoxDecoration(
          color: Colors.cyan[100],
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
                color: Colors.black54,
                // size: 18,
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () => setState(() {
                  instanceTime.timeSelect = time;
                  instanceTime.changeStatusActive(time.ID);
                  widget.selecte();
                }),
                child: Text(
                  time.time,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else if (time.status == 'active') {
      return new Container(
        margin: EdgeInsets.only(top: 10, right: 8, left: 8),
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
                  instanceTime.changeStatusDefault(time.ID);
                  widget.unselect();
                }),
                child: Text(
                  time.time,
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
      margin: EdgeInsets.only(top: 10, right: 8, left: 8),
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
              color: Colors.white,
              size: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 2),
            child: TextButton(
              onPressed: () => null,
              child: Text(
                time.time,
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
