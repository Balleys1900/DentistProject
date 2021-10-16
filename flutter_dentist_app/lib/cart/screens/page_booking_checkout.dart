import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PageCheckout extends StatefulWidget {
  const PageCheckout({Key? key}) : super(key: key);

  @override
  State<PageCheckout> createState() => _PageCheckoutState();
}

class _PageCheckoutState extends State<PageCheckout> {
  int valueRadio = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
                margin: EdgeInsets.only(top: 9, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Dịch vụ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/clinic/nhakhoa-3.jpg',
                        fit: BoxFit.cover,
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Nha khoa Ánh Sáng',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Làm trắng răng',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          '67 Phan Lũy, Quận 9, Tp.HCM',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '2h30 PM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'October 21st, 2021',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          color: Colors.orange,
                        ),
                        Text(
                          '2500',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          color: Colors.orange,
                        ),
                        Text(
                          '2500',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12, left: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hình thức thanh toán',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Thêm phương thức',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 10),
          margin: EdgeInsets.only(top: 8),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child: Text(
                      'Thanh toán bằng tiền mặt',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: valueRadio,
                    onChanged: (value) {
                      setState(() {
                        valueRadio = 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(top: 8),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/user/visa.png',
                        fit: BoxFit.cover,
                        height: 55,
                        width: 55,
                      ),
                    ),
                  ),
                  Text(
                    '**** **** *123',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: valueRadio,
                    onChanged: (value) {
                      setState(() {
                        valueRadio = 2;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 2, right: 10),
          margin: EdgeInsets.only(top: 8, bottom: 15),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/user/mastercard.png',
                        fit: BoxFit.cover,
                        height: 40,
                        width: 55,
                      ),
                    ),
                  ),
                  Text(
                    '**** **** *423',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Radio(
                    value: 3,
                    groupValue: valueRadio,
                    onChanged: (value) {
                      setState(() {
                        valueRadio = 3;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
