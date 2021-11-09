import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/User.dart';

class Cart {
  late User? user;
  late Clinic? clinic = null;
  List<dynamic> cartService = [];

  bool isDifferentID(Clinic clinic) {
    if (this.clinic == null || this.clinic!.id == clinic.id) {
      this.clinic = clinic;
      return false;
    }
    return true;
  }

  bool isExistService(dynamic service) {
    return this.cartService.contains(service);
  }

  void addToCart(dynamic service) {
    if (isExistService(service)) {
      dynamic ser =
          this.cartService.firstWhere((e) => e['id'] == service['id']);
      ser['quantity'] += 1;
    } else {
      service['quantity'] = 1;
      this.cartService.add(service);
    }
  }

  void changeCartItem(Clinic clinic, dynamic service) {
    this.clinic = clinic;
    this.cartService.clear();
    addToCart(service);
  }

  void resetCart() {
    this.clinic = null;
    this.cartService.clear();
  }

  double sumTotalPrice() {
    if (this.clinic != null) {
      if (this.clinic!.voucher != null) {
        return this.cartService.fold(
                  0,
                  (initial, service) =>
                      (service['price'] * service['quantity']) + initial,
                ) *
            (1 - this.clinic!.voucher!.discount / 100);
      }
    }
    return this.cartService.fold(
          0,
          (initial, service) =>
              initial + (service['price'] * service['quantity']),
        );
  }
}

Cart cart = new Cart();
