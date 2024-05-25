import 'package:carepet/pages/vet/vet_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/shop_item_classify.dart';
import '../../component/vet_items.dart';
import '../../models/boarding_pet.dart';
import '../../models/grooming.dart';
import '../../models/veterinarian.dart';
import '../../resources/app_color.dart';

class VetPage extends StatefulWidget {
  const VetPage({super.key});

  @override
  State<VetPage> createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  int selectedCategoryIndex = 0;
  List<Map<String, dynamic>> label = [
    {'icon': Icons.health_and_safety_outlined, 'label': 'Veterinary'},
    {'icon': Icons.clean_hands_outlined, 'label': 'Grooming'},
    {'icon': Icons.house_outlined, 'label': 'Boarding'},
  ];
  List<Map<String, dynamic>> product = [
    {'veterinariansList': veterinariansList},
    {'groomingList': groomingList},
    {'boardingPetList': boardingPetList}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vet',
          style: GoogleFonts.fredoka(
              fontSize: 25.0,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        backgroundColor: AppColor.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Gap(30.0),
            Text(
              'Hello, How may I help you ?',
              style: GoogleFonts.fredoka(
                  fontSize: 20.0,
                  textStyle: const TextStyle(fontWeight: FontWeight.w500)),
            ),
            const Gap(30.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    label.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: ShopItemClassify(
                        icon: label[index]['icon'],
                        hintText: label[index]['label'],
                        isSelected: selectedCategoryIndex == index,
                      ),
                    ),
                  ),
                ),
                const Gap(20.0),
                const Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                const Gap(5.0),
                Text(
                  'Recommended ${label[selectedCategoryIndex]['label']}',
                  style: GoogleFonts.fredoka(
                    fontSize: 20.0,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: product[selectedCategoryIndex].values.first.length,
                itemBuilder: (BuildContext context, int index) {
                  final List<dynamic> productList =
                      product[selectedCategoryIndex].values.first;
                  final dynamic productItem = productList[index];
                  //hiển thị item
                  if (productItem is Veterinarians) {
                    final Veterinarians veterinarians = productItem;
                    return VetItems(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VetDetailPage(
                              productItem: veterinarians,
                            ),
                          ),
                        );
                      },
                      nameItem: veterinarians.name ?? '',
                      priceItem: veterinarians.price?.toStringAsFixed(0) ?? '',
                      imageItem: veterinarians.imgUrl ?? '',
                      ratingItem: veterinarians.rate,
                      timeItem: veterinarians.time ?? '',
                      distanceItem: veterinarians.distance.toString(),
                    );
                  } else if (productItem is Grooming) {
                    final Grooming grooming = productItem;
                    return VetItems(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VetDetailPage(
                              productItem: grooming,
                            ),
                          ),
                        );
                      },
                      nameItem: grooming.name ?? '',
                      ratingItem: grooming.rate,
                      priceItem: grooming.price?.toStringAsFixed(0) ?? '',
                      imageItem: grooming.imgUrl ?? '',
                      timeItem: grooming.time ?? '',
                      distanceItem: grooming.distance.toString(),
                    );
                  } else if (productItem is BoardingPet) {
                    final BoardingPet boardingPet = productItem;
                    return VetItems(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VetDetailPage(
                              productItem: boardingPet,
                            ),
                          ),
                        );
                      },
                      distanceItem: boardingPet.distance.toString(),
                      ratingItem: boardingPet.rate,
                      nameItem: boardingPet.name ?? '',
                      priceItem: boardingPet.price?.toStringAsFixed(0) ?? '',
                      imageItem: boardingPet.imgUrl ?? '',
                      timeItem: boardingPet.time ?? '',
                    );
                  }
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 0,
                    childAspectRatio: 3.9 / 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
