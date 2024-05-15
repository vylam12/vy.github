import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPetDetail extends StatelessWidget {
  const InfoPetDetail(
      {super.key, required this.hintText, required this.textPet});
  final String hintText;
  final String textPet;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      width: 90.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromRGBO(92, 177, 90, 0.28),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromRGBO(79, 144, 166, 1).withOpacity(0),
        //     blurRadius: 1,
        //     spreadRadius: 0,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hintText,
            style: GoogleFonts.fredoka(
                fontSize: 16.0,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(50, 50, 61, 1))),
          ),
          Text(
            textPet,
            style: GoogleFonts.fredoka(
                fontSize: 16.0,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(6, 78, 87, 1),
                )),
          )
        ],
      ),
    );
  }
}
