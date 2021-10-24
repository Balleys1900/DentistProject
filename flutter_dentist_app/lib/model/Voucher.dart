import 'package:flutter_dentist_app/api/http_service_voucher.dart';

class Voucher {
  String id;
  String name;
  String clinic;
  num discount;
  List<dynamic> time;
  String description;
  String startDate;
  String expirationDate;
  bool isActive;
  Voucher({
    required this.id,
    required this.name,
    required this.clinic,
    required this.discount,
    required this.time,
    required this.description,
    required this.startDate,
    required this.expirationDate,
    required this.isActive,
  });
  factory Voucher.fromJson(Map<dynamic, dynamic> json) {
    return Voucher(
      id: json['_id'],
      name: json['name'],
      clinic: json['clinic'],
      discount: json['discount'],
      time: json['time'],
      description: json['description'],
      startDate: json['startDate'],
      expirationDate: json['expirationDate'],
      isActive: json['isActive'],
    );
  }
}

List<Voucher> listVoucher = [];
