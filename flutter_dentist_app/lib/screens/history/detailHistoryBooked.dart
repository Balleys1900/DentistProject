import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Booking.dart';
import 'package:flutter_dentist_app/screens/history/cancelHistoryService.dart';
import 'package:flutter_dentist_app/screens/history/historyBooking.dart';

class DetailHistoryBooked extends StatelessWidget {
  final Booking booking;
  const DetailHistoryBooked({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Chi tiết lịch đặt',
            style: TextStyle(
              color: Colors.cyan[600],
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15, left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    color: Color(0x14000000),
                    blurRadius: 15,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        booking.clinic['name'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                    margin: EdgeInsets.all(10),
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
                  ...booking.services
                      .map((s) => ServiceBookingCart(service: s))
                      .toList(),
                  Divider(
                    thickness: 1,
                    color: Colors.black12,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng tiền: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          // '💲${booking.services.fold(0, (previousValue, service) => (service['price'] * service['quantity'] * (1 - service['discount'] / 100)) + previousValue).toStringAsFixed(1)}',
                          'Test',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Text(
                        'Quay lại',
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
                    width: 190,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CancelHistoryService(bookingId: booking.id),
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
                        'Hủy đặt',
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
        ),
      ),
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
                // '💲${service['price'] * (1 - service['discount'] / 100)}',
                'Test',
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
