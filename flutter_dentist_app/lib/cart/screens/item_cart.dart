import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';

class ItemCardCart extends StatelessWidget {
  final dynamic service;

  const ItemCardCart({
    Key? key,
    required this.service,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // margin: EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              service['image'],
              fit: BoxFit.cover,
              height: 130,
              width: 130,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 60),
              child: Row(
                children: [
                  Text(
                    service['name'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '💲${service["price"].toStringAsFixed(0)}',
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
                  '💲${(service["price"] * (1 - service["discount"] / 100)).toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
