import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ItemRow extends StatelessWidget {
  final Map iObj;
  const ItemRow({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [

            ClipRRect(borderRadius: BorderRadius.circular(15) , child: 
             Image.asset(
                iObj["img"].toString(),
                fit: BoxFit.cover,
                width: 80,
                  height: 80,
              ),
            
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    iObj["name"].toString(),
                    maxLines: 1,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    iObj["detail"].toString(),
                    maxLines: 2,
                    style: TextStyle(
                        color: TColor.subTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

             const SizedBox(
            width: 4,
          ),

          Text(
            iObj["price"].toString(),
           
            style: TextStyle(
                color: TColor.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),

          ],
        ),
      
    );
  }
}
