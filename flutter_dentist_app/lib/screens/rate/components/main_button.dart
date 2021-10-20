import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/constants.dart';
import 'package:flutter_dentist_app/screens/main/main_widget.dart';
import 'package:flutter_dentist_app/screens/rate/components/rounded_button.dart';
import 'package:flutter_dentist_app/screens/rate/finalPageRating.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Xác nhận',
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(width: kDefaultPadding),
        RoundedButton(
          icon: Icon(Icons.arrow_forward),
          iconColor: Colors.white,
          bgColor: kPrimaryColor,
          tap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessRating(),
            ),
          ),
        ),
      ],
    );
  }
}
