import 'package:flutter/material.dart';
import 'package:flutter_dentist_app/cart/screens/page_booking_calendar.dart';
import 'package:flutter_dentist_app/model/Clinic.dart';

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
          content: Text('Booking'),
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
          content: Text('Dịch vụ'),
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
            print('Yup');
            if (currentStep < (stepList().length - 1)) {
              setState(() {
                currentStep += 1;
              });
            } else {
              print('Submited');
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
              child: Row(
                children: [
                  if (currentStep > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onStepCancel,
                        child: const Text('Back'),
                      ),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onStepContinue,
                      child: (isLastStep)
                          ? const Text('Thanh toán')
                          : const Text('Next'),
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
