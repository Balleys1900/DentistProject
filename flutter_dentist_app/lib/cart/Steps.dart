import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/api/http_service_booking.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/InstanceTime.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_calendar.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_checkout.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_item.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/screens/main/main_widget.dart';
import 'package:intl/intl.dart';

class StepProgress extends StatefulWidget {
  final Clinic clinic;
  StepProgress({Key? key, required this.clinic}) : super(key: key);

  @override
  _StepProgressState createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  int currentStep = 1;
  List<Step> stepList() => [
        Step(
          state: StepState.complete,
          isActive: currentStep >= 0,
          title: Text("Dịch vụ"),
          content: Text('Dich vu'),
        ),
        Step(
          state: currentStep == 1 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 1,
          title: Text("Thời gian"),
          content: PageBookingCalendar(),
        ),
        Step(
          state: currentStep == 2 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 2,
          title: Text("Thanh Toán"),
          content: PageCheckout(clinic: widget.clinic),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Đặt dịch vụ',
            style: TextStyle(
              color: Colors.cyan[600],
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          backgroundColor: Colors.white,
        ),
        body: Stepper(
          type: StepperType.horizontal,
          currentStep: currentStep,
          steps: stepList(),
          onStepContinue: () {
            if (currentStep < (stepList().length - 1)) {
              setState(() {
                currentStep += 1;
              });
            } else {
              dynamic clinicBooking = {
                'name': widget.clinic.name,
                'image': widget.clinic.image,
                'distance': widget.clinic.distance,
                'rating': widget.clinic.rating,
                'address': widget.clinic.address,
              };
              dynamic userBooking = {
                'username': cart.user.username,
                'name': cart.user.name,
                'address': cart.user.address,
                'avatar': cart.user.avatar,
              };
              HttpServiceBooking()
                  .createNewBooking(
                userBooking,
                clinicBooking,
                cart.cartService,
                new DateFormat('dd-MM-yyyy').format(DateTime.now()),
                instanceTime.timeSelect.time,
                new DateFormat('dd-MM-yyyy').format(instanceTime.date),
              )
                  .then((value) {
                cart.resetCart();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MainWidget(),
                    ),
                    (route) => false);
              }).catchError(
                      (e) => print('Booking failed. please pick another time'));
            }
          },
          onStepCancel: () {
            setState(() {
              currentStep -= 1;
            });
            if (currentStep == 0) {
              Navigator.pop(context);
            }
          },
          onStepTapped: (int index) {
            setState(() {
              currentStep = index;
            });
          },
          controlsBuilder: (context, {onStepContinue, onStepCancel}) {
            final isLastStep = currentStep == stepList().length - 1;
            return Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  if (currentStep > 0)
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: onStepCancel,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Quay lại',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: onStepContinue,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        child: (isLastStep)
                            ? const Text(
                                'Thanh toán',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                'Tiếp Tục',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
