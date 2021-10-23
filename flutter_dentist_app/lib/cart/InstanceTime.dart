import 'package:flutter_dentist_app/cart/Time.dart';

class InstanceTime {
  late DateTime date;
  late Time timeSelect;

  List<Time> listTime = [
    Time(ID: 1, time: '07:00 AM', status: 'default', hour: 7),
    Time(ID: 2, time: '08:00 AM', status: 'default', hour: 8),
    Time(ID: 3, time: '09:00 AM', status: 'default', hour: 9),
    Time(ID: 4, time: '10:00 AM', status: 'default', hour: 10),
    Time(ID: 5, time: '11:00 AM', status: 'default', hour: 11),
    Time(ID: 6, time: '13:00 PM', status: 'default', hour: 13),
    Time(ID: 7, time: '14:00 PM', status: 'default', hour: 14),
    Time(ID: 8, time: '15:00 PM', status: 'default', hour: 15),
    Time(ID: 9, time: '16:00 PM', status: 'default', hour: 16),
    Time(ID: 10, time: '17:00 PM', status: 'default', hour: 17),
  ];

  void changeStatusActive(int id) {
    listTime.forEach((element) {
      if (element.status == 'active') element.status = 'default';
    });
    listTime.firstWhere((element) => (element.ID == id)).status = 'active';
  }

  void changeStatusDefault(int id) {
    listTime.firstWhere((element) => (element.ID == id)).status = 'default';
  }

  void changeStatusDay(DateTime seletedDate) {
    this.date = seletedDate;
    if (seletedDate.day - DateTime.now().day == 0)
      listTime.forEach((time) {
        if (time.hour <= DateTime.now().hour) time.status = "inactive";
      });
    else
      listTime.forEach((time) => time.status = "default");
  }

  void changeAllStatusToDefault() {
    listTime.forEach((time) => time.status = 'default');
  }

  void changeStatusInactive(List<String> timeBooking) {
    if (timeBooking.length != 0)
      listTime.forEach((time) {
        if (timeBooking.contains(time.time)) time.status = "inactive";
      });
  }

  bool checkTimeIsSelect() {
    return !listTime.every((element) => element.status != 'active');
  }
}

InstanceTime instanceTime = InstanceTime(); //

