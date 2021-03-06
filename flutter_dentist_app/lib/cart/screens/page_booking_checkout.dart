import 'dart:ui';

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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                    size: 28,
                  ),
                  Text(
                    ' ${clinic.address}',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.av_timer_rounded,
                    color: Colors.green,
                    size: 28,
                  ),
                  Text(
                    ' Th???i gian: ${instanceTime.timeSelect.time}',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.yellow[600],
                    size: 28,
                  ),
                  Text(
                    ' Ng??y: ${new DateFormat('dd-MM-yyyy').format(instanceTime.date)}',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              clinic.voucher != null || clinic.voucherTime != null
                  ? Container(
                      margin: EdgeInsets.only(top: 15),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Khuy???n m??i',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          clinic.voucher != null
                              ? Row(
                                  children: [
                                    Icon(Icons.check_circle_rounded,
                                        color: Colors.green),
                                    Text('  ${clinic.voucher!.name}',
                                        style: TextStyle(fontSize: 16)),
                                    Text(
                                      '  (-${clinic.voucher!.discount}%)',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 2,
                                ),
                          clinic.voucherTime == null
                              ? SizedBox(
                                  height: 2,
                                )
                              : clinic.voucherTime!.time.contains(instanceTime
                                      .timeSelect.time
                                      .split(' ')[0])
                                  ? Row(
                                      children: [
                                        Icon(Icons.check_circle_rounded,
                                            color: Colors.green),
                                        Text('  ${clinic.voucherTime!.name}',
                                            style: TextStyle(fontSize: 16)),
                                        Text(
                                          '  (-${clinic.voucherTime!.discount}%)',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Icon(Icons.close,
                                            color: Colors.redAccent),
                                        Text('  ${clinic.voucherTime!.name}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                            )),
                                        Text(
                                          '  (-${clinic.voucherTime!.discount}%)',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 9, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Kh??ng khuy???n m??i',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'D???ch v???',
                  style: TextStyle(
                    fontSize: 20,
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
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'x${e['quantity']}',
                                style: TextStyle(
                                  fontSize: 17,
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
                                clinic.voucher != null
                                    ? '${(e['price'] * (1 - clinic.voucher!.discount / 100)).toStringAsFixed(0)}'
                                    : '${e['price']}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
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
                    Row(
                      children: [
                        Text(
                          'T???ng ti???n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          clinic.voucher == null &&
                                  clinic.voucherTime == null //c??? 2 b???ng null
                              ? '' // empty v???i c??? 2 b???ng null
                              : clinic.voucher != null // n???u voucher full c??
                                  ? clinic.voucherTime !=
                                              null && // check ti???p n???u th??m voucher hot c??
                                          clinic.voucherTime!.time.contains(
                                              instanceTime.timeSelect.time
                                                  .split(' ')[0])
                                      ? ' (???? gi???m(${clinic.voucher!.discount + clinic.voucherTime!.discount}%))' // -> t???ng 2 em tr??n
                                      : ' (???? gi???m(${clinic.voucher!.discount}%))' // ri??ng voucher full c??
                                  : // n???u voucher full kh??ng c?? v?? voucher hot c??
                                  clinic.voucherTime!.time.contains(instanceTime
                                          .timeSelect.time
                                          .split(' ')[0])
                                      ? ' (???? gi???m(${clinic.voucherTime!.discount}%))' // gi???m m???i em voucher
                                      : '', // empty v?? c?? voucher hot nh??ng user kh??ng ch???n
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
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
                        clinic.voucherTime == null
                            ? Text(
                                '${cart.sumTotalPrice().toStringAsFixed(1)}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                ),
                              )
                            : clinic.voucherTime!.time.contains(
                                    instanceTime.timeSelect.time.split(' ')[0])
                                ? Text(
                                    '${(cart.sumTotalPrice() * (1 - clinic.voucherTime!.discount / 100)).toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                                  )
                                : Text(
                                    '${cart.sumTotalPrice().toStringAsFixed(1)}',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                    ),
                                  )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
