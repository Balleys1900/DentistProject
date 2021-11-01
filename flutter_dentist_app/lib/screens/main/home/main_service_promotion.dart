import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/main/screens/card_service.dart';

class MainServicePromotion extends StatelessWidget {
  final List<Clinic> clinics;
  const MainServicePromotion({
    Key? key,
    required this.clinics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Clinic> listClinic =
        [...clinics].where((e) => e.voucher != null).toList();
    if (listClinic.length >= 3)
      listClinic
          .sort((a, b) => b.voucher!.discount.compareTo(a.voucher!.discount));
    else
      listClinic = [...clinics];

    Random random = new Random();
    int randomNumber = random.nextInt(listClinic[0].services.length - 1);

    listClinic = listClinic.sublist(0, 4);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ưu đãi hấp dẫn',
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...listClinic
                  .map(
                    (clinic) => new CardService(
                      clinic: clinic,
                      service: clinic.services[randomNumber],
                    ),
                  )
                  .toList()
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
