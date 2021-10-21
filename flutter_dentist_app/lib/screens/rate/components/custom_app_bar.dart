import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/screens/history/historyBooking.dart';
import 'package:flutter_dentist_app/screens/rate/components/rounded_button.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton(
          icon: Icon(Icons.arrow_back),
          iconColor: kPrimaryColor,
          bgColor: Colors.white,
          tap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoryBooking(),
            ),
          ),
        ),
        SizedBox(width: kDefaultPadding),
        Text(
          'Bạn đã hoàn thành dịch vụ này!',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
        )
      ],
    );
  }
}
