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
              clinic.voucher != null || clinic.voucherTime != null
                  ? Container(
                      margin: EdgeInsets.only(top: 9, bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Khuyến mãi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          clinic.voucher != null
                              ? Row(
                                  children: [
                                    Icon(Icons.done_outlined,
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
                          clinic.voucherTime != null &&
                                  clinic.voucherTime!.time.contains(instanceTime
                                      .timeSelect.time
                                      .split(' ')[0])
                              ? Row(
                                  children: [
                                    Icon(Icons.done_outlined,
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
                                    Icon(Icons.close, color: Colors.redAccent),
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
                        'Không khuyến mãi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                                clinic.voucher != null
                                    ? '${(e['price'] * (1 - clinic.voucher!.discount / 100)).toStringAsFixed(0)}'
                                    : '${e['price']}',
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
                    Row(
                      children: [
                        Text(
                          'Tổng tiền',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          clinic.voucher == null &&
                                  clinic.voucherTime == null //cả 2 bằng null
                              ? '' // empty với cả 2 bằng null
                              : clinic.voucher != null // nếu voucher full có
                                  ? clinic.voucherTime !=
                                              null && // check tiếp nếu thêm voucher hot có
                                          clinic.voucherTime!.time.contains(
                                              instanceTime.timeSelect.time
                                                  .split(' ')[0])
                                      ? '(đã giảm(${clinic.voucher!.discount + clinic.voucherTime!.discount}%))' // -> tổng 2 em trên
                                      : '(đã giảm(${clinic.voucher!.discount}%))' // riêng voucher full có
                                  : // nếu voucher full không có và voucher hot có
                                  clinic.voucherTime!.time.contains(instanceTime
                                          .timeSelect.time
                                          .split(' ')[0])
                                      ? '(đã giảm(${clinic.voucherTime!.discount}%))' // giảm mỗi em voucher
                                      : '', // empty vì có voucher hot nhưng user không chọn
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
                        clinic.voucherTime!.time.contains(
                                instanceTime.timeSelect.time.split(' ')[0])
                            ? Text(
                                '${(cart.sumTotalPrice() * (1 - clinic.voucherTime!.discount / 100)).toStringAsFixed(0)}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                '${cart.sumTotalPrice().toStringAsFixed(1)}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
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
