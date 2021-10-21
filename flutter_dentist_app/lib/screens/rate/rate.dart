import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/screens/rate/constants.dart';
import 'package:flutter_dentist_app/screens/rate/proportionate.dart';
import 'package:flutter_dentist_app/screens/rate/components/app_header.dart';
import 'package:flutter_dentist_app/screens/rate/components/main_button.dart';
import 'package:flutter_dentist_app/screens/rate/components/multiline_input.dart';
import 'package:flutter_dentist_app/screens/rate/components/ride_stat.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'components/custom_app_bar.dart';

class RateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              AppHeader(),
              Positioned(
                top: -380,
                left: -187,
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset('assets/bg.png'),
                ),
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(kDefaultPadding * 2),
                child: Column(
                  children: [
                    CustomAppBar(),
                    SizedBox(height: kDefaultPadding * 2),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10.0), //add border radius
                      child: Image.asset(
                        "assets/images/clinic/nhakhoa-2.jpg",
                        height: 180,
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      '',
                      style: TextStyle(color: kTextLightColor, fontSize: 14),
                    ),
                    Text(
                      'Các dịch vụ tại Nha Khoa Mỹ Nha',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Divider(
                      color: kTextLightColor,
                    ),
                    SizedBox(height: kDefaultPadding),
                    // RideStats(),
                    SizedBox(height: kDefaultPadding),
                    SizedBox(height: kDefaultPadding),
                    Text(
                      'Hãy cho chúng tôi biết cảm nhận của bạn!',
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      size: 45,
                      isReadOnly: false,
                      spacing: kDefaultPadding,
                    ),
                    SizedBox(height: kDefaultPadding),
                    MultilineInput(),
                    SizedBox(height: kDefaultPadding),
                    MainButton()
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
