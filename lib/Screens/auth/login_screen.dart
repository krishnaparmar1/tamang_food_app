import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tamang_food_app/Screens/appBar/custom_appbar.dart';
import 'package:tamang_food_app/appColor/colors.dart';
import 'verify_number.dart'; // Import the VerifyNumber screen

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? number;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Navigate to VerifyNumber screen
      Get.to(() => VerifyNumber(phoneNumber: number!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login to Tamang Food \nServices'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Get started with Foodly',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter your phone number to use foodly and \nenjoy your food :)',
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 10),
                IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  initialCountryCode: 'IN', // Use the correct country code
                  onChanged: (phone) {
                    setState(() {
                      number = phone.completeNumber;
                    });
                  },
                  validator: (phone) {
                    if (phone == null || phone.completeNumber.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Get.height / 6),
                Center(
                  child: Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColor.buttonColor,
                      ),
                      child: const Text(
                        "SIGN UP",
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
      ),
    );
  }
}
