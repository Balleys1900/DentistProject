import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Service.dart';

class ItemCardService extends StatelessWidget {
  final Service service;
  final VoidCallback press;
  const ItemCardService({
    Key? key,
    required this.press,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 28, right: 28),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: press,
                    icon: Image.asset(
                      service.image,
                    ),
                    iconSize: 100,
                  ),
                  Text(
                    service.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
