import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/screens/finalPage/cancel_Booking.dart';
import 'package:flutter_dentist_app/screens/history/historyBooking.dart';

class CancelHistoryService extends StatefulWidget {
  CancelHistoryService({Key? key}) : super(key: key);

  @override
  _CancelHistoryServiceState createState() => _CancelHistoryServiceState();
}

class _CancelHistoryServiceState extends State<CancelHistoryService> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefourth = false;

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
        body: ListView(scrollDirection: Axis.vertical, children: [
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
                    padding: new EdgeInsets.all(22.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Tôi có việc đột xuất',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          value: this.valuefirst,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuefirst = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: const Text(
                            'Tôi tìm được nha khoa tốt hơn',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          value: this.valuesecond,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuesecond = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Tôi muốn dời lịch đặt',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          value: this.valuethird,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuethird = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text(
                            'Tôi không muốn đặt nữa',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          value: this.valuefourth,
                          onChanged: (bool? value) {
                            setState(() {
                              this.valuefourth = value!;
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 220, top: 15),
                          child: Text(
                            'Lí do khác',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextFormField(
                          minLines:
                              2, // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
