import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:tamang_food_app/Screens/appBar/custom_appbar.dart';
import 'package:tamang_food_app/Screens/auth/find_location.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class VerifyNumber extends StatefulWidget {
  final String phoneNumber;

  const VerifyNumber({super.key, required this.phoneNumber});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login to Foodly'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Verify phone number',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter the 4-Digit code sent to you at ${widget.phoneNumber}',
                  style: const TextStyle(fontSize: 15, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                OTPTextField(
                    controller: otpController,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    // fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    style: TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    }),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(FindLocation());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColor.buttonColor,
                      ),
                      child: const Text(
                        "CONTINUE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                    'By Signing up you agree to our Terms \nConditions & Privacy Policy.',
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                    textAlign: TextAlign.center),
              ]),
        ),
      ),
    );
  }
}
