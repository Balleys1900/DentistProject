import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/screens/clinic/clinic_pages.dart';
import 'package:flutter_dentist_app/screens/promotion/promotion_widget.dart';
import 'package:flutter_dentist_app/screens/service/service_pages.dart';

class MainMenu extends StatelessWidget {
  final List<Clinic> clinics;
  final List<Service> services;
  const MainMenu({
    Key? key,
    required this.clinics,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Clinic> listClinic = [...clinics];
    listClinic.sort((a, b) => a.distance.compareTo(b.distance));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 2, bottom: 5, right: 10),
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
          child: Column(
            children: <Widget>[
              IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServicePages(services: services),
                    ),
                  )
                },
                icon: Image.asset(
                  'assets/menu/service.png',
                ),
                iconSize: 60,
              ),
              Text(
                'Dịch Vụ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 2, bottom: 5, right: 10),
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
          child: Column(
            children: <Widget>[
              IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClinicPages(
                        clinics: listClinic,
                      ),
                    ),
                  )
                },
                icon: Image.asset(
                  'assets/menu/clinic.png',
                ),
                iconSize: 60,
              ),
              Text(
                'Nha Khoa',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, top: 2, bottom: 5, right: 10),
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
          child: Column(
            children: <Widget>[
              IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PromoteWidget(),
                    ),
                  )
                },
                icon: Image.asset(
                  'assets/menu/voucher.png',
                ),
                iconSize: 60,
              ),
              Text(
                'Khuyến Mãi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }
}
