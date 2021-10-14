import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/screens/main/home/main_menu.dart';
import 'package:flutter_dentist_app/screens/main/home/main_service_location.dart';
import 'package:flutter_dentist_app/screens/main/home/main_service_promotion.dart';
import 'package:flutter_dentist_app/screens/main/home/main_service_rating.dart';

class MainWidget extends StatelessWidget {
  final List<Clinic> clinics;
  final List<Service> services;
  const MainWidget({
    Key? key,
    required this.clinics,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Xin Chào, Dann',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[600],
                      ),
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.cyan[600],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    Text(
                      ' Biên Hòa, Việt Nam',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                PreferredSize(
                  preferredSize: Size(0, 150),
                  child: Container(
                    margin: EdgeInsets.only(top: 2, bottom: 2),
                    padding: EdgeInsets.only(top: 1, bottom: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Material(
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.search, color: Colors.grey),
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Tìm dịch vụ',
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                MainMenu(
                  clinics: clinics,
                  services: services,
                ),
                MainServicePromotion(clinics: clinics),
                MainServiceLocation(clinics: clinics),
                MainServiceRating(clinics: clinics),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
