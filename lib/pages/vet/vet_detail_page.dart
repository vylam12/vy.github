import 'package:carepet/component/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/oval_bottom_clipper.dart';
import '../../resources/app_color.dart';

class VetDetailPage extends StatelessWidget {
  const VetDetailPage({super.key, this.productItem});
  final dynamic productItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Vet',
              style: GoogleFonts.fredoka(
                  fontSize: 25.0,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white))),
          backgroundColor: AppColor.green,
          centerTitle: true),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: OvalBottomClipper(),
                child: Image.asset(
                  '${productItem.imgUrl}',
                  fit: BoxFit.cover,
                  height: 280,
                ),
              )),
          Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    width: 340,
                    height: 180,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: AppColor.textButton,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: AppColor.textButton,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 43.78,
                          spreadRadius: 0,
                          offset: Offset(0, 5.47),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        Text('${productItem.name}',
                            style: GoogleFonts.fredoka(
                              fontSize: 26.0,
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            )),

                        //rating
                        Row(
                          children: [
                            Text(productItem.rate.toString(),
                                style: GoogleFonts.fredoka(
                                  fontSize: 13.0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black),
                                )),
                            const Gap(4),
                            Row(children: [
                              ...List.generate(
                                5,
                                (index) {
                                  if (index < productItem.rate!.floor()) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColor.yellow,
                                      size: 18.0,
                                    );
                                  } else if (index ==
                                      productItem.rate!.floor()) {
                                    final isHalfStar = productItem.rate! -
                                            productItem.rate!.floor() >=
                                        0.5;
                                    return Icon(
                                      isHalfStar
                                          ? Icons.star_half
                                          : Icons.star_border_outlined,
                                      color: AppColor.yellow,
                                      size: 18.0,
                                    );
                                  } else {
                                    return const Icon(
                                      Icons.star_border,
                                      color: AppColor.yellow,
                                      size: 18.0,
                                    );
                                  }
                                },
                              ),
                            ]),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time_sharp),
                            const Gap(8),
                            Text(
                              productItem.time,
                              style: GoogleFonts.fredoka(
                                fontSize: 13.0,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  AppElevatedButton(
                      height: 60,
                      width: 320,
                      text: 'Book an Appoinment',
                      textColor: AppColor.textButton,
                      color: AppColor.green,
                      borderColor: AppColor.green)
                ],
              )),
        ],
      ),
    );
  }
}
