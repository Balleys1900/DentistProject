import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';

class ItemCardCart extends StatelessWidget {
  final dynamic service;
  final Clinic clinic;
  final VoidCallback deleteItem;
  final VoidCallback increaseQuantity;
  final VoidCallback decreaseQuantity;
  const ItemCardCart({
    Key? key,
    required this.service,
    required this.clinic,
    required this.deleteItem,
    required this.increaseQuantity,
    required this.decreaseQuantity,
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
              height: 120,
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
              clinic.voucher != null
                  ? Row(
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
                          '💲${(service["price"] * (1 - clinic.voucher!.discount / 100)).toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          '💲${service["price"]}',
                          style: TextStyle(
                            decorationColor: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 22.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () => decreaseQuantity(),
                      padding: EdgeInsets.only(top: 0),
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      '${service['quantity']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: 22.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () => increaseQuantity(),
                      padding: EdgeInsets.only(top: 0),
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
