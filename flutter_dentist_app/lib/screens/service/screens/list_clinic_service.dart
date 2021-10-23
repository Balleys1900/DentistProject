import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Service.dart';
import 'package:flutter_dentist_app/screens/service/service_detail.dart';

class ListClinicFromService extends StatelessWidget {
  final Service service;
  final List<Clinic> clinics;
  const ListClinicFromService({
    Key? key,
    required this.service,
    required this.clinics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            service.name,
            style: TextStyle(
              color: Colors.cyan[600],
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
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
        ),
        body: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
          child: Column(
            children: [
              Expanded(
                child: new ListView.separated(
                  itemCount: clinics.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) => ListClinic(
                    clinic: clinics[index],
                    service: clinics[index].services.firstWhere(
                        (element) => element['name'] == service.name),
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

class ListClinic extends StatelessWidget {
  final Clinic clinic;
  final dynamic service;
  const ListClinic({
    Key? key,
    required this.clinic,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetail(
                    clinic: clinic,
                    service: service,
                  ),
                ),
              )
            },
            splashColor: Colors.brown.withOpacity(0.5),
            child: Ink(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(clinic.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  clinic.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 25,
                      color: Colors.red,
                    ),
                    Text(
                      '${clinic.distance}km',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                Expanded(
                  child: Text(
                    '${clinic.address}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                clinic.voucher != null
                    ? Row(
                        children: [
                          Text(
                            '💲${service['price'].toStringAsFixed(0)}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black,
                              color: Colors.grey[600],
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 30,
                          ),
                          Text(
                            '💲${(service['price'] * (1 - clinic.voucher!.discount / 100)).toStringAsFixed(0)}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(-${clinic.voucher!.discount}%)',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Text(
                            '💲${service['price']}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetail(
                            clinic: clinic,
                            service: service,
                          ),
                        ),
                      )
                    },
                    child: Text('Xem thông tin'),
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
