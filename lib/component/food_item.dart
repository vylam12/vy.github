import 'package:cuoiki/models/food.dart';
import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItem extends StatelessWidget {
  const FoodItem(
    this.food, {
    super.key,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });

  final Function()? onAdd;
  final Function()? onRemove;
  final Function()? onDelete;
  final Foods food;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Gap(10.0),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              food.imgUrl ?? '',
              width: 90.0,
              height: 90.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${food.namefood}',
                  style: GoogleFonts.fredoka(
                      fontSize: 13.0,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500, color: AppColor.green)),
                ),
                Text(
                  '${food.desc}',
                  style: GoogleFonts.fredoka(
                      fontSize: 13.0,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                Text(
                  '${food.weight} g',
                  maxLines: 1,
                  style: GoogleFonts.fredoka(
                      fontSize: 13.0,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400, color: AppColor.grey)),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 57.0,
            width: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppColor.green,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 38.0,
            ),
          ),
          const Gap(20.0),
        ],
      ),
    );
  }
}
