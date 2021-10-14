import 'package:flutter/material.dart';

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
          margin: EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              service['image'],
              fit: BoxFit.cover,
              height: 120,
              width: 120,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service['name'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            Text.rich(
              TextSpan(
                text: "\$${service['price']}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
