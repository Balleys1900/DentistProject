import 'package:flutter/material.dart';

class CardClinic extends StatelessWidget {
  final dynamic service;
  final VoidCallback press;
  const CardClinic({
    Key? key,
    required this.service,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    service['image'],
                    fit: BoxFit.cover,
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.43,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: Colors.redAccent,
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                      child: Text(
                        '-${service['discount']}%',
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
            Text(
              service['name'],
              style: TextStyle(
                color: Color(0xFF535353),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  '💲${service['price'].toStringAsFixed(0)}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black,
                    color: Colors.grey[600],
                    fontSize: 17,
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  size: 30,
                ),
                Text(
                  '💲${(service['price'] * (1 - service['discount'] / 100)).toStringAsFixed(0)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
