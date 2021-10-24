import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/service/service_detail.dart';

class CardService extends StatelessWidget {
  final Clinic clinic;
  final dynamic service;
  const CardService({
    Key? key,
    required this.clinic,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.87,
      margin: EdgeInsets.only(top: 10, left: 6, right: 6, bottom: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    bottomRight: Radius.circular(10),
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
                top: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    // bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                    child: Text(
                      '${clinic.rating}⭐',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              if (clinic.voucher != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    child: Container(
                      color: Colors.cyan[600],
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                      child: Text(
                        'Giảm giá ${clinic.voucher!.discount}%',
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
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service['name'],
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.redAccent,
                      size: 24,
                    ),
                    Text(
                      '${clinic.distance}km',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
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
            margin: EdgeInsets.only(left: 35, right: 35),
            child: Divider(
              color: Colors.black12,
              thickness: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                clinic.voucher != null
                    ? Container(
                        child: Row(children: <Widget>[
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
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      )
                    : Text(
                        '💲${service['price'].toStringAsFixed(0)}',
                        style: TextStyle(
                          decorationColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                OutlinedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetail(
                        clinic: clinic,
                        service: service,
                        // voucher: voucher,
                      ),
                    ),
                  ),
                  child: Text('Xem chi tiết'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
