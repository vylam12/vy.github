import 'package:cuoiki/component/shop_item_classify.dart';
import 'package:cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Map<String, dynamic>> categories = [
    {'icon': Icons.fastfood_sharp, 'label': 'Food'},
    {'icon': Icons.health_and_safety_rounded, 'label': 'Vet Items'},
    {'icon': Icons.pets, 'label': 'Accessories'},
    {'icon': Icons.devices, 'label': 'IOT Devices'},
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop',
          style: GoogleFonts.fredoka(
              fontSize: 25.0,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        backgroundColor: AppColor.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30.0),
            Center(
              child: Container(
                height: 51.0,
                width: 350.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
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
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search keywords..',
                    icon: const Icon(
                      Icons.search,
                      color: AppColor.grey,
                      size: 25.0,
                    ),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.fredoka(
                        fontSize: 16.0,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500, color: AppColor.grey)),
                  ),
                ),
              ),
            ),
            const Gap(20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    categories.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: ShopItemClassify(
                        icon: categories[index]['icon'],
                        hintText: categories[index]['label'],
                        isSelected: selectedCategoryIndex == index,
                      ),
                    ),
                  ),
                ),
                const Gap(20.0),
                Text(
                  'Recommended ${categories[selectedCategoryIndex]['label']}',
                  style: GoogleFonts.fredoka(
                    fontSize: 20.0,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {},
            ))
          ],
        ),
      ),
    );
  }
}
