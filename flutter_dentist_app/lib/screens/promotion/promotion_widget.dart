import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/model/Voucher.dart';

class PromoteWidget extends StatelessWidget {
  const PromoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Voucher Giảm Giá',
            style: TextStyle(
              color: Colors.cyan[600],
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
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
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Code',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.search_rounded,
                      size: 28,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20, top: 15, bottom: 18, right: 20),
                margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      color: Color(0x14000000),
                      blurRadius: 18,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.loyalty_outlined,
                          color: Color.fromRGBO(253, 65, 6, 1),
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'TEST123FF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan[600],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Voucher của bạn',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: new ListView.builder(
                  itemCount: vouchers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCardVoucher(voucher: vouchers[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCardVoucher extends StatelessWidget {
  final Voucher voucher;
  const ItemCardVoucher({
    Key? key,
    required this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/vouchers/voucherTicket.png',
              fit: BoxFit.fill,
              height: 140,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 52,
              left: 25,
              child: Text(
                '${voucher.discount}%',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 10,
              left: 145,
              child: Text(
                'Voucher',
                style: TextStyle(
                    fontSize: 25,
                    color: Color.fromRGBO(253, 65, 6, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 50,
              left: 130,
              child: Container(
                child: Text(
                  '${voucher.description}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Positioned(
            //   // The Positioned widget is used to position the text inside the Stack widget
            //   top: 60,
            //   left: 130,
            //   child: OutlinedButton(
            //     onPressed: () => {},
            //     child: Text(
            //       'Xem điều kiện',
            //       style: TextStyle(
            //         color: Color.fromRGBO(253, 65, 6, 1),
            //       ),
            //     ),
            //   ),
            // ),

            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 80,
              left: 115,
              child: Text(
                voucher.code,
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 15,
              left: 305,
              child: Text(
                'Hết hạn',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 50,
              left: 330,
              child: Text(
                voucher.expiredDay,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 80,
              left: 325,
              child: Text(
                voucher.expiredMonth,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          child: Divider(),
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 2,
            bottom: 2,
          ),
        )
      ],
    );
  }
}
