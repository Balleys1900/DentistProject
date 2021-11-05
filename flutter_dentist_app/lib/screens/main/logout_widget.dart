import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/model/Voucher.dart';
import 'package:flutter_dentist_app/screens/welcome/login.dart';

class LogoutPageWidget extends StatelessWidget {
  const LogoutPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(String title, String messageContent) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            content: Text(
              messageContent,
              style: TextStyle(),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Đồng ý'),
                onPressed: () {
                  listClinicsInstance = [];
                  listServiceInstance = [];
                  listVoucher = [];
                  cart.resetCart();
                  Navigator.of(context).pop();
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
              ),
              TextButton(
                child: Text('Hủy bỏ'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 210, left: 20, right: 20),
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
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.info_sharp,
                      size: 40,
                      color: Colors.cyan[600],
                    ),
                    Text(
                      "Thông tin cá nhân",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _showMyDialog("Đăng xuất",
                    "Danh sách dịch vụ bạn đã chọn sẽ bị xóa sau khi đăng xuất!!!");
              },
              child: new Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        size: 40,
                        color: Colors.red[600],
                      ),
                      Text(
                        "Đăng xuất",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
