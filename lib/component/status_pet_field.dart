import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusPetField extends StatelessWidget {
  const StatusPetField(
      {super.key,
      required this.colorBackground,
      required this.text,
      required this.icon,
      required this.textF});
  final Color colorBackground;
  final String text;
  final String textF;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            color: colorBackground,
          ),
          child: Icon(
            icon,
            size: 38.0,
            color: Colors.white,
          ),
        ),
        const Gap(10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textF,
              style: GoogleFonts.fredoka(
                  fontSize: 14.0,
                  textStyle: const TextStyle(fontWeight: FontWeight.w500)),
            ),
            Text(
              'Abnormal',
              style: GoogleFonts.fredoka(
                  fontSize: 14.0,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(119, 119, 119, 1))),
            ),
            Text(
              'Last Vaccinated (2mon Ago)',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.fredoka(
                  fontSize: 11.0,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600, color: AppColor.green)),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 45.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colorBackground,
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.fredoka(
                  fontSize: 12.3,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
