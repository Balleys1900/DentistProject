import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/screens/item_cart.dart';

// ignore: must_be_immutable
class PageBookingItem extends StatefulWidget {
  Cart cart;
  PageBookingItem({Key? key, required this.cart}) : super(key: key);

  @override
  State<PageBookingItem> createState() => _PageBookingItem();
}

class _PageBookingItem extends State<PageBookingItem> {
  @override
  Widget build(BuildContext context) {
    // print(widget.itemService.name);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(context, widget.cart),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount: widget.cart.cartService.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
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
                      child: ItemCardCart(
                        service: widget.cart.cartService[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutCard(),
      ),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

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
            // color: Color(0xFFDADADA).withOpacity(0.15),
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
                    onPressed: () {},
                    child: Text('Thêm mã giảm giá'),
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
                        text: "\$1000",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Make an Appointment'),
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
