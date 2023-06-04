import 'package:flutter/material.dart';
import 'package:food_deliver/common/color_extension.dart';

import '../../common_widget/category_cell.dart';
import '../../common_widget/restaurant_row.dart';
import '../restaurants/restaurant_detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectCat = 0;

  List categoryArr = [
    {"name": "Restaurants", "icon": "assets/img/1.png"},
    {"name": "Food", "icon": "assets/img/2.png"},
    {"name": "Drinks", "icon": "assets/img/3.png"}
  ];

  List restaurantArr = [
    {
      "name": "Hungry Station",
      "type": "Indian & Chinese",
      "rating": 4.9,
      "reviews": 72,
      "img": "assets/img/4.png",
      "time": "25 mins",
      "delivery": "Free Delivery"
    },
    {
      "name": "Mr. Chef Kitchen",
      "type": "Snacks",
      "rating": 4.7,
      "reviews": 54,
      "img": "assets/img/5.png",
      "time": "20 mins",
      "delivery": "Free Delivery"
    },
    {
      "name": "Coffee Cabana",
      "type": "Coffee Shop",
      "rating": 4.6,
      "reviews": 109,
      "img": "assets/img/6.png",
      "time": "15 mins",
      "delivery": "Free Delivery"
    },
    {
      "name": "Salt Bae",
      "type": "Pizza & Burger",
      "rating": 4.6,
      "reviews": 86,
      "img": "assets/img/7.png",
      "time": "30 mins",
      "delivery": "Free Delivery"
    },
    {
      "name": "Hungry Station",
      "type": "Indian & Chinese",
      "rating": 4.9,
      "reviews": 72,
      "img": "assets/img/8.png",
      "time": "30 mins",
      "delivery": "Free Delivery"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.sort,
                size: 25,
                color: TColor.text,
              ),
            ),
            actions: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                      color: TColor.text,
                    ),
                  ),
                  Container(
                    width: 18,
                    height: 18,
                    margin: const EdgeInsets.only(top: 15, right: 8),
                    decoration: BoxDecoration(
                        color: TColor.primary,
                        borderRadius: BorderRadius.circular(9)),
                    alignment: Alignment.center,
                    child: const Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Deliver to",
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 25,
                  color: TColor.subTitle,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "Kazi Ilias, Zindabazar, Sylhet",
                  style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ]),
            child: const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for restaurants, food etc"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: categoryArr.length,
                itemBuilder: (context, index) {
                  var cObj = categoryArr[index] as Map? ?? {};

                  return CategoryCell(
                      cObj: cObj,
                      isSelect: selectCat == index,
                      onPressed: () {
                        setState(() {
                          selectCat = index;
                        });
                      });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Popular restaurants",
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: restaurantArr.map((rObj) {
                  return RestaurantRow(
                    rObj: rObj,
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailView(rObj
                      :rObj) ));
                    },
                  );
                }).toList(),
              ))
        ]),
      ),
    );
  }
}
