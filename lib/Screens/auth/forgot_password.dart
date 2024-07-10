import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamang_food_app/Screens/appBar/custom_appbar.dart';
import 'package:tamang_food_app/Screens/auth/send_email.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? email;
  bool _isEmailValid = false;

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                'Enter your email address and we will \nsend you a reset instructions.',
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL ADDRESS',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Please enter your email',
                ),
                autofillHints: [AutofillHints.email],
                onChanged: _validateEmail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(SendEmail());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColor.buttonColor,
                    ),
                    child: Text(
                      "RESET PASSWORD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
