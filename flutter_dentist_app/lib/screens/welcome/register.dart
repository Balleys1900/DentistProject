import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/api/http_service_user.dart';
import 'package:flutter_dentist_app/screens/welcome/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '', name = '', password = '', address = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Register",
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
                        decoration: InputDecoration(labelText: "Tên đăng nhập"),
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
                        decoration: InputDecoration(labelText: "Họ và Tên"),
                        onChanged: (val) => setState(() {
                          name = val;
                        }),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(labelText: "Mật khẩu"),
                        onChanged: (val) => setState(() {
                          password = val;
                        }),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(labelText: "Địa chỉ"),
                        onChanged: (val) => setState(() {
                          address = val;
                        }),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: MaterialButton(
                          minWidth: size.width * 0.5,
                          height: 50,
                          color: Color(0XFF2661FA),
                          onPressed: () {
                            HttpServiceUser()
                                .register(username, password, name, address)
                                .then(
                                  (value) => {
                                    Fluttertoast.showToast(
                                      msg: 'Login Successful',
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    )
                                  },
                                )
                                .catchError(
                                  // ignore: invalid_return_type_for_catch_error
                                  (e) => {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode()),
                                    Fluttertoast.showToast(
                                      msg: e,
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
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0XFFFFFFFF),
                            ),
                          ),
                        )),
                    Container(
                      alignment: Alignment.centerRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()))
                        },
                        child: Text(
                          "Bạn đã có tài khoản, hãy đăng nhập",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF2661FA),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
