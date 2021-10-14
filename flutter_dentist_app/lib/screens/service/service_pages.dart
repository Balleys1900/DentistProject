import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/api/http_service_clinic.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/screens/service/screens/item_card_service.dart';
import 'package:flutter_dentist_app/screens/service/screens/list_clinic_service.dart';

class ServicePages extends StatelessWidget {
  final List<Service> services;

  const ServicePages({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dịch vụ',
            style: TextStyle(
              color: Colors.cyan[600],
              fontWeight: FontWeight.bold,
              fontSize: 25,
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
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: GridView.builder(
                    // itemCount: services.length,
                    itemCount: services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      // crossAxisSpacing: 5,
                      // childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) => ItemCardService(
                      service: services[index],
                      press: () => {
                        HttpServiceClinic()
                            .getAllClinicByService(services[index].name)
                            .then(
                              (clinics) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListClinicFromService(
                                    service: services[index],
                                    clinics: clinics,
                                  ),
                                ),
                              ),
                            )
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
