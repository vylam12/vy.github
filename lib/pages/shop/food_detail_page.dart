import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/app_elevated_button.dart';
import '../../component/oval_bottom_clipper.dart';
import '../../resources/app_color.dart';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage({super.key, this.productItem});
  final dynamic productItem;
  int _quantity = 1;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cart',
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
                  '${widget.productItem.imgUrl}',
                  fit: BoxFit.contain,
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
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: AppColor.textButton,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColor.textButton),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 43.78,
                            spreadRadius: 0,
                            offset: Offset(0, 5.47)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        Text('${widget.productItem.name}',
                            style: GoogleFonts.fredoka(
                              fontSize: 20.0,
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            )),
                        Gap(7),
                        Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.circleDollarToSlot,
                            ),
                            const Gap(8),
                            Text(
                              widget.productItem.price.toString(),
                              style: GoogleFonts.fredoka(
                                fontSize: 14.0,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.grey),
                              ),
                            ),
                            Spacer(),
                            Text(widget.productItem.rate.toString(),
                                style: GoogleFonts.fredoka(
                                  fontSize: 14.0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black),
                                )),
                            const Gap(4),
                            Row(children: [
                              ...List.generate(
                                5,
                                (index) {
                                  if (index <
                                      widget.productItem.rate!.floor()) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColor.yellow,
                                      size: 20.0,
                                    );
                                  } else if (index ==
                                      widget.productItem.rate!.floor()) {
                                    final isHalfStar = widget
                                                .productItem.rate! -
                                            widget.productItem.rate!.floor() >=
                                        0.5;
                                    return Icon(
                                      isHalfStar
                                          ? Icons.star_half
                                          : Icons.star_border_outlined,
                                      color: AppColor.yellow,
                                      size: 20.0,
                                    );
                                  } else {
                                    return const Icon(
                                      Icons.star_border,
                                      color: AppColor.yellow,
                                      size: 20.0,
                                    );
                                  }
                                },
                              ),
                            ]),
                          ],
                        ),
                        const Gap(8),
                        Text(
                            'Quantity available: ${widget.productItem.quantity}'),
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    width: 340,
                    child: Text(
                      '${widget.productItem.desc}',
                      style: GoogleFonts.fredoka(
                          fontSize: 13.0,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              )),
          Positioned(
              right: 0,
              left: 0,
              bottom: 20.0,
              child: Column(
                children: [
                  Container(
                    width: 340,
                    child: Row(
                      children: [
                        Text(
                          'Quantity',
                          style: GoogleFonts.fredoka(
                              fontSize: 16.0,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.grey)),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            if (widget._quantity > 1) {
                              setState(() {
                                widget._quantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove, color: AppColor.green),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '${widget._quantity}',
                            style: GoogleFonts.fredoka(
                                fontSize: 20.0,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black)),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            widget._quantity < widget.productItem.quantity
                                ? setState(() {
                                    widget._quantity++;
                                  })
                                : setState(() {
                                    widget._quantity =
                                        widget.productItem.quantity;
                                  });
                          },
                          icon: const Icon(Icons.add, color: AppColor.green),
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  const AppElevatedButton(
                      height: 60,
                      width: 320,
                      fontSize: 17,
                      text: 'Add to cart',
                      textColor: AppColor.textButton,
                      color: AppColor.green,
                      borderColor: AppColor.green)
                ],
              ))
        ],
      ),
    );
  }
}
