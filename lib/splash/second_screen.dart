import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tamang_food_app/Screens/auth/signin_screen.dart';
import 'package:tamang_food_app/Screens/auth/signin_screen.dart';

import '../appColor/colors.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List<Map<String, dynamic>> pageList = [
    {
      "image": "assets/images/Illustrations_2.png",
      "text": "All your favorites",
      "subText": "Order from the best local restaurants \nwith easy, on-demand delivery.",
    },
    {
      "image": "assets/images/bike.png",
      "text": "Free delivery offers",
      "subText": "Free delivery for new customers via Apple Pay \nand others payment methods.",
    },
    {
      "image": "assets/images/pizza.png",
      "text": "Choose your food",
      "subText": "Easily find your type of food craving and you’ll \nget delivery in wide range.",
    }
  ];
  //
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      pageList.length,
          (index) => Container(
        // padding: EdgeInsets.symmetric(horizontal: 20,),
        // margin: EdgeInsets.only(left: 15,right: 15),
        height: Get.height / 3,
        child: Column(
          children: [
            Image.asset(pageList[index]["image"]),
            SizedBox(height: 40), // Added SizedBox for extra height before text
            Column(
              children: [
                Text(
                  "${pageList[index]["text"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  "${pageList[index]["subText"]}",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(15)),
          SizedBox(height: 35),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Image.asset("assets/images/g12.png"),
              ),
              SizedBox(width: 20),
              Text(
                "\t\t Tamang\nFoodService",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          SmoothPageIndicator(
            axisDirection: Axis.horizontal,
            controller: controller,
            count: pages.length,
            effect: const WormEffect(
              dotHeight: 6,
              dotWidth: 18,
              activeDotColor: Color(0xff22A45D),
              type: WormType.thinUnderground,
            ),
          ),

          SizedBox(height: 20),
          Container(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Get.to(SignIn());
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
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

