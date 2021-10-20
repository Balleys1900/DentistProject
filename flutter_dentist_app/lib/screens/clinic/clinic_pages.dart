import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/Screens/clinic/clinic_page.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
// import 'package:flutter_dentist_app/Screens/clinic/clinicNearBy.dart';

class ClinicPages extends StatelessWidget {
  final List<Clinic> clinics;
  const ClinicPages({
    Key? key,
    required this.clinics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Nha khoa',
            style: TextStyle(
              color: Colors.cyan[600],
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              PreferredSize(
                preferredSize: Size(0, 150),
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  padding: EdgeInsets.only(top: 1, bottom: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
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
                                hintText: 'Tìm phòng khám',
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
              Expanded(
                child: new ListView.builder(
                  itemCount: clinics.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListClinic(
                      clinic: clinics[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListClinic extends StatelessWidget {
  final Clinic clinic;
  const ListClinic({
    Key? key,
    required this.clinic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  clinic.image,
                  fit: BoxFit.cover,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                  child: Container(
                    color: Colors.cyan[600],
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                    child: Text(
                      clinic.name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    // topLeft: Radius.circular(10),
                  ),
                  child: Container(
                    color: Colors.cyan[600],
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                    child: Text(
                      '${clinic.rating}⭐',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    // topLeft: Radius.circular(10),
                  ),
                  child: Container(
                    color: Colors.cyan[600],
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                    child: Text(
                      '${clinic.distance}km',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 3),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_pin,
                  color: Colors.redAccent,
                ),
                Expanded(
                  child: Text(
                    clinic.address,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lock_clock,
                      color: Colors.green,
                    ),
                    Text(
                      '${clinic.timeOpen}AM - ${clinic.timeClose}PM',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, bottom: 5),
                  child: OutlinedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClinicPage(clinic: clinic),
                        ),
                      ),
                    },
                    child: Text('Thông tin chi tiết'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
