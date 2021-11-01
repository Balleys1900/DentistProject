import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/main/screens/card_service.dart';

class MainServiceRating extends StatelessWidget {
  final List<Clinic> clinics;

  const MainServiceRating({
    Key? key,
    required this.clinics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Clinic> listClinic = [...clinics];
    listClinic.sort((a, b) => b.rating.compareTo(a.rating));
    listClinic = listClinic.sublist(0, 4);

    Random random = new Random();
    int randomNumber = random.nextInt(listClinic[0].services.length - 1);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Đánh giá cao nhất',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text(
                  'Xem thêm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 380,

          // margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...listClinic
                  .map((clinic) => new CardService(
                      clinic: clinic, service: clinic.services[randomNumber]))
                  .toList()
            ],
          ),
        ),
        // Divider(),
      ],
    );
  }
}
