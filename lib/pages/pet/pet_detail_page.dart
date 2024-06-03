import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/info_pet_detail.dart';
import '../../component/oval_bottom_clipper.dart';
import '../../component/status_pet_field.dart';
import '../../models/pet.dart';
import '../../resources/app_color.dart';
import '../home/dashboard_page.dart';
import 'update_pet_detail_page.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({super.key, required this.pet, required this.userId});

  final Pets pet;
  final int userId;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoardPage(userId: userId),
                ),
              );
            },
          ),
        ),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      pet.name ?? '',
                                      style: GoogleFonts.fredoka(
                                          fontSize: 27.0,
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    const Gap(10),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdatePetDetailPage(
                                                      petId: pet.id!,
                                                      userId: userId,
                                                    )));
                                      },
                                      child: const Icon(
                                          FontAwesomeIcons.penToSquare,
                                          size: 20),
                                    ),
                                  ],
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
                                (pet.gender == 'Female')
                                    ? Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: AppColor.pink,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: const Icon(
                                          Icons.female,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: AppColor.blue,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: const Icon(
                                          Icons.male,
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
                              textPet: '${pet.color}',
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          const Gap(10),
                          const Icon(Icons.sentiment_satisfied_alt_outlined,
                              size: 26.27),
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
                          pet.imgStr!.isNotEmpty ? pet.imgStr! : '',
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
