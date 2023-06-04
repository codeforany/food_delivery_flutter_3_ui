import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/color_extension.dart';
import '../../common_widget/item_row.dart';

class RestaurantDetailView extends StatefulWidget {
  final Map rObj;
  const RestaurantDetailView({super.key, required this.rObj});

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView> {
  List pageArr = ["Featured items", "Burger", "Pizza", "Side Dishes"];
  List itemArr = [
    {
      "name": "Peri Peri Pizza",
      "detail": "Peri peri chicken, mushroom, black olive, capsicum",
      "price": "\$15",
      "img": "assets/img/9.png"
    },
    {
      "name": "Mexican Pizza",
      "detail": "Peri peri chicken, mushroom, black olive, capsicum",
      "price": "\$18",
      "img": "assets/img/10.png"
    },
    {
      "name": "Chicken Wings",
      "detail": "Peri peri chicken, mushroom, black olive, capsicum",
      "price": "\$9",
      "img": "assets/img/11.png"
    },
    {
      "name": "Crispy Chicken Burger",
      "detail": "Peri peri chicken, mushroom, black olive, capsicum",
      "price": "\$10",
      "img": "assets/img/12.png"
    },
    {
      "name": "Jumbo Burger",
      "detail": "Peri peri chicken, mushroom, black olive, capsicum",
      "price": "\$16",
      "img": "assets/img/12.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var rateVal = widget.rObj["rating"] as double? ?? 0.0;
    return Scaffold(
      body: DefaultTabController(
        length: pageArr.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: TColor.topAppBar,
                  pinned: true,
                  floating: true,
                  expandedHeight: 220,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
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
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(
                                  widget.rObj["img"].toString(),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.rObj["name"].toString(),
                                          style: TextStyle(
                                              color: TColor.text,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: TColor.statusActive,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Text(
                                            "OPEN",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      widget.rObj["type"].toString(),
                                      style: TextStyle(
                                          color: TColor.subTitle,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.timer,
                                                size: 20,
                                                color: TColor.primary,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                widget.rObj["time"].toString(),
                                                style: TextStyle(
                                                    color: TColor.subTitle,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.shopping_bag,
                                                size: 20,
                                                color: TColor.primary,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                widget.rObj["delivery"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: TColor.subTitle,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              IgnorePointer(
                                ignoring: true,
                                child: RatingBar.builder(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemSize: 17,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: TColor.rate,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${rateVal.toString()} (${widget.rObj["reviews"].toString()} Reviews)",
                                style: TextStyle(
                                    color: TColor.subTitle,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "See Reviews",
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: kToolbarHeight + 20,
                        ),
                      ],
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ],
                      ),

                      child: TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        isScrollable: true,
                        indicatorColor: TColor.primary,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: TColor.primary,
                        unselectedLabelColor: TColor.text,
                        unselectedLabelStyle:  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        tabs:  pageArr.map((name) {
                          return Tab(child: Text( name ),);
                        } ).toList())  ,
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              Scaffold(
                body: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                  itemCount: itemArr.length,
                  itemBuilder: (context, index) {
                    var iObj = itemArr[index] as Map? ?? {};
                  return  ItemRow(iObj:iObj);
                }  ),
              ),
              Container(),
              Container(),
              Container(),
            ]),
          ),
        ),
      ),
    );
  }
}
