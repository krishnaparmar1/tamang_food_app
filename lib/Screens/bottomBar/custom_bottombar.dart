import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class CustomBottombar extends StatefulWidget {
  @override
  State<CustomBottombar> createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectIndex,
      selectedItemColor: AppColor.buttonColor,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
