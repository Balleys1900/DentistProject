import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/main/screens/card_service.dart';

class MainServiceLocation extends StatelessWidget {
  final List<Clinic> clinics;
  const MainServiceLocation({
    Key? key,
    required this.clinics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Clinic> listClinic = [...clinics];
    // listClinic.sort((a, b) => a.distance.compareTo(b.distance));
    // listClinic = listClinic.sublist(0, 4);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Nha Khoa gần đây',
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
                        clinic: clinic,
                        service: clinic.services[0],
                      ))
                  .toList()
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
