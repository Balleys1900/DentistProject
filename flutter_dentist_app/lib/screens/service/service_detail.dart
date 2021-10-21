import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_item.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/feedback/rating_feedback.dart';
import 'package:flutter_dentist_app/screens/promotion/promotion_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ServiceDetail extends StatelessWidget {
  final Clinic clinic;
  final dynamic service;
  const ServiceDetail({
    Key? key,
    required this.clinic,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(String title, String messageContent) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            content: Text(
              messageContent,
              style: TextStyle(),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Đồng ý'),
                onPressed: () {
                  cart.changeCartItem(clinic.id, service);
                  Fluttertoast.showToast(msg: 'Thay đổi giỏ hàng thành công');
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageBookingItem(
                        clinic: clinic,
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                child: Text('Hủy bỏ'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            clinic.name,
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
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  service['image'],
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            Text(
                              '💲${service['price'].toStringAsFixed(0)}',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black,
                                color: Colors.grey[600],
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              size: 30,
                            ),
                            Text(
                              '💲${(service['price'] * (1 - service['discount'] / 100)).toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              clinic.rating.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.star_rate_sharp,
                              size: 25,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black45,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Chính sách và ưu đãi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromoteWidget(),
                              ),
                            ),
                            child: Text('Xem khuyến mãi'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Khuyến mãi ${service['discount']}% dành cho khách hàng',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Quy trình thực hiện ${service['name']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...service['steps']
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(top: 10, left: 15),
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                Divider(),
                ratingAndFeedback(),
                Divider(
                  color: Colors.black45,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        'Một số dịch vụ khác',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 280.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: clinic.services
                        .map(
                          (service) => renderAnotherServices(
                              service: service, clinic: clinic),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          child: OutlinedButton(
            onPressed: () => {
              if (!cart.isDifferentID(clinic.id))
                {
                  cart.addToCart(service),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageBookingItem(
                        clinic: clinic,
                      ),
                    ),
                  ),
                }
              else
                {
                  _showMyDialog("Bạn đã chọn dịch vụ khác nha khoa!",
                      "Bạn có muốn tạo mới danh sách dịch vụ đã chọn không?"),
                }
            },
            child: Text(
              "Chọn dịch vụ",
              style: TextStyle(
                  color: Colors.cyan[600],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class renderAnotherServices extends StatelessWidget {
  final Clinic clinic;
  final dynamic service;
  const renderAnotherServices({
    Key? key,
    required this.service,
    required this.clinic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServiceDetail(
                  clinic: clinic,
                  service: service,
                ),
              ),
            ),
            splashColor: Colors.brown.withOpacity(0.5),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    service['image'],
                    fit: BoxFit.cover,
                    height: 280,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: Colors.redAccent,
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                      child: Text(
                        '-${service['discount']}%',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(7),
                      child: Text(
                        service['name'],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Text(
                            '💲${service['price'].toStringAsFixed(0)}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black,
                              color: Colors.grey[600],
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 30,
                          ),
                          Text(
                            '💲${(service['price'] * (1 - service['discount'] / 100)).toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
