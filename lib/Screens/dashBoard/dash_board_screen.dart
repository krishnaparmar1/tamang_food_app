import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamang_food_app/Screens/appBar/custom_appbar.dart';
import 'package:tamang_food_app/Screens/bottomBar/custom_bottombar.dart';
import 'package:tamang_food_app/appColor/colors.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class DashboardScreen extends StatefulWidget {
  final String listTiles;

  DashboardScreen({super.key, required this.listTiles});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _formKey = GlobalKey<FormState>();

  // List of image paths for Swiper
  final List<String> swiperImages = [
    'assets/images/Dine.jpeg',
    'assets/images/paneer-veggie-platter.jpg',
    'assets/images/Aqaba-Restaurants.webp',
    'assets/images/the_gate.jpg',
    'assets/images/image.jpg',
    'assets/images/tempeh-salad.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'DELIVERY TO',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.buttonColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 70),
                    Text(
                      '${widget.listTiles}',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 18,
                    ),
                    SizedBox(width: 30),
                    Text(
                      'Filter',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Featured \nPartners',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(color: AppColor.buttonColor),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PartnerCard(
                        imagePath: "assets/images/krispy_coffee.jpg",
                        title: "Krispy Creme",
                        subtitle: "Colorado, San Francisco",
                      ),
                      SizedBox(width: 20),
                      PartnerCard(
                        imagePath: "assets/images/sushi.webp",
                        title: "Mario Italiano",
                        subtitle: "Hay Street, Perth City",
                      ),
                      SizedBox(width: 20),
                      PartnerCard(
                        imagePath: "assets/images/hotdog.jpg",
                        title: "Subway",
                        subtitle: "Katargam, Surat",
                      ),
                      SizedBox(width: 20),
                      PartnerCard(
                        imagePath: "assets/images/pizza-51.jpg",
                        title: "House of Hugah",
                        subtitle: "Mota Varachha, Surat",
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/Banner.png'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Best Picks \nRestaurants by \nteam',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(color: AppColor.buttonColor),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PartnerCard(
                        imagePath: "assets/images/fries.jpg",
                        title: "McDonald's",
                        subtitle: "Colorado, San Francisco",
                      ),
                      SizedBox(width: 20),
                      PartnerCard(
                        imagePath: "assets/images/cake.webp",
                        title: "Cheese Cake",
                        subtitle: "Hay Street, Perth City",
                      ),
                      SizedBox(width: 20),
                      PartnerCard(
                        imagePath: "assets/images/Burger.jpg",
                        title: "BurgerKing",
                        subtitle: "Katargam, Surat",
                      ),
                      SizedBox(width: 20),
                      PartnerCard(
                        imagePath: "assets/images/mojito.jpg",
                        title: "Coffee Culture",
                        subtitle: "Mota Varachha, Surat",
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'All Restaurants',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(color: AppColor.buttonColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Container(
                      height: 200,
                      child: Swiper(
                        layout: SwiperLayout.STACK,
                        pagination: SwiperPagination(
                          alignment: Alignment.bottomRight,
                          builder: RectSwiperPaginationBuilder(
                            color: Colors.white,
                            activeColor: Colors.grey,
                          ),
                        ),
                        itemHeight: 180,
                        itemWidth: 400,
                        scrollDirection: Axis.horizontal,
                        itemCount: swiperImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(swiperImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text('McDonald',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                    Row(
                      children: [
                        Text("\$",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                        ),
                        SizedBox(width: 10),
                        Text('Chinese',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),),
                        SizedBox(width: 10),
                        Text('American',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),),
                        SizedBox(width: 10),
                        Text('Mexican',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("4.3",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.star),
                        SizedBox(width: 5),
                        Text('200+ Rating',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),),
                        SizedBox(width: 10),
                        Icon(Icons.access_time_rounded),
                        SizedBox(width: 5),
                        Text('25 Min',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),),
                        SizedBox(width: 10),
                        Icon(Icons.attach_money),
                        SizedBox(width: 5),
                        Text('Free',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  PartnerCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 190,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: 210,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColor.buttonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '4.5',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text('25 min', style: TextStyle(fontSize: 15)),
                    Text('  Free delivery', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
