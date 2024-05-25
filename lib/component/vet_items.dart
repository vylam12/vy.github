import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../resources/app_color.dart';

class VetItems extends StatelessWidget {
  const VetItems({
    super.key,
    required this.nameItem,
    required this.priceItem,
    required this.imageItem,
    this.ratingItem,
    required this.timeItem,
    required this.distanceItem,
    this.onTap,
  });
  final String nameItem;
  final String priceItem;
  final double? ratingItem;
  final String imageItem;
  final String timeItem;
  final String distanceItem;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 170.0,
              width: 320.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(24),
                      // hình ảnh
                      Column(
                        children: [
                          const Gap(10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              imageItem,
                              height: 73.0,
                              width: 89.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      // name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Gap(10),
                            Text(
                              nameItem,
                              style: GoogleFonts.fredoka(
                                fontSize: 20.0,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(children: [
                              ...List.generate(
                                5,
                                (index) {
                                  if (index < ratingItem!.floor()) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColor.yellow,
                                      size: 18.0,
                                    );
                                  } else if (index == ratingItem!.floor()) {
                                    final isHalfStar =
                                        ratingItem! - ratingItem!.floor() >=
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
                              const Gap(10),
                              Text(ratingItem.toString(),
                                  style: GoogleFonts.fredoka(
                                    fontSize: 13.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black),
                                  )),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Gap(50),
                      Text(
                        'OPEN',
                        style: GoogleFonts.fredoka(
                          fontSize: 13.0,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.green),
                        ),
                      ),
                      const Gap(68),
                      const Icon(
                        FontAwesomeIcons.locationDot,
                        size: 18.0,
                        color: AppColor.grey,
                      ),
                      const Gap(3),
                      Text(
                        '${distanceItem} km',
                        style: GoogleFonts.fredoka(
                          fontSize: 13.0,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey),
                        ),
                      ),
                      const Gap(20),
                      const Icon(
                        FontAwesomeIcons.circleDollarToSlot,
                        size: 18.0,
                        color: AppColor.grey,
                      ),
                      const Gap(3),
                      Text(
                        '${priceItem}\$ ',
                        style: GoogleFonts.fredoka(
                          fontSize: 13.0,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey),
                        ),
                      ),
                    ],
                  ),
                  const Gap(18),
                  Row(
                    children: [
                      const Gap(18),
                      const Icon(Icons.access_time_sharp),
                      const Gap(8),
                      Text(
                        timeItem,
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
          ),
        ],
      ),
    );
  }
}
