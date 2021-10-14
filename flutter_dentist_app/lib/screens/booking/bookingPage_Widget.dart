import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPageWidget extends StatelessWidget {
  const BookingPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Đặt lịch',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 25, bottom: 30),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/clinic/nhakhoa-3.jpg',
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'Nha khoa Hoàn Mỹ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Dịch vụ: Làm trắng răng',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Giá: 💲5000',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Đánh giá: 4.9',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'OCT 2021',
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 90,
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    testDates("Mon", "4", true),
                    testDates("Tue", "5", false),
                    testDates("Wed", "6", false),
                    testDates("Thr", "7", false),
                    testDates("Fri", "8", false),
                    testDates("Sat", "9", false),
                    testDates("Sun", "10", false),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'Morning',
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.6,
                  children: [
                    clinicTiming("7:00 AM", true),
                    clinicTiming("7:30 AM", false),
                    clinicTiming("8:00 AM", false),
                    clinicTiming("8:30 AM", false),
                    clinicTiming("9:00 AM", false),
                    clinicTiming("9:30 AM", false),
                    clinicTiming("10:00 AM", false),
                    clinicTiming("10:30 AM", false),
                    clinicTiming("11:00 AM", false),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'Evening',
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.6,
                  children: [
                    // OutlinedButton(
                    //   onPressed: clinicTiming("13:00 PM", true),
                    //   child: Text(''),
                    // ),
                    clinicTiming("13:00 PM", true),
                    clinicTiming("13:30 PM", false),
                    clinicTiming("14:00 PM", false),
                    clinicTiming("14:30 PM", false),
                    clinicTiming("15:00 PM", false),
                    clinicTiming("15:30 PM", false),
                    clinicTiming("16:00 PM", false),
                    clinicTiming("16:30 PM", false),
                    clinicTiming("17:00 PM", false),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Đặt lịch',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  clinicTiming(String time, bool isSelected) {
    return isSelected
        ? Container(
            margin: EdgeInsets.only(left: 20, top: 10),
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
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 20, top: 10),
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
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
          );
  }

  testDates(String day, String date, bool isSelected) {
    return isSelected
        ? Container(
            width: 70,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.cyan[600],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(7),
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: 70,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(7),
                  child: Text(
                    date,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
