import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/Steps.dart';
import 'package:flutter_dentist_app/cart/screens/item_cart.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/clinic/clinic_page.dart';

class PageBookingItem extends StatefulWidget {
  final Clinic clinic;
  PageBookingItem({
    Key? key,
    required this.clinic,
  }) : super(key: key);

  @override
  State<PageBookingItem> createState() => _PageBookingItem();
}

class _PageBookingItem extends State<PageBookingItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context, cart),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12, left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.clinic.name,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ClinicPage(clinic: widget.clinic),
                            ),
                          );
                        },
                        child: Text(
                          'Thêm dịch vụ',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ]),
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
                  itemCount: cart.cartService.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Dismissible(
                      key: UniqueKey(),
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
                        setState(() {
                          cart.cartService.removeAt(index);
                          if (cart.cartService.length == 0) cart.resetCart();
                        });
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
                          service: cart.cartService[index],
                          clinic: widget.clinic,
                          deleteItem: () => setState(
                            () {
                              cart.cartService.removeAt(index);
                              if (cart.cartService.length == 0)
                                cart.resetCart();
                            },
                          ),
                          increaseQuantity: () => setState(
                            () {
                              cart.cartService[index]['quantity'] += 1;
                            },
                          ),
                          decreaseQuantity: () => setState(
                            () {
                              if (cart.cartService[index]['quantity'] == 1)
                                return null;
                              cart.cartService[index]['quantity'] -= 1;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 90,
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
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Tổng tiền: \n",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  "💲${cart.sumTotalPrice().toStringAsFixed(0)}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: cart.cartService.length != 0
                              ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StepProgress(
                                        clinic: widget.clinic,
                                      ),
                                    ),
                                  )
                              : null,
                          child: cart.cartService.length != 0
                              ? Text(
                                  'Chọn thời gian',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  'Vui lòng chọn dịch vụ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
          "${cart.cartService.length} dịch vụ",
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
