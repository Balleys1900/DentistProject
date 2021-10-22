import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/InstanceTime.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:intl/intl.dart';

class PageCheckout extends StatelessWidget {
  final Clinic clinic;
  const PageCheckout({
    Key? key,
    required this.clinic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 5, right: 5),
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                color: Color(0x14000000),
                blurRadius: 15,
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  clinic.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                  ),
                  Text(
                    clinic.address,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.av_timer_rounded,
                    color: Colors.green,
                  ),
                  Text(
                    'Thời gian: ${instanceTime.timeSelect.time}',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.green,
                  ),
                  Text(
                    'Ngày: ${new DateFormat('dd-MM-yyyy').format(instanceTime.date)}',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 9, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Dịch vụ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...cart.cartService
                  .map(
                    (e) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${e['name']} ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'x${e['quantity']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money_rounded,
                                color: Colors.orange,
                              ),
                              Text(
                                '${(e['price'] * (1 - e['discount'] / 100)).toStringAsFixed(0)}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
              Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng tiền',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          color: Colors.orange,
                        ),
                        Text(
                          '${cart.sumTotalPrice().toStringAsFixed(1)}',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 12, left: 10),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(top: 5, bottom: 10),
        //             alignment: Alignment.topLeft,
        //             child: Text(
        //               'Hình thức thanh toán',
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //           OutlinedButton(
        //             onPressed: () {},
        //             child: Text(
        //               'Thêm phương thức',
        //               style: TextStyle(
        //                 color: Colors.orange,
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 10),
        //   margin: EdgeInsets.only(top: 8),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         offset: Offset(0, 10),
        //         color: Color(0x14000000),
        //         blurRadius: 15,
        //         spreadRadius: 0,
        //       )
        //     ],
        //   ),

        //   // child: Column(
        //   //   children: [
        //   //     Row(
        //   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   //       children: [
        //   //         Container(
        //   //           margin: EdgeInsets.only(left: 100),
        //   //           child: Text(
        //   //             'Thanh toán bằng tiền mặt',
        //   //             style: TextStyle(
        //   //               fontSize: 15,
        //   //               fontWeight: FontWeight.w500,
        //   //             ),
        //   //           ),
        //   //         ),
        //   //         Radio(
        //   //           value: 1,
        //   //           groupValue: valueRadio,
        //   //           onChanged: (value) {
        //   //             setState(() {
        //   //               valueRadio = 1;
        //   //             });
        //   //           },
        //   //         ),
        //   //       ],
        //   //     ),
        //   //   ],
        //   // ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 10, right: 10),
        //   margin: EdgeInsets.only(top: 8),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         offset: Offset(0, 10),
        //         color: Color(0x14000000),
        //         blurRadius: 15,
        //         spreadRadius: 0,
        //       )
        //     ],
        //   ),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Container(
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(10),
        //               child: Image.asset(
        //                 'assets/images/user/visa.png',
        //                 fit: BoxFit.cover,
        //                 height: 55,
        //                 width: 55,
        //               ),
        //             ),
        //           ),
        //           Text(
        //             '**** **** *123',
        //             style: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //           Radio(
        //             value: 2,
        //             groupValue: valueRadio,
        //             onChanged: (value) {
        //               setState(() {
        //                 valueRadio = 2;
        //               });
        //             },
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 10, top: 2, right: 10),
        //   margin: EdgeInsets.only(top: 8, bottom: 15),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         offset: Offset(0, 10),
        //         color: Color(0x14000000),
        //         blurRadius: 15,
        //         spreadRadius: 0,
        //       )
        //     ],
        //   ),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Container(
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(5),
        //               child: Image.asset(
        //                 'assets/images/user/mastercard.png',
        //                 fit: BoxFit.cover,
        //                 height: 40,
        //                 width: 55,
        //               ),
        //             ),
        //           ),
        //           Text(
        //             '**** **** *423',
        //             style: TextStyle(
        //               fontSize: 15,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //           Radio(
        //             value: 3,
        //             groupValue: valueRadio,
        //             onChanged: (value) {
        //               setState(() {
        //                 valueRadio = 3;
        //               });
        //             },
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
