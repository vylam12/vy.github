import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../SQLite/database_helper.dart';
import '../../component/dog_field.dart';
import '../../component/food_item.dart';
import '../../component/pet_status.dart';
import '../../models/food.dart';
import '../../models/pet.dart';
import '../../resources/app_color.dart';
import '../pet/add_pet_page.dart';
import '../pet/pet_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userId});
  final int userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pets> _pets = [];
  final db = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    _loadPets();
    setState(() {});
  }

  Future<void> _loadPets() async {
    var pets = await db.getPetsByUserId(widget.userId);
    if (pets != null) {
      setState(() {
        _pets = pets;
      });
    }
  }

  void _navigateToPetDetail(Pets pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetDetailPage(pet: pet),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.green,
        title: const Text('Hey'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
            top: MediaQuery.of(context).padding.top + 20.0, bottom: 20.0),
        child: Column(
          children: [
            (_pets.isNotEmpty)
                ? Container(
                    height: 190.0,
                    width: 400.0,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        Row(
                          children: [
                            const Gap(10),
                            const Icon(
                              Icons.pets_outlined,
                            ),
                            const Gap(5),
                            Text(
                              'My Pet',
                              style: GoogleFonts.fredoka(
                                  fontSize: 19.0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                        const Gap(10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(10),
                              for (var pet in _pets)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: DogField(
                                    onTap: () => _navigateToPetDetail(pet),
                                    petName: pet.name ?? '',
                                    petImage: pet.imgStr?.isNotEmpty == true
                                        ? pet.imgStr!
                                        : '',
                                  ),
                                ),
                              const Gap(10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 190.0,
                    width: 400.0,
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
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(
                                Icons.pets_outlined,
                              ),
                              const Gap(5),
                              Text(
                                'My Pet',
                                style: GoogleFonts.fredoka(
                                    fontSize: 19.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          const Gap(20.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AddPetPage(userId: widget.userId)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 23.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                color: AppColor.green,
                                child: Container(
                                  width: 90.0,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border:
                                          Border.all(style: BorderStyle.none)),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColor.green,
                                    size: 50.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            const Gap(20),
            (_pets.isNotEmpty)
                ? Container(
                    width: 400.0,
                    height: 200.0,
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
                    child: Column(
                      children: [
                        const Gap(20),
                        Row(
                          children: [
                            const Gap(10),
                            const Icon(
                              Icons.mood_outlined,
                            ),
                            const Gap(5),
                            Text(
                              'Pet Status',
                              style: GoogleFonts.fredoka(
                                  fontSize: 19.0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                        const Gap(20.0),
                        Expanded(
                          child: PageView.builder(
                            itemCount: _pets.length,
                            itemBuilder: (context, index) {
                              final pet = _pets[index];
                              return PetStatus(pet);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    width: 400.0,
                    height: 200.0,
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
                    child: Column(
                      children: [
                        const Gap(20),
                        Row(
                          children: [
                            const Gap(10),
                            const Icon(
                              Icons.mood_outlined,
                            ),
                            const Gap(5),
                            Text(
                              'Pet Status',
                              style: GoogleFonts.fredoka(
                                  fontSize: 19.0,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                        const Gap(40.0),
                        const Text('Không có pet')
                      ],
                    ),
                  ),
            const Gap(20),
            Container(
                height: 190.0,
                width: 400.0,
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
                child: (_pets.isNotEmpty)
                    ? Column(
                        children: [
                          const Gap(20.0),
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(
                                Icons.fastfood_rounded,
                              ),
                              const Gap(5),
                              Text(
                                'Pet Food',
                                style: GoogleFonts.fredoka(
                                    fontSize: 19.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          Expanded(
                            child: PageView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: foods.length,
                              itemBuilder: (context, index) {
                                final food = foods[index];
                                return FoodItem(food);
                              },
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          const Gap(20.0),
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(
                                Icons.fastfood_rounded,
                              ),
                              const Gap(5),
                              Text(
                                'Pet Food',
                                style: GoogleFonts.fredoka(
                                    fontSize: 19.0,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                          const Gap(30.0),
                          const Text('Chưa có thức ăn cho pet'),
                        ],
                      )),
          ],
        ),
      ),
    );
  }
}
