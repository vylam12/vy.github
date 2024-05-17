import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_color.dart';

class ShopItemClassify extends StatelessWidget {
  const ShopItemClassify(
      {super.key,
      this.onTap,
      required this.icon,
      required this.hintText,
      required this.isSelected});
  final Function()? onTap;
  final IconData icon;
  final String hintText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 65.0,
              width: 65.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: isSelected
                    ? AppColor.green
                    : const Color.fromRGBO(231, 231, 231, 1),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 30.0,
              ),
            ),
            const Gap(5),
            Text(
              hintText,
              style: GoogleFonts.fredoka(
                  fontSize: 12.0,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400, color: AppColor.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
