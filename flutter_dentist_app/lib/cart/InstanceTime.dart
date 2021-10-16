import 'package:flutter_dentist_app/cart/Time.dart';

class InstanceTime {
  List<Time> listTime = [
    Time(ID: 1, time: '7:00 AM', status: 'inactive'), // asng
    Time(ID: 2, time: '8:00 AM', status: 'default'),
    Time(ID: 3, time: '9:00 AM', status: 'inactive'),
    Time(ID: 4, time: '10:00 AM', status: 'inactive'),
    Time(ID: 5, time: '11:00 AM', status: 'default'), // sang
    Time(ID: 6, time: '1:30 PM', status: 'inactive'),
    Time(ID: 7, time: '2:30 PM', status: 'default'),
    Time(ID: 8, time: '3:30 PM', status: 'default'),
    Time(ID: 9, time: '4:30 PM', status: 'default'),
    Time(ID: 10, time: '5:30 PM', status: 'default'),
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
}
