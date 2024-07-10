import 'package:flutter/material.dart';
import 'package:tamang_food_app/appColor/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // iconTheme:  IconThemeData(
      //     color: AppColor.buttonColor,
      // ),
      // leading: Icon(Icons.close),
      title: Text(title,textAlign: TextAlign.center,),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
