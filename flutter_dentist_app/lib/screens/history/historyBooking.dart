import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dentist_app/api/http_service_booking.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/model/Booking.dart';
import 'package:flutter_dentist_app/screens/history/detailHistoryBooked.dart';
import 'package:flutter_dentist_app/screens/rate/rate.dart';
import 'package:intl/intl.dart';

class HistoryBooking extends StatefulWidget {
  const HistoryBooking({Key? key}) : super(key: key);

  @override
  State<HistoryBooking> createState() => _HistoryBookingState();
}

class _HistoryBookingState extends State<HistoryBooking> {
  List<Booking> listBooking = [];
  @override
  void initState() {
    super.initState();

    HttpServiceBooking().getAllBookingByUsername(cart.user.username).then(
          (value) => setState(
            () {
              listBooking = value;
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Lịch sử đặt lịch',
            style: TextStyle(
              color: Colors.cyan[600],
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 12, right: 170),
                  child: Text(
                    'Nha khoa đang đặt',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, right: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20),
                        color: Color(0x14000000),
                        // color: Colors.amber,
                        blurRadius: 15,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: listBooking
                        .where((element) {
                          DateTime dayAppointment = new DateFormat('dd-MM-yyyy')
                              .parse(element.dateAppointment);

                          if (dayAppointment.day == DateTime.now().day) {
                            return element.hour > DateTime.now().hour &&
                                element.status;
                          }

                          return dayAppointment.isAfter(DateTime.now()) &&
                              element.status;
                        })
                        .map((b) => HistoryCartBooking(booking: b))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.green,
                  thickness: 1,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 12, right: 200),
                  child: Text(
                    'Nha khoa đã đặt',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, right: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20),
                        color: Color(0x14000000),
                        // color: Colors.amber,
                        blurRadius: 15,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: listBooking
                        .where((element) {
                          DateTime dayAppointment = new DateFormat('dd-MM-yyyy')
                              .parse(element.dateAppointment);
                          return dayAppointment.isBefore(DateTime.now()) &&
                              element.hour <= DateTime.now().hour;
                        })
                        .map((b) => HistoryCartBooked(booking: b))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.red,
                  thickness: 1,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 12, right: 200),
                  child: Text(
                    'Nha khoa đã hủy',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 13, right: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20),
                        color: Color(0x14000000),
                        // color: Colors.amber,
                        blurRadius: 15,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: listBooking
                        .where((element) {
                          return !element.status;
                        })
                        .map((b) => HistoryCartCancel(booking: b))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCartBooking extends StatelessWidget {
  final Booking booking;
  const HistoryCartBooking({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 8, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.clinic['name'],
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${booking.clinic['rating']}⭐',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 26,
                color: Colors.red,
              ),
              Flexible(
                child: Text(
                  '${booking.clinic['address']} - (${booking.clinic['distance']}km)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 12, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 26,
                    color: Colors.yellow[600],
                  ),
                  Text(
                    ' ${booking.dateAppointment}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse_sharp,
                    size: 26,
                    color: Colors.green[600],
                  ),
                  Text(
                    ' ${booking.timeAppointment}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...booking.services.map((s) => ServiceBookingCart(service: s)).toList(),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          child: Divider(
            color: Colors.black38,
            height: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${booking.services.fold(0, (previousValue, service) => service['quantity'] + previousValue)} dịch vụ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Tổng tiền: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '💲${booking.services.fold(0, (previousValue, service) => (service['price'] * service['quantity'] * (1 - service['discount'] / 100)) + previousValue)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 12),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHistoryBooked(booking: booking),
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Chi tiết',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HistoryCartBooked extends StatelessWidget {
  final Booking booking;
  const HistoryCartBooked({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 8, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.clinic['name'],
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${booking.clinic['rating']}⭐',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 26,
                color: Colors.red,
              ),
              Flexible(
                child: Text(
                  '${booking.clinic['address']} - (${booking.clinic['distance']}km)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 12, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 26,
                    color: Colors.yellow[600],
                  ),
                  Text(
                    booking.dateAppointment,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse_sharp,
                    size: 26,
                    color: Colors.green[600],
                  ),
                  Text(
                    booking.timeAppointment,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...booking.services.map((s) => ServiceBookingCart(service: s)).toList(),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          child: Divider(
            color: Colors.black38,
            height: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${booking.services.length} dịch vụ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Tổng tiền: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '💲${booking.services.fold(0, (previousValue, service) => (service['price'] * service['quantity'] * (1 - service['discount'] / 100)) + previousValue)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 170,
                child: ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Đặt lại',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 170,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RateScreen(),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Đánh giá',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryCartCancel extends StatelessWidget {
  final Booking booking;
  const HistoryCartCancel({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 8, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.clinic['name'],
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${booking.clinic['rating']}⭐',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 26,
                color: Colors.red,
              ),
              Flexible(
                child: Text(
                  '${booking.clinic['address']} - (${booking.clinic['distance']}km)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 12, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 26,
                    color: Colors.yellow[600],
                  ),
                  Text(
                    booking.dateAppointment,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.timelapse_sharp,
                    size: 26,
                    color: Colors.green[600],
                  ),
                  Text(
                    booking.timeAppointment,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...booking.services.map((s) => ServiceBookingCart(service: s)).toList(),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          child: Divider(
            color: Colors.black38,
            height: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${booking.services.length} dịch vụ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Tổng tiền: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '💲${booking.services.fold(0, (previousValue, service) => (service['price'] * service['quantity'] * (1 - service['discount'] / 100)) + previousValue)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 12),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () => {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Đặt lại',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceBookingCart extends StatelessWidget {
  final dynamic service;
  const ServiceBookingCart({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${service['name']} (x${service['quantity']})',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                '💲${service['price']}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black,
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.arrow_right,
                size: 30,
              ),
              Text(
                '💲${service['price'] * (1 - service['discount'] / 100)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
