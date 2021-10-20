import 'package:flutter_dentist_app/model/User.dart';

class Cart {
  late User user;
  String idClinic = '';
  List<dynamic> cartService = [];

  bool isDifferentID(String idClinic) {
    if (this.idClinic == '' || this.idClinic == idClinic) {
      this.idClinic = idClinic;
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
      print(ser);
    } else {
      service['quantity'] = 1;
      this.cartService.add(service);
      print(service);
    }
  }

  void changeCartItem(String idClinic, dynamic service) {
    this.idClinic = idClinic;
    this.cartService.clear();
    this.cartService.add(service);
  }

  void resetCart() {
    this.idClinic = '';
    this.cartService.clear();
  }

  double sumTotalPrice() {
    return this.cartService.fold(
          0,
          (initial, service) =>
              initial +
              (service['price'] *
                  service['quantity'] *
                  (1 - service['discount'] / 100)),
        );
  }
}

Cart cart = new Cart();
