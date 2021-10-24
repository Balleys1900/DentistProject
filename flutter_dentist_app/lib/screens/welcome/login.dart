import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/api/http_service_clinic.dart';
import 'package:flutter_dentist_app/api/http_service_service.dart';
import 'package:flutter_dentist_app/api/http_service_user.dart';
import 'package:flutter_dentist_app/api/http_service_voucher.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/model/Voucher.dart';
import 'package:flutter_dentist_app/screens/main/main_widget.dart';
import 'package:flutter_dentist_app/screens/welcome/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '', password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/main_top.png"),
              width: size.width * 0.3,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset("assets/iconLogo.png"),
              width: size.width * 0.5,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/login_bottom.png"),
              width: size.width * 0.3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Color(0XFF2661FA)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(labelText: "Tài khoản"),
                    onChanged: (val) => setState(() {
                      username = val;
                    }),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Mật khẩu"),
                    onChanged: (val) => setState(() {
                      password = val;
                    }),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Quên mật khẩu?",
                    style: TextStyle(fontSize: 14, color: Color(0XFF2661FA)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: MaterialButton(
                    minWidth: size.width * 0.5,
                    height: 50,
                    color: Color(0XFF2661FA),
                    onPressed: () {
                      HttpServiceUser()
                          .login(username, password)
                          .then(
                            (value) async => {
                              cart.user = value,
                              Fluttertoast.showToast(
                                msg: 'Đăng nhập thành công',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              ),
                              listClinicsInstance =
                                  await HttpServiceClinic().getClinics(),
                              listServiceInstance =
                                  await HttpServiceListService().getServices(),
                              listVoucher =
                                  await HttpServiceVoucher().getVoucher(),
                              if (listVoucher.length > 0)
                                {
                                  listVoucher.forEach((voucher) {
                                    if (voucher.time.length == 10) {
                                      listClinicsInstance.forEach((clinic) {
                                        if (clinic.id == voucher.clinic)
                                          clinic.voucher = voucher;
                                      });
                                    } else {
                                      listClinicsInstance.forEach((clinic) {
                                        if (clinic.id == voucher.clinic)
                                          clinic.voucherTime = voucher;
                                      });
                                    }
                                  })
                                },
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainWidget(),
                                ),
                                (route) => false,
                              ),
                            },
                          )
                          .catchError(
                            // ignore: invalid_return_type_for_catch_error
                            (e) => {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode()),
                              Fluttertoast.showToast(
                                msg: "Tài khoản hoặc mật khẩu không đúng",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red.shade800,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              ),
                            },
                          );
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      )
                    },
                    child: Text(
                      "Bạn chưa có tài khoản, đăng kí ngay!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF2661FA)),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
