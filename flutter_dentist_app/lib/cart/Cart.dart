class Cart {
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
    this.cartService.add(service);
  }

  void changeCartItem(String idClinic, dynamic service) {
    this.idClinic = idClinic;
    this.cartService.clear();
    this.cartService.add(service);
  }

  // void removeToCart(dynamic removeService) {
  //   this.cartService.removeWhere((service) => service == removeService);
  // }

  void removeAllItem() {
    this.cartService.clear();
  }
}

Cart cart = new Cart();
