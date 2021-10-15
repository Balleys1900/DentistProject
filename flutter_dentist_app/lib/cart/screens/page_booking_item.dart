import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/screens/item_cart.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/clinic/clinic_page.dart';

// ignore: must_be_immutable
class PageBookingItem extends StatefulWidget {
  Cart cart;
  Clinic clinic;
  double riceEachItem;
  PageBookingItem({
    Key? key,
    required this.cart,
    required this.clinic,
    required this.riceEachItem,
  }) : super(key: key);

  @override
  State<PageBookingItem> createState() => _PageBookingItem();
}

class _PageBookingItem extends State<PageBookingItem> {
  late double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    // print(widget.itemService.name);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context, widget.cart),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Center(
                child: Text(
                  widget.clinic.name,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: Divider(
                thickness: 1,
                color: Colors.black12,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount: widget.cart.cartService.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Dismissible(
                      key: Key(widget.cart.cartService[index]['id'].toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.remove_circle_outline,
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        widget.cart.cartService.removeAt(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              color: Color(0x14000000),
                              blurRadius: 15,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: ItemCardCart(
                          service: widget.cart.cartService[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutCard(
            clinic: widget.clinic,
            priceAll: (totalPrice += widget.riceEachItem)),
      ),
    );
  }
}

class CheckoutCard extends StatefulWidget {
  final Clinic clinic;
  final double priceAll;
  const CheckoutCard({
    Key? key,
    required this.clinic,
    required this.priceAll,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.document_scanner_rounded,
                    size: 30,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ClinicPage(clinic: widget.clinic),
                        ),
                      );
                    },
                    child: Text('Thêm dịch vụ'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Tổng tiền: \n",
                    children: [
                      TextSpan(
                        text: "${widget.priceAll}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Chọn thời gian'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

AppBar buildAppbar(BuildContext context, Cart cart) {
  return AppBar(
    title: Column(
      children: [
        Text(
          'Dịch vụ bạn chọn',
          style: TextStyle(
            color: Colors.cyan[600],
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          "${cart.cartService.length} services",
          style: TextStyle(
            color: Colors.black38,
            fontSize: 15,
          ),
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () => {
        Navigator.pop(context),
      },
      icon: Icon(
        Icons.arrow_back,
        size: 30,
        color: Colors.black,
      ),
    ),
  );
}
