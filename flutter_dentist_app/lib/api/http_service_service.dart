import 'dart:convert';

import 'package:flutter_dentist_app/model/Service.dart';
import 'package:http/http.dart';

class HttpServiceListService {
  final String url = "http://10.0.2.2:3000/api/v1/services";
  Future<List<Service>> getServices() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<dynamic> body = result["data"];
      List<Service> services =
          body.map((dynamic item) => Service.fromJson(item)).toList();
      return services;
    } else {
      throw "Cannot get Services";
    }
  }

  
}
