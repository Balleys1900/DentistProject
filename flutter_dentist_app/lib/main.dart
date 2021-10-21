import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/screens/welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      home: WelcomeScreen(),
    );
  }
}
