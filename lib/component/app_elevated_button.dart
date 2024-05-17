import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.height,
    required this.width,
    required this.text,
    this.textColor = AppColor.grey,
    required this.color,
    required this.borderColor,
    this.fontSize = 20.0,
  });
  final Function()? onPressed;
  final double height;
  final double width;
  final double fontSize;
  final String text;
  final Color textColor;
  final Color color;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor, width: 1.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.fredoka(
                fontSize: fontSize,
                color: textColor,
              ),
            )),
      ),
    );
  }
}
