import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/api/http_service_booking.dart';
import 'package:flutter_dentist_app/cart/Cart.dart';
import 'package:flutter_dentist_app/cart/InstanceTime.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_calendar.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_checkout.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';
import 'package:flutter_dentist_app/model/Voucher.dart';
import 'package:flutter_dentist_app/screens/finalPage/cancel_Booking.dart';
import 'package:flutter_dentist_app/screens/finalPage/success_Booking.dart';
import 'package:intl/intl.dart';

class StepProgress extends StatefulWidget {
  final Clinic clinic;
  StepProgress({Key? key, required this.clinic}) : super(key: key);

  @override
  _StepProgressState createState() => _StepProgressState();
}

class _StepProgressState extends State<StepProgress> {
  int currentStep = 1;
  bool isSelected = false;
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
          content: PageBookingCalendar(
            clinic: widget.clinic,
            selecte: () => setState(
              () {
                isSelected = true;
              },
            ),
            unselect: () => setState(
              () {
                isSelected = false;
              },
            ),
          ),
        ),
        Step(
          state: currentStep == 2 ? StepState.editing : StepState.complete,
          isActive: currentStep >= 2,
          title: Text("Đặt lịch"),
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
                'id': widget.clinic.id,
                'name': widget.clinic.name,
                'image': widget.clinic.image,
                'distance': widget.clinic.distance,
                'rating': widget.clinic.rating,
                'address': widget.clinic.address,
              };
              dynamic userBooking = {
                'username': cart.user!.username,
                'name': cart.user!.name,
                'address': cart.user!.address,
                'avatar': cart.user!.avatar,
              };
              List<dynamic> vouchers = [];
              if (widget.clinic.voucher != null) {
                dynamic voucher = {
                  'id': widget.clinic.voucher!.id,
                  'name': widget.clinic.voucher!.name,
                  'discount': widget.clinic.voucher!.discount,
                  'time': widget.clinic.voucher!.time,
                  'description': widget.clinic.voucher!.description,
                  'startDate': widget.clinic.voucher!.startDate,
                  'expirationDate': widget.clinic.voucher!.expirationDate,
                };
                vouchers.add(voucher);
              }
              if (widget.clinic.voucherTime != null) {
                dynamic voucher = {
                  'id': widget.clinic.voucherTime!.id,
                  'name': widget.clinic.voucherTime!.name,
                  'discount': widget.clinic.voucherTime!.discount,
                  'time': widget.clinic.voucherTime!.time,
                  'description': widget.clinic.voucherTime!.description,
                  'startDate': widget.clinic.voucherTime!.startDate,
                  'expirationDate': widget.clinic.voucherTime!.expirationDate,
                };
                vouchers.add(voucher);
              }
              HttpServiceBooking()
                  .createNewBooking(
                userBooking,
                clinicBooking,
                cart.cartService,
                new DateFormat('dd-MM-yyyy').format(DateTime.now()),
                instanceTime.timeSelect.time,
                new DateFormat('dd-MM-yyyy').format(instanceTime.date),
                instanceTime.timeSelect.hour,
                vouchers,
              )
                  .then(
                (value) {
                  cart.resetCart();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SuccessBooking(),
                      ),
                      (route) => false);
                },
              ).catchError(
                // ignore: invalid_return_type_for_catch_error
                (e) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CancelBooking(),
                    ),
                    (route) => false),
              );
            }
          },
          onStepCancel: () {
            setState(() {
              currentStep -= 1;
            });
            if (currentStep == 0) {
              Navigator.pop(context);
            } else if (currentStep == 1) {
              setState(
                () {
                  isSelected = false;
                },
              );
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
                        onPressed: isSelected ? onStepContinue : null,
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              isSelected ? Colors.orange : Colors.grey,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        child: (isLastStep)
                            ? const Text(
                                'Đặt lịch',
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
