import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/screens/history/historyBooking.dart';
import 'package:flutter_dentist_app/screens/main/home/main_menu.dart';
import 'package:flutter_dentist_app/screens/main/home/main_service_location.dart';
import 'package:flutter_dentist_app/screens/main/home/main_service_promotion.dart';
import 'package:flutter_dentist_app/screens/main/home/main_service_rating.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MainScreen(clinics: listClinicsInstance, services: listServiceInstance),
    Text(
      'Index 1: Business',
    ),
    HistoryBooking(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<Clinic> clinics;
  final List<Service> services;
  const MainScreen({
    Key? key,
    required this.clinics,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
