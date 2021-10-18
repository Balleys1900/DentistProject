import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/screens/finalPage/cancel_Booking.dart';
import 'package:flutter_dentist_app/screens/history/historyBooking.dart';

class CancelHistoryService extends StatefulWidget {
  CancelHistoryService({Key? key}) : super(key: key);

  @override
  _CancelHistoryServiceState createState() => _CancelHistoryServiceState();
}

class _CancelHistoryServiceState extends State<CancelHistoryService> {
  Map<String, bool> values = {
    'Tôi có việc đột xuất': false,
    'Tôi tìm được nha khoa tốt hơn': false,
    'Tôi muốn dời lịch đặt': false,
    'Tôi không muốn đặt lịch nữa': false,
    'Lí do khác': false,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Lí do hủy đặt',
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13, right: 13, top: 30),
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
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: values.keys.map((String key) {
                            return new CheckboxListTile(
                              title: new Text(key),
                              value: values[key],
                              onChanged: (bool? value) {
                                setState(() {
                                  values[key] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Nhập lý do khác...'),
                            minLines:
                                6, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistoryBooking(),
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
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CancelBooking(),
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
                              'Xác nhận',
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
          ],
        ),
      ),
    );
  }
}
