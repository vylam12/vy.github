import 'package:carepet/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.nameProduct,
      required this.imageProduct,
      required this.priceProduct,
      required this.weight,
      required this.onTap});
  final String nameProduct;
  final String priceProduct;
  final String weight;
  final String imageProduct;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            height: 234.0,
            width: 181.0,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 94.0,
                      width: 91.0,
                      child: Image.asset(
                        imageProduct,
                        fit: BoxFit.cover,
                      )),
                  const Gap(10),
                  Text(
                    priceProduct,
                    style: GoogleFonts.fredoka(
                      fontSize: 13.0,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500, color: AppColor.green),
                    ),
                  ),
                  Text(
                    nameProduct,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.fredoka(
                      fontSize: 16.0,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(weight,
                      style: GoogleFonts.fredoka(
                          fontSize: 13.0,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey))),
                  const Divider(
                      thickness: 1, color: Color.fromARGB(255, 226, 226, 226)),
                  GestureDetector(
                    onTap: onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColor.green,
                        ),
                        const Gap(5),
                        Text('Add to cart',
                            style: GoogleFonts.fredoka(
                                fontSize: 14.0,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
