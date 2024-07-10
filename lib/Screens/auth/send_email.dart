import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamang_food_app/Screens/appBar/custom_appbar.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20 , 17 , 20 , 0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset email sent',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                          text: 'We have sent a instructions email to \nsajin tamang@figma.com.',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                        WidgetSpan(
                          child: SizedBox(width: 10),
                        ),
                        TextSpan(
                          text: 'Having problem?',
                          style: TextStyle(fontSize: 15, color: AppColor.buttonColor),
                        )
                      ]
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColor.buttonColor,
                      ),
                      child: Text(
                        "SEND AGAIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 5),
                Image.asset('assets/images/Doodles.png'),
              ]
          ),
        ),
      ),
    );
  }
}