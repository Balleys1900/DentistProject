import 'package:flutter_dentist_app/model/Voucher.dart';

class Clinic {
  final String id;
  final String name;
  final String image;
  final String timeOpen;
  final String timeClose;
  final String description;
  final num distance;
  final num rating;
  final String address;
  final List<dynamic> services;
  late Voucher? voucher = null;
  Clinic({
    required this.id,
    required this.name,
    required this.image,
    required this.timeOpen,
    required this.timeClose,
    required this.description,
    required this.distance,
    required this.rating,
    required this.address,
    required this.services,
  });

  factory Clinic.fromJson(Map<dynamic, dynamic> json) {
    return Clinic(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      timeOpen: json['timeOpen'],
      timeClose: json['timeClose'],
      description: json['description'],
      distance: json['distance'],
      rating: json['rating'],
      address: json['address'],
      services: json['services'],
    );
  }
}

List<Clinic> listClinicsInstance = [];
