import 'package:flutter/material.dart';
import 'package:food_deliver/common/color_extension.dart';

class CategoryCell extends StatelessWidget {
  final Map cObj;
  final bool isSelect;
  final VoidCallback onPressed;
  const CategoryCell(
      {super.key,
      required this.cObj,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 130,
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isSelect ? TColor.primary : Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Container(
              width: 70,
              height: 70,
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                cObj["icon"].toString(),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            cObj["name"].toString(),
            style: TextStyle(
                color: isSelect ? Colors.white : TColor.text,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ]),
      ),
    );
  }
}
