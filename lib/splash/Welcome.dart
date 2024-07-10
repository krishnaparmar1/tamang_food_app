import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tamang_food_app/appColor/colors.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tamang_food_app/splash/Welcome.dart';
import 'package:tamang_food_app/splash/second_screen.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.to(SecondScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/bg.png"),
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 50)),
                const Row(
                  children: [
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(120, 0, 0, 0)),
                        Image(image: AssetImage("assets/images/g12.png")),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\t\t Tamang\nFoodService",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 37,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Image.asset("assets/images/Illustration.png"),
                ),
                const Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 12)),
                    Text(
                      "It’s a pleasure to meet you. We are \nexcited that you’re here so let’s get \nstarted!",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(SecondScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColor.buttonColor,
                    ),
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
