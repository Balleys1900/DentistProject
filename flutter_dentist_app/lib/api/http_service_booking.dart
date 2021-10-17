import 'dart:convert';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:http/http.dart';

class HttpServiceBooking {
  Future<bool> createNewBooking(
    String userId,
    dynamic clinic,
    List<dynamic> services,
    String dateRequest,
    String timeAppointment,
    String dateAppointment,
  ) async {
    Map data = {
      'userId': userId,
      'clinic': clinic,
      'services': services,
      'dateRequest': dateRequest,
      'timeAppointment': timeAppointment,
      'dateAppointment': dateAppointment,
      'status': true,
      'message': 'Đặt lịch thành công',
    };
    Response res = await post(
      Uri.parse("http://10.0.2.2:3000/api/v1/order"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    Map<String, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 201) {
      dynamic body = result["data"];
      print(body);
      return true;
    }
    return false;
  }

  Future<List<String>> getTimeAvailable(
    String date,
  ) async {
    Response res = await get(
      Uri.parse("http://10.0.2.2:3000/api/v1/order/time/${date}"),
    );
    Map<String, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      dynamic body = result["data"];
      List<String> timeAvailable = body.cast<String>();
      print(timeAvailable);
      return timeAvailable;
    }
    return [];
  }
}
