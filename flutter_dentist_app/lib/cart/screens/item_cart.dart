import 'package:flutter/material.dart';

class ItemCardCart extends StatelessWidget {
  final dynamic service;
  final VoidCallback deleteItem;

  const ItemCardCart({
    Key? key,
    required this.service,
    required this.deleteItem,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              service['image'],
              fit: BoxFit.cover,
              height: 100,
              width: 140,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 175,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${service["name"]} ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        'x ${service["quantity"]}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => deleteItem(),
                    icon: Icon(Icons.close),
                    color: Colors.red,
                  ),
                ],
              ),
              Row(
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
              // Text(
              //   'SL: ${quantity}',
              //   style: TextStyle(
              //     fontSize: 18,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
