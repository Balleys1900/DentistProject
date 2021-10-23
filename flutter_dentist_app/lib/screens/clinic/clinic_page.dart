import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/clinic/screens/item_card_clinic.dart';
import 'package:flutter_dentist_app/screens/service/service_detail.dart';

class ClinicPage extends StatelessWidget {
  final Clinic clinic;
  const ClinicPage({
    Key? key,
    required this.clinic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(clinic.name),
          leading: IconButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Image(
                image: AssetImage(clinic.image),
                width: MediaQuery.of(context).size.width,
                height: 230,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            size: 20,
                            color: Colors.red,
                          ),
                          Flexible(
                            child: Text(
                              clinic.address,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${clinic.rating}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 25,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    // Spacer(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Text(clinic.description),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Các dịch vụ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Tư vấn Riêng'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: clinic.services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) => CardClinic(
                      clinic: clinic,
                      service: clinic.services[index],
                      press: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceDetail(
                              clinic: clinic,
                              service: clinic.services[index],
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
