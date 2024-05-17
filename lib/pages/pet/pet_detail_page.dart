import 'dart:io';

import 'package:cuoiki/component/info_pet_detail.dart';
import 'package:cuoiki/component/status_pet_field.dart';
import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/oval_bottom_clipper.dart';
import '../../models/pet.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({super.key, required this.pet});

  final Pets pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(30),
                      Container(
                        height: 100.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              blurRadius: 43.78,
                              spreadRadius: 0,
                              offset: Offset(0, 5.47),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Gap(20.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pet.name ?? '',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 27.0,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                ),
                                Text(
                                  pet.breedName ?? '',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 17.0,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 6, 78, 87))),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 245, 118, 172),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: const Icon(
                                    Icons.female,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20.0),
                          ],
                        ),
                      ),
                      const Gap(25.0),
                      Row(
                        children: [
                          const Gap(10),
                          const Icon(
                            Icons.pets_outlined,
                            size: 26.27,
                          ),
                          const Gap(5),
                          Text(
                            'About ${pet.name}',
                            style: GoogleFonts.fredoka(
                                fontSize: 19.7,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InfoPetDetail(
                              hintText: 'Age',
                              textPet: '${pet.age}',
                            ),
                            const Gap(10),
                            InfoPetDetail(
                              hintText: 'Weight',
                              textPet: '${pet.weight} kg',
                            ),
                            const Gap(10),
                            InfoPetDetail(
                              hintText: 'Height',
                              textPet: '${pet.height} cm',
                            ),
                            const Gap(10),
                            InfoPetDetail(
                              hintText: 'Color',
                              textPet: '${pet.weight} kg',
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          const Gap(10),
                          const Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            size: 26.27,
                          ),
                          const Gap(5),
                          Text(
                            '${pet.name} Status',
                            style: GoogleFonts.fredoka(
                                fontSize: 19.7,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                      const Gap(20),
                      const StatusPetField(
                        colorBackground: Color.fromRGBO(229, 77, 77, 1),
                        text: 'Contact Vet >',
                        textF: 'Health',
                        icon: Icons.health_and_safety_outlined,
                      ),
                      const Gap(20),
                      const StatusPetField(
                        colorBackground: AppColor.green,
                        icon: Icons.fastfood_outlined,
                        textF: 'Food',
                        text: 'Check food >',
                      ),
                      const Gap(20),
                      const StatusPetField(
                        textF: 'Mood',
                        colorBackground: Color.fromRGBO(229, 77, 77, 1),
                        icon: Icons.mood,
                        text: 'Whistle >',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 6,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: OvalBottomClipper(),
                  child: Image.asset('assets/images/back.jpg'),
                ),
              ),
              Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 253, 255, 253),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: FileImage(
                        File(
                          pet.imgStr?.isNotEmpty == true ? pet.imgStr! : '',
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
