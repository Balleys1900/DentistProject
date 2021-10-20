import 'dart:convert';

import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:http/http.dart';

class HttpServiceClinic {
  final String url = "http://10.0.2.2:3000/api/v1/clinics/active";
  Future<List<Clinic>> getClinics() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<dynamic> body = result["data"];
      List<Clinic> clinics =
          body.map((dynamic item) => Clinic.fromJson(item)).toList();
      return clinics;
    } else {
      throw "Cannot get Clinic";
    }
  }

  Future<List<Clinic>> getAllClinicByService(String serviceName) async {
    Response res = await get(Uri.parse(
        'http://10.0.2.2:3000/api/v1/clinics/service/${serviceName}'));

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<dynamic> body = result["data"];
      List<Clinic> services =
          body.map((dynamic item) => Clinic.fromJson(item)).toList();
      return services;
    } else {
      throw "Cannot get Services";
    }
  }
}
