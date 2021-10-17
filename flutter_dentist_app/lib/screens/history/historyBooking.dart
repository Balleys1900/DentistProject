import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HistoryBooking extends StatefulWidget {
  const HistoryBooking({Key? key}) : super(key: key);

  @override
  State<HistoryBooking> createState() => _HistoryBookingState();
}

class _HistoryBookingState extends State<HistoryBooking> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Danh sách lịch đã đặt',
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Nha khoa Mỹ Nha',
                                  style: TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  ' (3.0 km)',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Đang tiến hành',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 26,
                              color: Colors.red,
                            ),
                            Text(
                              '64 Phan Lũy, Quận 9, Tp.HCM',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 12),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 26,
                                  color: Colors.yellow[600],
                                ),
                                Text(
                                  ' 25/10/2021 - ',
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
                                  ' 2h30 PM',
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
                      Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/service/imageBocRangSu.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 140,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Bọc răng sứ  ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 26,
                                          color: Colors.yellow[600],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 120),
                                child: Row(
                                  children: [
                                    Text(
                                      '3000',
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
                                      '2000',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 12, bottom: 5, left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: rendeServiceBooked(context),
                      ),
                      RaisedButton(
                        child: Text('Xem thêm 2 dịch vụ / Thu gọn'),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3 dịch vụ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Thành tiền: 10000',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hoàn thành dịch vụ để đánh giá',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Chi tiết'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin:
                //       EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                //   child: Divider(
                //     color: Colors.black,
                //     height: 1,
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 12, right: 200),
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Nha khoa Sài Gòn',
                                  style: TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  ' (5.0 km)',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Đã hoàn thành',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 26,
                              color: Colors.red,
                            ),
                            Text(
                              '23 Lê Lai, Bắc Từ Liêm, Tp.HCM',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 12),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 26,
                                  color: Colors.yellow[600],
                                ),
                                Text(
                                  ' 13/10/2021 - ',
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
                                  ' 7h30 AM',
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
                      Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/service/ImageDinhDaLenRang.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 140,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "Đính đá  ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '4.8',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 26,
                                          color: Colors.yellow[600],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 120),
                                child: Row(
                                  children: [
                                    Text(
                                      '4000',
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
                                      '3400',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 12, bottom: 5, left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: rendeServiceBooked(context),
                      ),
                      RaisedButton(
                        child: Text('Xem thêm 3 dịch vụ / Thu gọn'),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3 dịch vụ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Thành tiền: 11000',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Đặt lại'),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Đánh giá'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container rendeServiceBooked(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/service/imageBocRangSu.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 140,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Bọc răng sứ  ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                '4.9',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                ),
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 26,
                                color: Colors.yellow[600],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 120),
                      child: Row(
                        children: [
                          Text(
                            '3000',
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
                            '2000',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 5, left: 20, right: 20),
            child: Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
          /////////////////////////////////////////
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/service/imageBocRangSu.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 140,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Bọc răng sứ  ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                '4.9',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                ),
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 26,
                                color: Colors.yellow[600],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 120),
                      child: Row(
                        children: [
                          Text(
                            '3000',
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
                            '2000',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
