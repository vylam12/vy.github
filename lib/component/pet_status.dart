import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/pet.dart';
import '../resources/app_color.dart';

class PetStatus extends StatelessWidget {
  const PetStatus(
    this.pet, {
    super.key,
  });

  final Pets pet;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(20.0),
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.file(
                File(pet.imgStr),
                fit: BoxFit.cover,
              )),
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Health',
                    style: GoogleFonts.fredoka(
                        fontSize: 16.0,
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w400)),
                  ),
                  const Gap(10.0),
                  Container(
                    width: 100,
                    height: 10,
                    decoration: BoxDecoration(
                        color: AppColor.green,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const Gap(30.0),
                  Text(
                    '88%',
                    style: GoogleFonts.inter(
                        fontSize: 13.7,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.green,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Food',
                    style: GoogleFonts.fredoka(
                        fontSize: 16.0,
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w400)),
                  ),
                  const Gap(22.0),
                  Container(
                    width: 41,
                    height: 10,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(229, 77, 77, 1.0),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const Gap(92.0),
                  Text('41%',
                      style: GoogleFonts.inter(
                          fontSize: 13.7,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(229, 77, 77, 1.0),
                          ))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mood',
                    style: GoogleFonts.fredoka(
                        fontSize: 16.0,
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w400)),
                  ),
                  const Gap(17.0),
                  Container(
                    width: 51,
                    height: 10,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(229, 77, 77, 1.0),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const Gap(82.0),
                  Text(
                    '51%',
                    style: GoogleFonts.inter(
                        fontSize: 13.7,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(229, 77, 77, 1.0),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
