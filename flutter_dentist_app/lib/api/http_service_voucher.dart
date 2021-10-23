import 'dart:convert';

import 'package:flutter_dentist_app/model/Voucher.dart';
import 'package:http/http.dart';

class HttpServiceVoucher {
  final String url = "http://10.0.2.2:3000/api/v1/vouchers/active";
  Future<List<Voucher>> getVoucher() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      List<dynamic> body = result["data"];
      List<Voucher> vouchers =
          body.map((dynamic item) => Voucher.fromJson(item)).toList();
      print(vouchers);

      return vouchers;
    } else {
      throw "Cannot get Voucher";
    }
  }
}
