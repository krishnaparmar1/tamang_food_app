import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamang_food_app/Screens/auth/nearest_location.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class FindLocation extends StatefulWidget {
  const FindLocation({super.key});

  @override
  State<FindLocation> createState() => _FindLocationState();
}

class _FindLocationState extends State<FindLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Find restaurants near you',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                'Please enter your location or allow access to \nyour location to find restaurants near you.',
                style: TextStyle(fontSize: 15, color: Colors.black45),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 45,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Get.to(NearestLocation());
                      },
                      icon: Icon(
                        CupertinoIcons.location_fill,
                        color: AppColor.buttonColor,
                        size: 18,
                      ),
                      label: Text(
                        'Use current location',
                        style: TextStyle(
                          color: AppColor.buttonColor,
                          fontSize: 15,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColor.buttonColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.to(NearestLocation());
                      },
                      icon: Icon(
                        CupertinoIcons.location_solid,
                        color: Colors.grey.shade600,
                        size: 18,
                      ),
                      label: Text(
                        "Enter a new address",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.grey.shade50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
