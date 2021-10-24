import 'dart:convert';
import 'package:flutter_dentist_app/model/Booking.dart';
import 'package:flutter_dentist_app/model/Voucher.dart';
import 'package:http/http.dart';

class HttpServiceBooking {
  Future<bool> createNewBooking(
    dynamic user,
    dynamic clinic,
    List<dynamic> services,
    String dateRequest,
    String timeAppointment,
    String dateAppointment,
    num hour,
    List<dynamic> vouchers,
  ) async {
    Map data = {
      'user': user,
      'clinic': clinic,
      'services': services,
      'dateRequest': dateRequest,
      'timeAppointment': timeAppointment,
      'dateAppointment': dateAppointment,
      'hour': hour,
      'vouchers': vouchers,
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
      return true;
    }
    return false;
  }

  Future<bool> cancelBookingByID(
    String id,
    String message,
  ) async {
    Map data = {
      'id': id,
      'message': message,
    };
    Response res = await put(
      Uri.parse("http://10.0.2.2:3000/api/v1/order"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    Map<String, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      dynamic body = result["data"];
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
      return timeAvailable;
    }
    return [];
  }

  Future<List<Booking>> getAllBookingByUsername(String username) async {
    Response res =
        await get(Uri.parse('http://10.0.2.2:3000/api/v1/order/${username}'));

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<dynamic> body = result["data"];
      List<Booking> bookings =
          body.map((dynamic item) => Booking.fromJson(item)).toList();

      return bookings;
    } else {
      throw "Cannot get Booking";
    }
  }
}
