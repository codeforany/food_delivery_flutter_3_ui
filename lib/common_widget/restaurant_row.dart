import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_deliver/common/color_extension.dart';

class RestaurantRow extends StatelessWidget {
  final Map rObj;
  final VoidCallback onPressed;
  const RestaurantRow({super.key, required this.rObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var rateVal = rObj["rating"] as double? ?? 0.0;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: TColor.topAppBar,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                rObj["img"].toString(),
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
                  Text(
                    rObj["name"].toString(),
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    rObj["type"].toString(),
                    style: TextStyle(
                        color: TColor.subTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          initialRating: rateVal,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                        "${rateVal.toString()} (${rObj["reviews"].toString()} Reviews)",
                        style: TextStyle(
                            color: TColor.subTitle,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
